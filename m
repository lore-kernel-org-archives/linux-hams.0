From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: SuSE 8.1 and kernel upgrade
Date: Thu, 5 Jun 2003 13:30:22 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200306051330.22124.w.knol@niwa.co.nz>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thanks for reading this. I am trying to bring the kernel up to 2.4.21 
to get the benefits of any AX25 patches. 

The problem I keep having is, that the Reiser file system does not 
want to mount with the home-brewed kernel. I have built reiserfs into 
the kernel, but the fschk.reiser keeps failing. It then proceeds to 
mount the filesystem read-only in maintainance mode.  The file system 
seems perfectly OK in that mode.

I have included logical volume management (LVM) into the kernel, but 
no joy.

Do SuSE put some sort of a proprietary extension on Reiser? They don't 
seem to encourage custom kernel making. Any pointers appreciated.

Wilbert, ZL2BSJ


