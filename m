From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net v5] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Tue, 05 Jul 2022 10:43:44 +0200
Message-ID: <4a95703c5c1a09e3ed1a64ddf83e65e222326214.camel@redhat.com>
References: <20220702075718.25121-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657010629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZy/nxlcdzOmZXOvcCR//qWGLqmbIlGg7XXJRIbpjK0=;
        b=Q4k8p5OlrVZ9uc7Rwl7InccRx03B/hUAueBrdAdJmGSOWFeAgjAAfBaOGMc3EMXHRlIpHz
        j01zptQDlwhfB++HgGXMn9MEX9g94dD3k6Y3yccLYob3I+IJ57/eRVV+jXMazXe+w0l+9x
        5FGI3IKTfuWLMgEE9ZFUODI8tHd6eLg=
In-Reply-To: <20220702075718.25121-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2022-07-02 at 15:57 +0800, Duoming Zhou wrote:
> When the link layer connection is broken, the rose->neighbour is
> set to null. But rose->neighbour could be used by rose_connection()
> and rose_release() later, because there is no synchronization among
> them. As a result, the null-ptr-deref bugs will happen.
> 
> One of the null-ptr-deref bugs is shown below:
> 
>     (thread 1)                  |        (thread 2)
>                                 |  rose_connect
> rose_kill_by_neigh              |    lock_sock(sk)
>   spin_lock_bh(&rose_list_lock) |    if (!rose->neighbour)
>   rose->neighbour = NULL;//(1)  |
>                                 |    rose->neighbour->use++;//(2)
> 
> The rose->neighbour is set to null in position (1) and dereferenced
> in position (2).
> 
> The KASAN report triggered by POC is shown below:
> 
> KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
> ...
> RIP: 0010:rose_connect+0x6c2/0xf30
> RSP: 0018:ffff88800ab47d60 EFLAGS: 00000206
> RAX: 0000000000000005 RBX: 000000000000002a RCX: 0000000000000000
> RDX: ffff88800ab38000 RSI: ffff88800ab47e48 RDI: ffff88800ab38309
> RBP: dffffc0000000000 R08: 0000000000000000 R09: ffffed1001567062
> R10: dfffe91001567063 R11: 1ffff11001567061 R12: 1ffff11000d17cd0
> R13: ffff8880068be680 R14: 0000000000000002 R15: 1ffff11000d17cd0
> ...
> Call Trace:
>   <TASK>
>   ? __local_bh_enable_ip+0x54/0x80
>   ? selinux_netlbl_socket_connect+0x26/0x30
>   ? rose_bind+0x5b0/0x5b0
>   __sys_connect+0x216/0x280
>   __x64_sys_connect+0x71/0x80
>   do_syscall_64+0x43/0x90
>   entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> This patch adds lock_sock() in rose_kill_by_neigh() in order to
> synchronize with rose_connect() and rose_release().
> 
> Meanwhile, this patch adds sock_hold() protected by rose_list_lock
> that could synchronize with rose_remove_socket() in order to mitigate
> UAF bug caused by lock_sock() we add.
> 
> What's more, there is no need using rose_neigh_list_lock to protect
> rose_kill_by_neigh(). Because we have already used rose_neigh_list_lock
> to protect the state change of rose_neigh in rose_link_failed(), which
> is well synchronized.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v5:
>   - v5: Use socket lock to protect comparison in rose_kill_by_neigh.
> 
>  net/rose/af_rose.c    | 12 ++++++++++++
>  net/rose/rose_route.c |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index bf2d986a6bc..6d5088b030a 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -165,14 +165,26 @@ void rose_kill_by_neigh(struct rose_neigh *neigh)
>  	struct sock *s;
>  
>  	spin_lock_bh(&rose_list_lock);
> +again:
>  	sk_for_each(s, &rose_list) {
>  		struct rose_sock *rose = rose_sk(s);
>  
> +		sock_hold(s);
> +		spin_unlock_bh(&rose_list_lock);
> +		lock_sock(s);
>  		if (rose->neighbour == neigh) {
>  			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
>  			rose->neighbour->use--;

Note that the code can held different socket lock while updating
'neighbour->use'. That really means that such updates can really race
each other, with bad results.

I think the only safe way out is using an atomic_t for 'neighbour->use'
(likely a refcount_t would be a better option).

All the above deserves a separate patch IMHO.

>  			rose->neighbour = NULL;
> +			release_sock(s);
> +			sock_put(s);
> +			spin_lock_bh(&rose_list_lock);
> +			goto again;

This chunk is dup of the following lines, it could be dropped...

>  		}
> +		release_sock(s);
> +		sock_put(s);
> +		spin_lock_bh(&rose_list_lock);
> +		goto again;

... if this would be correct, which apparently is not.

What happens when 'rose->neighbour' is different from 'neigh' for first
socket in rose_list?

Cheers,

Paolo

