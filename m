From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: New Ham, New To Packet
Date: Tue, 25 Feb 2003 01:58:16 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030225015816.C27346@pull.privacy.nb.ca>
References: <1046134023.4825.17.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1046134023.4825.17.camel@bobcp4.lingpgmr.com>; from cochranb@speakeasy.net on Mon, Feb 24, 2003 at 07:47:03PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Cochran <cochranb@speakeasy.net>
Cc: linux-hams@vger.kernel.org

On Mon, Feb 24, 2003 at 07:47:03PM -0500, Robert L Cochran wrote:
> 
> I am wondering if the AX.25 HOW-TO posted to the Linux Documentation
> project is still accurate? If I read this How To and follow it, will I
> be able to implement packet radio on either the Red Hat or the Debian
> machines? I'm interested in being pointed to up to date reading
> material, I know there is a lot for me to study.

Welcome!

The general ideas in the AX.25 how-to are valid, some minor specific
details may have changed. I believe there are Red Hat 8.0 rpms available 
for the "core" ax.25 userland stuff (libax25, ax25-tools, ax25-apps) but
I don't know where off-hand. Since I am not Red Hat 8.0 on my ham box, 
and I enjoy compiling my own kernel I don't know if there is a RH 8 
compatible kernel rpm with AX.25 support (and KISS or other such interface 
module). 

The stock RH kernels include AX.25, but not any drivers/interfaces
such as KISS or 6PACK. So you will need to get a replacement, or
compile your own kernel. (It's only scary the first time. :)

Good luck,

-ve1mct
