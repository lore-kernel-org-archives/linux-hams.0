From: John Bennett <jabennett@insightbb.com>
Subject: Re: Just installed RedHat 9
Date: 09 Jul 2004 00:39:12 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1089351552.4936.48.camel@xidev>
References: <1223.192.168.1.117.1089178842.squirrel@gateway>
	 <2498.192.168.1.117.1089215964.squirrel@gateway>
	 <002801c4644c$0f62ecd0$6401a8c0@jeremiel>
	 <200407082315.27383.pa3gcu@zeelandnet.nl>
	 <009501c46533$923c2850$6401a8c0@jeremiel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <009501c46533$923c2850$6401a8c0@jeremiel>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Montanez <jemontanez@knology.net>
Cc: linux-hams@vger.kernel.org

RH9 does have ax25 support, but only for the soundcard modem. If you
intend to use KISS, you will need to rebuild the kernel. Be warned that
one of the ax25.h files fails to include another necessary header and
can cause configure to fail if it attempts to test for the presence of
ax25. A lot of if's here, but this can and does happen. Case in point,
ax25 support in Xastir will fail on RH9 because of this omission. On my
system, they are found at:

/usr/include/linux/ax25.h
/usr/include/netax25/ax25.h	<-- this one has the required includes

If you have not done so already, make sure you get all the current ax25
tarballs off of Sourceforge and install them. Even though you may not
think you need them:

libax25
ax25-tools
ax25-apps

The apps can be useful to troubleshoot your setup. For example, I often
use the listen and call binaries to check my setup.

If you need to rebuild the kernel, be sure you copy the appropriate
config file from the configs directory to the root of the source tree
(be sure that it is named '.config' on the copy). The configs directory
is found in the root of the source tree. Do *NOT* do a 'make mrproper'
as this will completely wipe out the '.config' file. After doing this,
the only changes that you will need to make to the config is to set the
correct processor (i686 covers a lot of territory...) and select the
serial port kiss driver to be loaded as a module. Doing this will
preserve all the configuration settings and features that were with the
distribution. If you don't, a lot of stuff in X will break.

If you are using the latest rpms from Red Hat (they still have them on
their site), be advised that after the RH manuals were completed, RH
changed how the upgrade patches to the kernel were applied (for building
from the source). After downloading the src rpm, you will need to
install/build by doing the following:

rpm -Uvh kernel*.src.rpm
cd /usr/src/redhat/SPECS
rpmbuild -bp kernel-2.4.spec	<-- this will take awhile
cd /usr/src/redhat/BUILD/kernel*/linux*
cp configs/kernel-2.4.20-i686.config ./.config    <-- or whatever
vi Makefile    <-- change EXTRAVERSION to something unique for you
make menuconfig <-- selections as discussed above
make dep clean bzImage modules modules_install install

If you want grub to use your new kernel as the default, you will need to
edit grub.conf in /boot/grub. Suggest you make this change *after* you
have tested the new kernel.

Non-kernel rpms should be installed using the '-Fvh' option.

Hope this helps.

73, John
n4xi

On Thu, 2004-07-08 at 16:36, John Montanez wrote:
> First I would like to thank everyone who has taken the trouble to respond.
> Thank you all.
> 
> > Does not redhat 9 already have ax25 support then, i know redhat 8 had it
> as
> > default so why would version 9 not have it.???
> 
> I don't think so because when I tried to install the FBB bulletin board
> program I got a message telling me ax25 support was needed.  Thanks I will
> check out your website.  I still can't seem to get this kernal thing right.
> I compiled it but can't get it to load.  Looks like I'll be working on this
> for a while till I learn more about linux.
> 
> John / KC4TXC
> 
> ----- Original Message ----- 
> From: "pa3gcu" <pa3gcu@zeelandnet.nl>
> To: "John Montanez" <jemontanez@knology.net>
> Cc: <linux-hams@vger.kernel.org>
> Sent: Thursday, July 08, 2004 4:15 PM
> Subject: Re: Just installed RedHat 9
> 
> 
> > On Wednesday 07 July 2004 19:58, John Montanez wrote:
> > > Hello,
> > >
> > > I just installed RedHat 9, and am trying to recompile the kernel to
> include
> > > support for amateur radio.  I get a message telling me that the kernel
> is
> > > to big to be able to make a boot disk.  Can anyone tell me what sort of
> > > things I can safely leave out when I configure the kernel to make it
> > > smaller.  It's probably obvious but I'm a newbie at linux.
> >
> > Does not redhat 9 already have ax25 support then, i know redhat 8 had it
> as
> > default so why would version 9 not have it.???
> >
> > To answer you question about what and what not to compile would need a
> very
> > long answer.
> > Take a quick look at my web page, its old but should give you some hints.
> >
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

John Bennett
Evansville, IN
Amateur Radio Web: http://home.insightbb.com/~n4xi
Where am I? http://www.findu.com/cgi-bin/find.cgi?N4XI
Bike Racing Web: http://home.insightbb.com/~xibike

