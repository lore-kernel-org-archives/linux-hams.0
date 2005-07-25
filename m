From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Serial hub firmware and Debian 3.1
Date: Mon, 25 Jul 2005 14:55:02 +1200
Message-ID: <200507251455.02380.w.knol@niwa.co.nz>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Not strictly a linux-hams issue  - although it has put me off the 
air ;-) I have hit the wall with this one, and I know there are 
experienced Debian users out there.

Recently, I  migrated to Debian 3.1, and I am impressed with it, 
except for one thing: my 4-port RS232 USB hub no longer works.

This is a Keyspan USB49WLC outboard USB hub that I need for Hamlib rig 
control, TNC access (DX-Cluster), CW-keying (cwdaemon) and PTT-keying 
on the digi-modes.

The keyspan driver loads, but syslog complains that 'the firmware is 
unavailable'. 

I have brewed up my own 2.6.8 kernel *(using Debian supplied 2.6.8 
kernel sources) but there does not seem to be a way to build firmware 
images.

The Keyspan device driver compiles (and loads) but firmware is still 
'unavailable' and the hub remains QRT.

Any pointers are appreciated.

Wilbert, ZL2BSJ
