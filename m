From: Dennis Boone <drb@msu.edu>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 23:40:12 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410160340.i9G3eCQq032628@yagi.h-net.msu.edu>
References: <620c90570410151952635eb635@mail.gmail.com>  <620c9057041015095771b236e0@mail.gmail.com> <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org> <4323.192.168.0.2.1097865189.squirrel@192.168.0.2> <1097866437.1290.30.camel@oh2bns.ampr.org> <Pine.SUN.4.58.0410151221210.28043@eskimo.com> <620c9057041015125535932b34@mail.gmail.com> <620c90570410151618432401d1@mail.gmail.com> <620c905704101518153ff636e@mail.gmail.com> <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Fri, 15 Oct 2004 19:52:12 PDT.)
             <620c90570410151952635eb635@mail.gmail.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> /usr/sbin/kissparms -p kiss0 -r 254 -s 1 -l 10 -t 100

 > You were right. That worked. I am noticing one thing, when I establish
 > a connection that goes through a digi or two, it looks like the
 > frame counters get screwed up not sure what is going on, but what I
 > see is the I frame is sent, the far end ask for a repeate and off it
 > goes again, it looks ike the far end is not getting the right frame
 > number. If I send a new line again, the previous line is sent on to
 > the target.

I've been thinking about your kissparms statement, and wonder if it's
part of the problem.

Unless this is a digi, the "-r 254 -s 1" timing parameters are far too
aggressive and should probably be removed or changed.  (-s 1 isn't even
valid according to my kissparms manpage, which says it needs to be in
even 10's.)  Even if it is a digi, "-r 128 -s 10" is probably closer to
sane, unless your local network gurus have something else worked out.

The "-t 100" means your radio needs to be able to turn around from
receive to transmit in 100 ms.  That's pretty fast for most rigs,
both in terms of your transmitter, and in terms of the receivers at
the other end.  I've never had a rig which would run faster than 150,
and many have been 200 or slower.  You might want to try "-t 200".
What kind of radio is involved?

The cheap way to test all of this would be to just comment out kissparms,
reboot, and see how the behavior changes.  Defaults are something like
"-r 63 -s 10 -t 300".

De
