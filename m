From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Square One!
Date: Thu, 10 Apr 2003 10:51:30 -0700
Sender: linux-hams-owner@localhost
Message-ID: <20030410175130.GE13938@n7xy.net>
References: <20030410170405.GA29076@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030410170405.GA29076@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Mike,

Make sure you have the latest AX25-HOWTO (v 2.0, 19 September 2001) and
you should be in good shape.  You don't need ax25-utils, which was for
2.0 and earlier kernels--get libax25, ax25-tools and ax25-apps instead. 
The hamlib library is for rig and rotator control, not AX25.

I may be wrong, but I believe that AX25 is broken in recent 2.5
kernels.  2.4.19 and 2.4.20 work (for me, at least although some folks
appear to have problems).  2.2.x kernels should be fine also.

73,
Bob, N7XY

On Thu, Apr 10, 2003 at 01:04:05PM -0400, Mike Markowski wrote:
> Hi all,
> 
> I hope to get ax.25 going on my laptop and build in soundmodem
> support (in the hopes that my machine's ESS Allegro 1 is truly
> SB compatible).  After building the latest 2.4 kernel w/ax.25
> and soundmodem support, I couldn't find the ax25-utils that the
> AX25-HOWTO mentions.  In my search I found and subscribed to
> this list and saw a note go by saying the latest 2.5 is the
> better choice.  But before I do that, I'd like to doublecheck
> that the following is the way to do things rather than what the
> AX25-HOWTO says:
> 
> 	- Build latest 2.5 kernel with ax.25 & soundmodem support
> 
> 	- Install hamlib (disregard the AX25-HOWTO's advice
> 	  about the ax25-* packages??)
> 
> 	- Start compiling & installing the applications.
> 
> Sorry for the very basic nature of the questions.  Just want to
> be sure I'm heading off the right direction is all.  Thanks very
> much!
> 
> 	Mike   AB3AP
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Bob Nielsen, N7XY                          n7xy@n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
IOTA NA-065, USI WA-028S 
