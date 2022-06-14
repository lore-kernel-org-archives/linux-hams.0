From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net v4] net: ax25: Fix deadlock caused by
 skb_recv_datagram in ax25_recvmsg
Date: Tue, 14 Jun 2022 10:59:35 +0200
Message-ID: <cdcd1de63ff8fd6ce5fb23f38669ee9092ceb45a.camel@redhat.com>
References: <20220610123319.32118-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655197181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IwpnFeqpjQPPhi0b6JCKQ8hffeOUpqZ7wRTwt/30kI4=;
        b=GM+exdlqTWTTJi3zoFeLyUJGO8HimVQ+lDdWkv6nPM7kghv1TzQCc9SHt2MXzEcraRqPT/
        1CwjzQ2YTG5qK0dUFhOzgeNEckhMxh6ZRX+HBM7Wvcj3Sjsv+pHwbwd0FrZJMCt9Kl/mmx
        uO3j4x4u+iIlu0MXgsImzzfs6Gy1D5o=
In-Reply-To: <20220610123319.32118-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Duoming Zhou <duoming@zju.edu.cn>, linux-kernel@vger.kernel.org
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, linux-hams@vger.kernel.org, thomas@osterried.de

On Fri, 2022-06-10 at 20:33 +0800, Duoming Zhou wrote:
> The skb_recv_datagram() in ax25_recvmsg() will hold lock_sock
> and block until it receives a packet from the remote. If the client
> doesn`t connect to server and calls read() directly, it will not
> receive any packets forever. As a result, the deadlock will happen.
>=20
> The fail log caused by deadlock is shown below:
>=20
> [  369.606973] INFO: task ax25_deadlock:157 blocked for more than 245 sec=
onds.
> [  369.608919] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  369.613058] Call Trace:
> [  369.613315]  <TASK>
> [  369.614072]  __schedule+0x2f9/0xb20
> [  369.615029]  schedule+0x49/0xb0
> [  369.615734]  __lock_sock+0x92/0x100
> [  369.616763]  ? destroy_sched_domains_rcu+0x20/0x20
> [  369.617941]  lock_sock_nested+0x6e/0x70
> [  369.618809]  ax25_bind+0xaa/0x210
> [  369.619736]  __sys_bind+0xca/0xf0
> [  369.620039]  ? do_futex+0xae/0x1b0
> [  369.620387]  ? __x64_sys_futex+0x7c/0x1c0
> [  369.620601]  ? fpregs_assert_state_consistent+0x19/0x40
> [  369.620613]  __x64_sys_bind+0x11/0x20
> [  369.621791]  do_syscall_64+0x3b/0x90
> [  369.622423]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  369.623319] RIP: 0033:0x7f43c8aa8af7
> [  369.624301] RSP: 002b:00007f43c8197ef8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000031
> [  369.625756] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f43c=
8aa8af7
> [  369.626724] RDX: 0000000000000010 RSI: 000055768e2021d0 RDI: 000000000=
0000005
> [  369.628569] RBP: 00007f43c8197f00 R08: 0000000000000011 R09: 00007f43c=
8198700
> [  369.630208] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff8=
45e6afe
> [  369.632240] R13: 00007fff845e6aff R14: 00007f43c8197fc0 R15: 00007f43c=
8198700
>=20
> This patch replaces skb_recv_datagram() with an open-coded variant of it
> releasing the socket lock before the __skb_wait_for_more_packets() call
> and re-acquiring it after such call in order that other functions that
> need socket lock could be executed.
>=20
> what's more, the socket lock will be released only when recvmsg() will
> block and that should produce nicer overall behavior.
>=20
> Fixes: 40d0a923f55a ("Implement locking of internal data for NET/ROM and =
ROSE.")

The correct tag is actually:=C2=A0

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

We don't pick hashes from historicaly repository, as they would confuse
most/all users. Please re-post with the correct tag. Note that you can
check patchwork yourself for this kind of formal errors.

The patch LGTM, when you repost you can append:

Acked-by: Paolo Abeni <pabeni@redhat.com>

Thanks,

Paolo

