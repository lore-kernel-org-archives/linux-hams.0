From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Trying to get Ax25 running.
Date: Sat, 16 Oct 2004 16:52:02 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1097934722.1296.8.camel@oh2bns.ampr.org>
References: <620c905704101518153ff636e@mail.gmail.com>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
	 <620c90570410151618432401d1@mail.gmail.com>
	 <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
	 <1097930726.1287.1.camel@oh2bns.ampr.org>
	 <620c905704101606165716759@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905704101606165716759@mail.gmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 2004-10-16 at 16:16, Chuck Hast wrote:

> I have done that, but I still have a problem. When I run the ax25-up file that
> is set up for for the mkiss line, it starts up ok the first time, but
> when I run the
> ax25-down file that ax25-config generates it does not shut down a mkiss entry

Hmm.. I guess the simple solution would be to do a "killall mkiss" 
somewhere near the top of the script. It should be placed before the 
kissattach processes are killed.

> if I do a ps -e I see a PID and mkiss if I do a ps -r I see that it is
> the attachment
> to the ttyz0 port that does not go away. 

This makes me wonder if the pty behaviour has changed along the way and
if my suggestion about the order of kissattach/mkiss is valid anymore...
Oh well... :)

-- 
Tomi Manninen / OH2BNS / KP20ME04

