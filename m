From: Shane Deering <sdeering@dodo.com.au>
Subject: Re: netrom
Date: Sun, 14 Apr 2002 18:24:15 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200204140823.g3E8NnX17814@msv02-kent-syd.comindico.com.au>
References: <200204140557.g3E5vZX11801@msv02-kent-syd.comindico.com.au> <3CB92EE5.2030409@pi8zaa.ampr.org>
Reply-To: sdeering@dodo.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3CB92EE5.2030409@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sunday 14 April 2002 17:25, Arno Verhoeven wrote:
> Shane Deering wrote:
> > G'day all.
> > Wonder if someone can help me out.
> > I've just set up my good computer (this one) for packet.
> > Using kernel 2.4.9-31 and the latest libs, tools and apps.
> > AX25 seems to work ok on the 2 test ports I've set up (call, mheard).
> > But i'm having problems setting up netrom. Doing what the ax25 how-to say
> > to
> >
> > Any idea why NET/ROM isn't working?
>
> Have you also setup /etc/ax25/nrbroadcast ?
>
> This file should list at least one valid AX.25 port.

Thanks Arno.
I have got /etc/ax25/nrbroadcast set up OK. I knew I'd forget something in my 
post :-)

Netrom is now working. I added IP address and port name to nrattach and it 
worked.

I guess my next stop will be the xfbb list.
That seems to be working OK, just looks like crap.

-- 
Shane Deering
vk3bvp@vk3bvp.#sev.vic.aus.oc / vk3bvp@qsl.net
http://www.qsl.net/vk3bvp/
Sent with KMail v1.3.2 on Sun Apr 14 18:22:57 EST 2002

