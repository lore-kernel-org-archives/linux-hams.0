From: Kjell Jarl <K-Jarl@algonet.se>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 04 Dec 2002 22:54:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DEE79AF.A921FDAF@algonet.se>
References: <19470@9A0TCP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Possibly this is the same bug I have had for ages?
Running 2.4.19 right now.
Last week end, I had a netrom/ax.25 link gone mad, with about 10 packets
sent in bursts indefiniteley, the netrom queue was some 32 k. I tried
axctl -kill but it segfaulted, then reboot which failed (kernel panic).
Will try this change soon.
Thanks
Kjell, sm7gvf



Tihomir Heidelberg wrote:
> 
> Hi Sanyi,
> 
> thanks for reply, I applyed a fix explained in my post to linux-hams
> and I am waiting to see if this bug will occur again....
> 
> please, are you interested for testing this also ? it would be also
> good if ha5ob is interested... it would help me to find if it helps
> or not, because it is hard to find a host with high traffic that
> have this problem :)
> 
> to try it you just need to edit /usr/src/linux/net/ax25/af_ax25.c
> and in function ax25_free_sock just add this line at the end:
>         sk->protinfo.ax25->sk=NULL;
> so, the ax25_free_sock function should look:
> static void ax25_free_sock(struct sock *sk)
> {
>         ax25_free_cb(sk->protinfo.ax25);
>         sk->protinfo.ax25->sk=NULL;
> }
> 
> of course, then you should do make modules;make modules_install
> if you use ax25 in module or make install if you have it compiled
> in kernel.
> 
> this should not do anything harmfull in kernel, I am quite sure :)
> 
> by my opinion, when kernel destroy an socket, there is still a pointer
> in ax25 control block that points to that destroyed socket and everytime
> it access it it crash.
> 
> so, will see if this will help...
> 
> 73 de Tihomir, 9a4gl@9a0tcp.ampr.org
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
