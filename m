From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: SuSE 8.1 and kernel upgrade (solved)
Date: Tue, 10 Jun 2003 11:52:11 -1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200306101152.11209.zl2bsj@zl2tze.ath.cx>
References: <200306051330.22124.w.knol@niwa.co.nz> <200306081351.02751.pa3gwh@worldmail.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200306081351.02751.pa3gwh@worldmail.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard van der Riet <pa3gwh@worldmail.nl>, linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>

Hi Richard and others,

On Saturday 07 June 2003 23:51, Richard van der Riet wrote:
> On Thursday 05 June 2003 03:30, Wilbert Knol wrote:
> Hello Wilbert,
>
> > The problem I keep having is, that the Reiser file system does not
> > want to mount with the home-brewed kernel. I have built reiserfs into
> > the kernel, but the fschk.reiser keeps failing. It then proceeds to
> > mount the filesystem read-only in maintainance mode.  The file system
> > seems perfectly OK in that mode.
>
> If I recall correctly, SuSE have changed the behaviour of their OS as far
> as ReiserFS is concerned, I think you need to add reiser as a module
> instead of compiling it into the kernel, so it can be loaded early in the
> process.

For those interested in the solution....my mistake was that I had built the 
device file system (aka devfs) into the kernel...and made it mount at boot 
time.

SuSEE 8.1 apparenty does not use devfs. As a result, the device node
for my Reiser partition did not match the entry in /etc/fstab...and the 
initial file system check (fsch.reiserfs) failed to run (although it was 
happy to mount it read-only)

With regards to Richard's suggestion, I tried building Reiser into the kernel 
as well as having it as a module. Both worked equally well. The advantage of 
having it into the kernel is, that no initial RAM disk is needed (unless 
there are other drivers...SCSI etc) and the boot process seems a little 
quicker.

So, I am a happy chappy now...the latest stable kernel *and* a working ACPI
fan :-)

Thanks to Richard PA3GWH and Thomas DL9SAU for the hints.

Wilbert, ZL2BSJ 


