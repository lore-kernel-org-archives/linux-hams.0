From: Bent Bagger <bentbagger@netscape.net>
Subject: PB and PG v.2.1.0 - programs for communicating with Microsat satellites
Date: Wed, 26 Feb 2003 20:25:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E5D14C4.3090302@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

I have uploaded version 2.1.0 of PB and PG for Linux to Metalab.unc.edu. 
The file
name is pbpg-2.1.0.tar.gz. I have placed the file and the accompanying
lsm-file in /incoming/Linux. The target directory is /pub/linux/apps/ham.
The file may also be downloaded from
ftp://ftp.amsat.org/amsat/software/Linux/pbpg-2.1.0.tar.gz.

The package has been changed substancially on several points relative to the
previous releases:

1) I have removed all usage of an UDP port as a means to controlling PB. 
PB can
now be controlled either throught the control FIFO or by signals.

2) I added a filter to PB so that only packets from the satellite of 
interest
are processed by PB.

3) PB now displays how many percent of a file have been received - 
provided PB
has heard the FTL0 file header.

4) If the Predict program by KD2BD, John Magliacane, is running in 
server mode on
the machine running PB, PBCTRL will (attempt to) display antenna positioning
data and doppler data as an aid in manual satellite tracking. See 
README.predict
for details.

5) There have been many minor corrections.


The lsm reads as follows:

Begin3
Title:           PB and PG for Linux
Version:        2.1.0
Entered-date:   17 DEC 2002

Description:    PB and PG for Linux are programs used for download from and
        upload to digital satellites (Pacsats) supporting the FTL0
        protocol. This software allows you to directly communicate
        with the Microsat series of satellites. It provides a
        Curses (Ncurses) based user interface. It features automatic
        directory fill requests and simple, rules based file
        download requests.
        This version of the programs will work with kernel
        revisions 2.0.24 or higher.
Keywords:       AX.25
        Digital Satellites
        Pacsat
        FTL0
                Amateur Radio
Author:         oz6bl@amsat.org (Bent Bagger)
        oz2aba@amsat.org (Peter Scott Bentsen)
        and others.
Maintained-by:  oz6bl@amsat.org (Bent Bagger)
Primary-site:   metalab.unc.edu /pub/linux/apps/ham/pbpg-2.1.0.tar.gz
Alternate-site:    ftp.amsat.org   /amsat/software/Linux/pbpg-2.1.0.tar.gz
Copying-policy: GPL.
End

Happy hamming

Bent/OZ6BL


