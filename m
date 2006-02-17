From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Kernel recompiling
Date: Fri, 17 Feb 2006 19:31:16 +1300
Message-ID: <200602171931.16591.w.knol@niwa.co.nz>
References: <6.1.2.0.2.20060216235145.03123a98@mail.sasktel.net>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6.1.2.0.2.20060216235145.03123a98@mail.sasktel.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Doug <appld@sasktel.net>

On Fri, 17 Feb 2006 18:52, Doug wrote:
> Well I am still trying to compile my own kernel.
<snip>
> Mounting root file system
> Mount error 19 mounting ext3

Looks like your kernel can't mount your root partition because it needs the 
ext3 device driver...and to get that, it needs to load the initial ramdisk 
image...which hangs out on the as-yet unreadable ext3 partition.

Suggest you try a recompiled kernel with built-in ext3 support, instead of as 
a loadable module. Once you do that, you'll probably find you can do away 
with the convoluted initrd business altogether.

Hope this helps.

Wilbert, ZL2BSJ
