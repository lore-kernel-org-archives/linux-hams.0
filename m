From: Bob Nielsen <nielsen@oz.net>
Subject: Re: KISS mode
Date: Fri, 26 Apr 2002 15:27:48 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020426222748.GB3430@oz.net>
References: <3CC9C750.1050107@ptcnh.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3CC9C750.1050107@ptcnh.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

It depends somewhat on the TNC.  For TAPR clones, the following
applies: 

You get into KISS mode with

KISS ON
RESTART

To get out of KISS mode is a bit more complicated.  You need to send
the three bytes $C0, $FF, $C0 (192, 255, 192) to the TNC to restore
normal operation.  I've seen DOS programs to do this, but haven't run
across anything for Linux.  It shouldn't be too hard to write code to
to do it, however.  You can, of course, reset the TNC completely by
disconnecting the battery for several minutes.

Some firmware versions have a tendency to drop out of KISS mode.  I
prefer to use a KISS-only EPROM, such as the JKISS image from the
G8BPQ package.  These only exist for TAPR clones, unfortunately.

Bob, N7XY

On Fri, Apr 26, 2002 at 05:32:00PM -0400, charlie carroll wrote:
> Can someone point me to the commands to put an external TNC into and
> out of KISS mode?
> 
> Thanks
> 
> Charlie, k1xx
