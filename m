From: Bernard Pidoux <bpidoux@free.fr>
Subject: New FBB version released : 704r6.1
Date: Tue, 22 Sep 2009 18:55:21 +0200
Message-ID: <4AB90179.1050204@free.fr>
References: <4AAF8F95.7040702@free.fr> <4AAF9F35.3000909@free.fr> <4AAFB2AF.90606@embarqmail.com> <4AB01C51.4070504@free.fr> <4AB04C15.60000@embarqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AB04C15.60000@embarqmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: k4gbb1@embarqmail.com
Cc: Ray Wells <vk2tv@exemail.com.au>, Bob Tenty <bobtenty@gmail.com>, Peter Mallett <zl2bau@xtra.co.nz>, linux-hams <linux-hams@vger.kernel.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>

Hi All,

With the help of Charlie K4GBB giving me access to his LinuxLab and W4AKH
machines, I could find the last (least !) bug causing stack smashing
in FBB.
It was caused by an under dimensionned array, receiving the names of held
messages.
On very well protected kernels, the overflow was detected and caused
FBB to abort.
The new release candidate FBB version number is r6.1 and available here :

http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704r6.1-src.tar.bz2

I already updated W4AKH-1 BBS and LinuxLab machines.

Now we can proceed to next bug hunting when runing BBS daemon.

Another good news is that 7.04r6 does not need anymore 
the kernel patch for ROSE zero length. This FBB bug has also
been repaired.

I would appreciate that sysops report any problems.

73 de bernard, f6bvp
