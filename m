From: Bob Nielsen <nielsen@oz.net>
Subject: Re: New Ham, New To Packet
Date: Mon, 24 Feb 2003 22:49:29 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030225064929.GA20437@n7xy.net>
References: <1046134023.4825.17.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1046134023.4825.17.camel@bobcp4.lingpgmr.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Feb 24, 2003 at 07:47:03PM -0500, Robert L Cochran wrote:
> Hello,
> 
> I'm new to amateur radio -- I just received my "Technician" class
> license. I have not been on the air yet. I want to use packet radio with
> my Red Hat 8.0 distribution. (I also downloaded and installed Debian
> bf2.4 on an older Dell machine.)
> 
> I am wondering if the AX.25 HOW-TO posted to the Linux Documentation
> project is still accurate? If I read this How To and follow it, will I
> be able to implement packet radio on either the Red Hat or the Debian
> machines? I'm interested in being pointed to up to date reading
> material, I know there is a lot for me to study.
> 

The current HOWTO is still accurate.  You might take a look at some of
the files on N8UR's web site (http://www.febo.com) for some additional
information. 

I haven't used Red Hat for several years so I can't speak to that, but
you should be able to run AX.25 with no problems using Debian.  I don't
know about the bf2.4 kernel, however.  The installation kernels are
configured to fit on floppies and may not have as many drivers included
as those which you can install from a CD or the internet.  I am running
kernel-image-2.4.20-686 (which has the necessary drivers compiled as
modules) with ax25-tools and libax25, all installed from Debian
packages.

73,
Bob, N7XY

