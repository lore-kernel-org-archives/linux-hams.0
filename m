From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Re: redhat 6.2 dies 3/31/2003 + AX25 2.4 kernel issues
Date: Thu, 26 Dec 2002 19:44:15 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E0BCC8F.6090403@junglevision.com>
References: <3E099099.7070306@junglevision.com> <20021226162643.A31559@pull.privacy.nb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

M Taylor wrote:
> On Wed, Dec 25, 2002 at 03:03:53AM -0800, Cathryn Mataga wrote:
> 
>>According to the Redhat website, Redhat 6.2 and 7.0
>>both die on 3/31/2003.  These are the only supported versions
> 
> 
> No, they will not die, and they will not stop running. Red Hat
> Software Inc. will stop offering support for them (which includes
> releasing software updates). You are free to use RH 6.2 or 7.0
> if you wish.
> 
> 
>>that run with the 2.2 kernel.  But, I've also read messages
>>here that the 2.4 kernel has race conditions and is prone
>>to crash.  So, the question is, what do I do with my ax25
>>Linux system with RF modems on 3/31/2003?
> 
> 
> I have reports of mainly "larger" stations have problems
> with 2.4 kernels, though I do not think that going backwards
> to a 2.2 kernel will actually solve the problems.
> 
> I run a small 2.4 ax25 system with no problems, and no crashes
> or system lockups. I am trying to help a friend isolate a 
> system lockup (non responsive, no crash or kernel panic) with his
> 2.4 based BBS and AMPRnet gateway.
> 
> 
>>1.  Somehow get the 2.4 kernel fixed by 3/31/2003?  Is this
>>possible?  What exactly is the issue, and how bad is this?
>>Is this likely to happen?
> 
> 
> People are working on the kernel AX.25, NetRom and the userland
> tools. Others willing to contribute are welcome. One goal is
> to have a new AX.25 kernel code ready for 2.6, it is currently
> being worked on by Ralf and others in the 2.5 developmental kernel 
> series.
> 
> 
>>2.  Just live with the crashing.  Cycle the power on the
>>
>>3.  Maybe someone other than Redhat will continue to do security patches
>>for 6.2?  I can't believe I'm the only one running 6.2.  Right?
> 
> 
> You are not the only one running RH 6.2, but I do not think there is
> enough of a _paying market_, to pay for the additional support in 2004
> for RH 6.2. 
> 
> The 2.4 kernel has some wonderful advances, like journaling
> file systems, better SMP support, and of course more device driver
> support that I cannot imagine staying with RH 6.2. I would recommend
> you upgrade to RH 7.3 or wait for RH 8.1 (soon-ish).
> 
> If you do have problems, then help us, to help you, by providing detailed
> bug reports, from current systems.
> 

Anyway, after investigating this a little more,
I've decided to try to keep the Redhat 6.2 running for a bit longer.
I suppose I'll just have to keep a closer eye on security focus to avoid
being script kiddie fodder, but hopefully that'll be about it.
I have most of my other machines at the newer kernels, but the one ax25
box still at Redhat 6.2.

Sorry, I'd love to dig in and try to help fix this, but I have
basically zero free time until maybe about 6/03 or so.

