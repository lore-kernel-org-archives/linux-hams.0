From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next] ax25: Fix deadlock caused by skb_recv_datagram
 in ax25_recvmsg
Date: Mon, 6 Jun 2022 10:31:49 -0700
Message-ID: <CANn89i+HbdWS4JU0odCbRApuCTGFAt9_NSUoCSFo-b4-z0uWCQ@mail.gmail.com>
References: <20220606162138.81505-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4C9WpLUh/VIc8qz9wWANgWf77RNe31qiFw7MR8/RHI=;
        b=apHOPXnRIiSdZ45R4m8vufwr+NeG8y1pzCQXi+GrC852y1Xl9f9LsfqG9me1qaLzoh
         8+ABu67BD5sTDqxowSSwbPqKxcasK8w2GAsOqdSP0hLndoa0EtCa2+BwsK2gFolE4pHK
         MyQA5SJMyqdvkrg6txryVjkZMms3+fW2PzqSTz7GiB2iJhkpr/BfDOR+nBYFU0BI/U35
         Kvzf3ek1xq8H44vc7oevhKT4Zc3yt1djSQEpcGAcQljoe/1v37kRRBZRf+k3acRGyM9L
         YYr+/T8gGjQ1wsfAe7i6SArugJMmB9kO930+XrArPjwuVhqfo33/MTTBi20KocaK+jXW
         cGHQ==
In-Reply-To: <20220606162138.81505-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, jreuter@yaina.de, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, linux-hams@vger.kernel.org, thomas@osterried.de

On Mon, Jun 6, 2022 at 9:21 AM Duoming Zhou <duoming@zju.edu.cn> wrote:
>
> The skb_recv_datagram() in ax25_recvmsg() will hold lock_sock
> and block until it receives a packet from the remote. If the client
> doesn`t connect to server and calls read() directly, it will not
> receive any packets forever. As a result, the deadlock will happen.
>
> The fail log caused by deadlock is shown below:
>
> [  861.122612] INFO: task ax25_deadlock:148 blocked for more than 737 seconds.
> [  861.124543] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  861.127764] Call Trace:
> [  861.129688]  <TASK>
> [  861.130743]  __schedule+0x2f9/0xb20
> [  861.131526]  schedule+0x49/0xb0
> [  861.131640]  __lock_sock+0x92/0x100
> [  861.131640]  ? destroy_sched_domains_rcu+0x20/0x20
> [  861.131640]  lock_sock_nested+0x6e/0x70
> [  861.131640]  ax25_sendmsg+0x46/0x420
> [  861.134383]  ? ax25_recvmsg+0x1e0/0x1e0
> [  861.135658]  sock_sendmsg+0x59/0x60
> [  861.136791]  __sys_sendto+0xe9/0x150
> [  861.137212]  ? __schedule+0x301/0xb20
> [  861.137710]  ? __do_softirq+0x4a2/0x4fd
> [  861.139153]  __x64_sys_sendto+0x20/0x30
> [  861.140330]  do_syscall_64+0x3b/0x90
> [  861.140731]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  861.141249] RIP: 0033:0x7fdf05ee4f64
> [  861.141249] RSP: 002b:00007ffe95772fc0 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
> [  861.141249] RAX: ffffffffffffffda RBX: 0000565303a013f0 RCX: 00007fdf05ee4f64
> [  861.141249] RDX: 0000000000000005 RSI: 0000565303a01678 RDI: 0000000000000005
> [  861.141249] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [  861.141249] R10: 0000000000000000 R11: 0000000000000246 R12: 0000565303a00cf0
> [  861.141249] R13: 00007ffe957730e0 R14: 0000000000000000 R15: 0000000000000000
>
> This patch moves the skb_recv_datagram() before lock_sock() in order
> that other functions that need lock_sock could be executed.
>


Why is this targeting net-next tree ?

1) A fix should target net tree
2) It should include a Fixes: tag

Also:
- this patch bypasses tests in ax25_recvmsg()
- This might break applications depending on blocking read() operations.

I feel a real fix is going to be slightly more difficult than that.

Thank you

> Reported-by: Thomas Habets <thomas@@habets.se>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  net/ax25/af_ax25.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 95393bb2760..02cd6087512 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1665,6 +1665,11 @@ static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>         int copied;
>         int err = 0;
>
> +       /* Now we can treat all alike */
> +       skb = skb_recv_datagram(sk, flags, &err);
> +       if (!skb)
> +               goto done;
> +
>         lock_sock(sk);
>         /*
>          *      This works for seqpacket too. The receiver has ordered the
> @@ -1675,11 +1680,6 @@ static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>                 goto out;
>         }
>
> -       /* Now we can treat all alike */
> -       skb = skb_recv_datagram(sk, flags, &err);
> -       if (skb == NULL)
> -               goto out;
> -
>         if (!sk_to_ax25(sk)->pidincl)
>                 skb_pull(skb, 1);               /* Remove PID */
>
> @@ -1725,6 +1725,7 @@ static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>  out:
>         release_sock(sk);
>
> +done:
>         return err;
>  }
>
> --
> 2.17.1
>
