From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Tracking down a Linux crash (update)
Date: Fri, 18 Oct 2002 09:02:02 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3489387.1034931722@WUSJA129861-8HP>
References: <200210160935.19272.w9ya@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200210160935.19272.w9ya@amsat.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux@lists.tapr.org, linux-hams@vger.kernel.org

Hi --

Thanks to all for the many responses to my plea for help about my crashing 
Linux box.  I set off quite a discussion.

The majority of responses pointed the finger at a hardware problem, mainly 
faulty memory or possibly CPU overheating.  Tomi suggested "cerberus" which 
is a burn-in testing tool that VA-Linux used on their hardware products. 
It's available at http://sourceforge.net/projects/va-ctcs/ .  It does a 
pretty extreme job of exercising the CPU, memory, and hard disk, and since 
it runs under Linux, it can find some kernel instabilities as well.  I've 
been running it for about 24 hours now, and have had no failures.  I also 
checked the CPU temperature, and got 44 degrees C with both the CPU and the 
case fan apparently working properly, but the CPU not working very hard. 
That's way under the 90 degree maximum rating for the Athlon XP.  So, I 
don't think there's a CPU or memory problem.

(One note about cerberus -- under 2.4.x kernels, the memory test requires 
swap space of 2.5 to 4 times the physical memory.  When I tried to test my 
512MB of RAM with 1GB of swap, things crashed in a very ugly way.  But 
testing each 256MB stick separately works just fine.)

Right now I'm suspecting a video driver problem.  The S3 ProSavage chip on 
the motherboard is a relatively new one, and the XFree86-4 driver for it is 
quite new (it's not even included in the Debian xfree-server package).  I'm 
going to install an outboard AGP video card to see what difference that 
might make.

A couple of people have suggested trouble with AMD chipsets, and that might 
be the case, but changing mobos is kind of a last resort... I'll go there 
if nothing else works.

I had one suggestion that there's a bug in Mozilla when it encounters Flash 
pages and accesses the sound card.  I haven't been able to track down 
anything definitive about that, so I'm not sure if that bug causes a full 
system freeze like I'm seeing, or just a Mozilla crash.

Finally, one suggestion was to turn off the artsd sound server in KDE. 
I'll give that a try as well; the sound server doesn't really do any good 
for the applications I'm using, anyway.

Thanks to all for the suggestions; if I ever find out what's going on, I'll 
let you know.

73,
John

