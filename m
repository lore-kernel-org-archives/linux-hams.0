From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 04 Dec 02 21:20:09 CET
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <19470@9A0TCP>
References: <Pine.LNX.4.44.0212041148210.23313-100000@off1.audion.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: your message of Wed, 4 Dec 2002 12:04:48 +0100 (CET).
             <Pine.LNX.4.44.0212041148210.23313-100000@off1.audion.com>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ha3pg@ha3pmf.boszi.pte.hu
Cc: linux-hams@vger.kernel.org

Hi Sanyi,

thanks for reply, I applyed a fix explained in my post to linux-hams
and I am waiting to see if this bug will occur again....
    
please, are you interested for testing this also ? it would be also
good if ha5ob is interested... it would help me to find if it helps
or not, because it is hard to find a host with high traffic that
have this problem :)

to try it you just need to edit /usr/src/linux/net/ax25/af_ax25.c
and in function ax25_free_sock just add this line at the end:
        sk->protinfo.ax25->sk=NULL;
so, the ax25_free_sock function should look:     
static void ax25_free_sock(struct sock *sk)
{
        ax25_free_cb(sk->protinfo.ax25);
        sk->protinfo.ax25->sk=NULL;
}

of course, then you should do make modules;make modules_install
if you use ax25 in module or make install if you have it compiled
in kernel.

this should not do anything harmfull in kernel, I am quite sure :)

by my opinion, when kernel destroy an socket, there is still a pointer  
in ax25 control block that points to that destroyed socket and everytime
it access it it crash.

so, will see if this will help...

73 de Tihomir, 9a4gl@9a0tcp.ampr.org
