From: Bob Nielsen <nielsen@oz.net>
Subject: Re: ax25/baycom/kernel(?) problem.
Date: Mon, 24 Mar 2003 17:58:07 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030325015807.GA10932@n7xy.net>
References: <1F55F6582266314A85A55F6241509B670395F453@Esealnt863.al.sw.ericsson.se> <200303251235.07843.vk3bvp@qsl.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200303251235.07843.vk3bvp@qsl.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

What 2.4 kernel version were you running?  I recall that some of the
early ones had problems, but have yet to see a kernel panic running
ax25 with 2.4.20 (stock Debian 2.4.20-686 kernel with mkiss driver as a
module).

Bob, N7XY

On Tue, Mar 25, 2003 at 12:35:07PM +1100, Shane Deering wrote:
> On Mon, 24 Mar 2003 20:22, Gunnar Widell (ESE) wrote:
> 
> > Now I have problems with my modem not responding or send any ax25 packets
> > after acouple of hours, up to a day, of operation. I can see incoming calls
> > (listen -cart) on the channel to my station, but no answer. If I try to
> > make a call myself (call -r bcsf0 sl0zs) the modem does not send anything.
> 
> My ax25 box would go for an hour or two up to  a day or so and then kernel 
> panic when I used a 2.4 kernel. Once it went for 4 or 5 days.
> 
> >
> > If I then try to unload the baycom driver and start it again all seams to
> > be ok again. Sometimes when I try to unload it, I get a KERNEL PANIC
> > (something with interupt) and I need to power off my computer.
> 
> Something like this-
> <0>Kernel panic: Aiee, killing interupt handler!
> In interrupt handler - not syncing
> 
> >
> > I have tried several things, thinking this is a kernel problem, tried to
> > compile a 2.4.20 kernel, instead of the 2.4.18-3 I have been running. I see
> > the same thing... I have tried to load ax25 as module but same result.
> >
> > My setup is a Pentium 500MHZ with 128 MB and 2.4.18-3 kernel. Rigth now
> > 2.4.20 kernel with same problem. Will try to compile a 2.4.10 kernel today
> > and see if I get the same problem. Also running IPTables with NAT...
> >
> > Baycom_ser_fdx 1200 bd modem. DX-spider. NO NODE or IP over radio yet...
> 
> Node is easy enough to set up if you follow the howto.
> I don't use a Baycom modem though.
> 
> >
> > Where to continue? No I need to go to a 2.2 kernel or could it still be a
> > configuration problem? What else can I print to see status of my ax25? The
> > printouts below does not give ME any useful information, but maybe to
> > someone else. During this printouts I do not see any call attempts on my
> > "listen -cart".
> 
> I went back to using a 2.2 kernel after many frustrating attempts to use 2.4 
> kernels. That was about 23 days, 15 hours and 18 minutes ago :-)
> Haven't rebooted since the first test boot after copying the new kernel across 
> to that box. It was worth the couple of hours spent to get a 2.2 kernel going 
> here. 
> 
> -- 
> Shane Deering                   Sent using Kmail v1.4.3
> vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
> vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 4 hours and 58 minutes 
> http://www.qsl.net/vk3bvp/      RH7.2 Up 23 days, 15 hours and 18 minutes 
> 
> -

-- 
Bob Nielsen, N7XY                          n7xy@n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
IOTA NA-065, USI WA-028S 
