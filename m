From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Packet duplication in kernels 2.6 onwards
Date: Tue, 26 May 2015 09:29:06 +0200
Message-ID: <20150526072905.GB8600@linux-mips.org>
References: <5547BACC.7000709@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5547BACC.7000709@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, May 04, 2015 at 07:30:36PM +0100, Richard Stearn wrote:

> Just put togther a packet system to test wireshark on and
> discovered that packets are being duplicated at the ax0 interface.
> 
> My tests so far show that the issue is not present in kernels
> 2.4.29 & 2.4.37.11 and is present in kernel 2.6.33.3.
> I also have reports of the issue being in kernel 3.x.x.x
> 
> Is this a known issue?
> 
> If so is there any idea as to when it appeared? My guess is during
> the 2.5 kernel series.
> 
> Has anybody on the list attempted to trace the cause?

There has been a number of pretty vague bug reports on the issue that
have been insufficient for me to replicate the issue on my system.

  Ralf
