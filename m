From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: Re: SPLAT ...
Date: Thu, 27 Jun 2002 20:03:02 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020627190302.GA742@columbia.g7iii.bogus>
References: <200206271358.g5RDw3X08658@amsat.org> <Pine.LNX.4.10.10206271139190.29199-100000@yossarian.aniota.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10206271139190.29199-100000@yossarian.aniota.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: terry <wd0fpc@aniota.com>
Cc: linux-hams@vger.kernel.org

On Thu, Jun 27, 2002 at 11:51:05AM -0700, terry wrote:

>     cc a symlink to gcc (gcc version egcs-2.91.66).  i was unable to find
> reference to "-s" and "-lm" in the manpage.  what do these flags imply.

-l pulls in libraries, or more accurately tells the linker to pull in
libraries. -lm is telling it to pull the maths library in, IIRC.

Checking the manpage for ld, -s "Omits all symbol information from the
output file". Basically this means it does what strip(1) does before
creating your executable, saving you running strip(1)

When you run gcc, your code actually gets passed thru the preprocessor
first (cpp), then gcc proper, then the linker (ld) to create the
executable.


All the Best

Iain.
