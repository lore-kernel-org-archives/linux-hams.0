From: Tomi Manninen <oh2bns@sral.fi>
Subject: ANN: gMFSK v0.6beta1
Date: Sun, 26 Oct 2003 01:02:25 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1067119345.1305.73.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi all,

I have just made available the first beta of gMFSK version 0.6. 
Once again this new version is anything but ready so this time I 
have cleverly named it a beta... Now you need to find the bugs so
I can fix them.

Seriously, while this is work in progress, the new features should
prove useful to people using gMFSK for their digital mode fix.
Here is a short list of changes in this version:

 - Feldhell TX works. Full international character set support.
                                                                                
 - All modems have their own config dialog. Clicking the mode
   label in the statusbar opens the dialog for the current mode.
   (RTTY and THROB squelch and Feldhell AGC settings don't work yet.)
                                                                                
 - Help file. This is still work in progress. Specifically the
   section about usage is mostly bogus right now.
                                                                                
 - TX text is handled a bit differently now. Difficult to explain,
   please test...
                                                                                
 - Locator entry in QSO data (also sent to remote log).
                                                                                
 - MFSK pictures.
                                                                                
 - The FFT library (FFTW) now uses "wisdom" to optimize CPU consumption.
   User will notice that the first time a modem is used, there will be
   a few seconds delay.
                                                                                
 - Hamlib (rig control) support.

There is also a web page devoted to gMFSK now. You can download the
new version from there:

  http://gmfsk.connect.fi/

I have provided source code and both source and binary RPMS's (binary 
RPM compiled on Red Hat 9). If compiling from source, please read at 
least the first 20 lines of the INSTALL file... :)

-- 
Tomi Manninen / OH2BNS / KP20ME04

