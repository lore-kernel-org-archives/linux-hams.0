From: Shane Deering <sdeering@dodo.com.au>
Subject: Re: netrom
Date: Sun, 14 Apr 2002 22:45:22 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200204141244.g3ECitX01075@msv02-kent-syd.comindico.com.au>
References: <200204140557.g3E5vZX11801@msv02-kent-syd.comindico.com.au> <0204141011070V.00302@unix.pa3gcu>
Reply-To: sdeering@dodo.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0204141011070V.00302@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pa3gcu@zeelandnet.nl, linux-hams@vger.kernel.org

On Sunday 14 April 2002 20:11, Richard Adams wrote:
> On Sunday 14 April 2002 05:58, Shane Deering wrote:
> > G'day all.
> > Wonder if someone can help me out.
> > I've just set up my good computer (this one) for packet.
> > Using kernel 2.4.9-31 and the latest libs, tools and apps.
> > AX25 seems to work ok on the 2 test ports I've set up (call, mheard).
> > But i'm having problems setting up netrom. Doing what the ax25 how-to say
> > to do (I think), but I get the following-
> >
> > [root@vk3bvp-6 root]# nrattach netrom
> > NET/ROM port netrom bound to device nr0
> > [root@vk3bvp-6 root]# /usr/sbin/netromd -i
> > nrconfig: port netrom not active
> > netromd: no NET/ROM ports defined
>
> Have you tryed.
> nrattach [-i inetaddr] [-m mtu] [-v] port

I found something like that on a web site including an example and that got 
got me going. 

My Winfbb has done a netrom connect to my Linfbb and forwarded about 600
messages to date. Everything seems to be working OK so far.
I'm now writing a simple startup script before I forget everything. I'll 
refine it at a later date.

-- 
Shane Deering
vk3bvp@vk3bvp.#sev.vic.aus.oc / vk3bvp@qsl.net
http://www.qsl.net/vk3bvp/
Sent with KMail v1.3.2 on Sun Apr 14 22:35:38 EST 2002

