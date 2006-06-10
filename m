From: "Mike McCarthy, W1NR" <mike@w1nr.net>
Subject: W1NR SUSE 10.1 package problem
Date: Fri, 9 Jun 2006 22:50:06 -0400
Message-ID: <000301c68c38$9480bd00$3549a8c0@lan.w1nr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, suse-ham-e@suse.com, 'Ham-Linux' <ham-linux@mailman.qth.net>

If you are running OpenSuSE 10.1, you are probably aware that the package
manager and updater is very broken.  A patch was released today to fix most
of the problems.  It requires that you use the YaST Online Update (YOU) to
get the new patches.  (Zenworks crashes so it can't be used and other
issues).

If you have my old Hamradio packages for 10.1 or the older 10.0 as an
install source, YaST Online Update will crash because there are no
"directory.yast" files present.  The old 9.3 and 10.0 systems didn't care,
but 10.1 does.  Also, you can't just go into installation sources and delete
it.  Again, due to bugs in both YaST and in my original distribution.

To get around the issue, go to YaST->Installation Source.  When the message
appears about using an unsigned package, select NO.  There will be another
error, so click OK on it.  Then select "Finish" and the old Ham Radio
package will be gone from the list.  YaST Online Update will now run and
update itself along with all of the Zenworks files and libraries.

I have recreated the package directories and iso images with
"directory.yast" entries where they are needed.  This now allows you to add
an ftp installation source using my ftp site.  I also have recreated the iso
images.

See ftp://ftp.w1nr.net/suse-ham/10.1-i386 for direct installation directory
and ftp://ftp.w1nr.net/suse-ham/W1NR-SUSE-10.1-Ham-i386.iso for the iso
image.

You will know if you are using the new files if my call sign "W1NR" appears
in the installation source description.  You will also notice after the
update that the message about using an "unsigned" source will only appear
once, when you set it up and check the "don't tell me again" box.

Sorry for any inconvenience this may have caused. Also remember that these
are a temporary fix for the missing libax25.so file on the CD's and DVD's.
There is a libax25.so rpm package if you use an ftp installation source to
one of the 10.1 mirrors under "inst-source" directory.

73 de Mike, W1NR



