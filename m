From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Help with Fedora Core and AX25
Date: Thu, 31 Jan 2008 11:20:32 +0200
Message-ID: <20080131092032.GO2537@mea-ext.zmailer.org>
References: <47A14E83.5000606@guegue.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47A14E83.5000606@guegue.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Neville A. Cross" <neville@guegue.com>
Cc: linux-hams@vger.kernel.org

On Wed, Jan 30, 2008 at 10:28:51PM -0600, Neville A. Cross wrote:
> Hello,
> First of all, I am a bit clueless!
> I have been trying to set up AX25 under Fedora Core 8 .
> Fedora 8 has the ax25 already in the kernel.

Yup..  I got the AX25 enabled into kernel by default couple weeks before
FC8's release :-)    I even noted that "at this time, userspace tools are
difficult to use, and are not included into FC8, but with kernel support
in place, we can finally make same progress on the tools too."

> The problems come with the installs of the ax25-apps, ax25-tools and
> libax25 packages, apparently they do not use a standard tree.
> For example there is not /etc/ax25 directory and there fore there is
> not axports file.

libax25 should bring the  /etc/ax25/axports  into system.


I have done some work on porting the tools to FC-devel, but my system
compiles only x86_64 correctly, and i386 libraries get wrong library
directory..  nevertheless, see:

  http://ham.zmailer.org/oh2mqk/libax25/

The  libax25  is packaged into runtime and development versions.
The tarballs are compilable into packages by command like this:

         rpmbuild  -tb  libax25-0.0.12.tar.gz

I have not yet gotten around to drag ax25-utils to current era, thus
it is not there packaged.


Anyhow, the existing init-scripts that people use with Debian, SuSE etc.
are very much lacking decent fluent configuration.

What is really needed are some decent init-scripts that start things
like kissattach in nice coherent manner, something similar to RH/FC
network subsystem scripts which really are quite decent.

That too is in my todo-list, and keeping me back from making real
publication of these packages.


> More details can be found on:
> http://forums.fedoraforum.org/showthread.php?t=178719&highlight=ax25
>
> Any help or hints may be appreciated.
> Neville YN1V

73 de Matti, OH2MQK
