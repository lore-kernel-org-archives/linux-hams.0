From: Richard van der Riet <pa3gwh@worldmail.nl>
Subject: Re: SuSE 8.1 and kernel upgrade
Date: Sun, 8 Jun 2003 13:51:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200306081351.02751.pa3gwh@worldmail.nl>
References: <200306051330.22124.w.knol@niwa.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200306051330.22124.w.knol@niwa.co.nz>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: w.knol@niwa.co.nz, linux-hams@vger.kernel.org

On Thursday 05 June 2003 03:30, Wilbert Knol wrote:
Hello Wilbert,

> The problem I keep having is, that the Reiser file system does not
> want to mount with the home-brewed kernel. I have built reiserfs into
> the kernel, but the fschk.reiser keeps failing. It then proceeds to
> mount the filesystem read-only in maintainance mode.  The file system
> seems perfectly OK in that mode.
>
If I recall correctly, SuSE have changed the behaviour of their OS as far as 
ReiserFS is concerned, I think you need to add reiser as a module instead of 
compiling it into the kernel, so it can be loaded early in the process.

From their support database:


From SuSE Linux version 7.2 on, reiserfs support is no longer included in the 
kernel but is loaded as a module. For this reason, the file system cannot be 
mounted off-hand during the boot process.
Solution:
Integrate the module reiserfs into the INITRD (initial ramdisk).

Background: By using an initial ramdisk in which the module reiserfs is 
included, the module will be loaded during the boot process immediately after 
starting the kernel, even before the root file system is mounted.
Procedure:
Up to SuSE Linux Version 7.3
Boot your installed system with the installation CD. To integrate the reiserfs 
module in the initrd, you can either directly insert the module in the file 
/etc/rc.config (variable INITRD_MODULES) and then execute the following 
script in a root shell:

mk_initrd

or you can start YaST (1) and select the dialogs

    * System Administration ->
    * Change configuration file

   1. Search for the variable INITRD_MODULES (for example by using the search 
function, key F4).
   2. Use F3 to verify if the entry reiserfs is already available. If not, 
append this entry separating it with a blank from already existing entries.
   3. Leave the dialog with F10 and finish YaST.

Then invoke the script that creates a new initrd. This can be done by entering 
in a root shell:

mk_initrd

Skip to the section All versions.
From SuSE Linux Version 8.0
From SuSE Linux 8.0 on, the INITRD entry can be found in the file 
/etc/sysconfig/kernel. You can either directly insert the module reiserfs in 
this file (variable INITRD_MODULES) and then execute the following script in 
a root shell

mk_initrd

or you can use YaST2. For this purpose, start YaST2 Control Center and change 
to the dialogs:

    * System ->
    * Editor for /etc/sysconfig

   1. Select Search and enter INITRD_MODULES in the search mask.
   2. If more than one result is displayed, select INITRD_MODULES.
   3. Check if the entry reiserfs is already available. If not, append this 
entry separating it with a blank from existing entries.
   4. Select Save and answer the confirmation question with OK.

Now leave YaST2 and subsequently execute the script that creates a new initrd:

mk_initrd

All versions
If there were no modules defined for initrd yet, you still have to modify 
LILO's configuration file. To do this, open the file /etc/lilo.conf with an 
editor of your choice and search for the following section (it may vary 
depending on the SuSE version):

image = /boot/vmlinuz
  root = /dev/ ...
  label = linux

image = /boot/vmlinuz.suse
  root = /dev/ ...
  label = suse
  optional

Change these lines to:

image = /boot/vmlinuz
  root = /dev/ ...
  initrd = /boot/initrd          # insert this line
  label = linux

image = /boot/vmlinuz.suse
  root = /dev/ ...
  initrd = /boot/initrd.suse     # insert this line
  label = suse
  optional

Then the bootloader LILO has to be updated. To do this, execute

lilo

Good Luck

Richard PA3GWH

