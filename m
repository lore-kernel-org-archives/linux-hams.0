From: David Ranch <linux-hams@trinnet.net>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Sat, 12 Mar 2011 08:40:36 -0800
Message-ID: <4D7BA204.2030602@trinnet.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net> <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net> <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net> <alpine.LNX.2.00.1103110815240.4745@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103110815240.4745@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org


Hey Curt,
> Any pointers as to who to submit the patches to?  Probably the 
> kernel-hackers list?  How to submit them?  It might be a few more days 
> or weeks before I get around to it though.  I've tested the driver on 
> 64-bit and 32-bit, but will do so again before I send any patches 
> upstream.
[slightly updated and resending to the linux-hams list as others  might 
find it helpful]


1. Get the newest available vanilla Linus kernel (today, that's 2.6.37)

2. Look at the MAINTAINERS.txt file and see who is the maintainer for 
the Yam driver.  I see:
-- 
YAM DRIVER FOR AX.25
M:      Jean-Paul Roubelat <jpr@f6fbb.org>
L:      linux-hams@vger.kernel.org
S:      Maintained
F:      drivers/net/hamradio/yam*
F:      include/linux/yam.h
-- 

3. Read this article in the source tree:

    Documentation/SubmittingDrivers

4. In an email to the YAM driver maintainer, you need to cite:
  a. reason for the patch
  b. sign off on the patch as yourself (just a one liner in the email 
before the diff with a real email address)
  c. include the "-up" diffs against the newest vanilla kernel
  d. diffs cannot have line wraps

5. The Yam maintainer should accept and submit the patch.  If you can't 
reach that maintainer, you should be able to submit the patch directly 
to the kernel-hackers list and someone else will commit for you assuming 
they pass muster (sane code, comments, etc.)


Here is the very simple patch I submitted which was also signed off by 
the USB serial driver maintainer
-- 

This patch is to add a US Interface, Inc. "Navigator" USB device.
Specifically, it's a HAM Radio USB sound modem that also
incorporates three pairs of unique FTDI serial ports.  The standard
Linux FTDI serial driver will only recognize the first two serial
ports of an unknown FDTI derived device and this patch adds in
recognition to these specific new IDs.

Signed-off-by: David A. Ranch <dranch@trinnet.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
drivers/usb/serial/ftdi_sio.c     |    3 +++
drivers/usb/serial/ftdi_sio_ids.h |    5 +++++
2 files changed, 8 insertions(+)

--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -162,6 +162,9 @@ static struct usb_device_id id_table_com
    { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_5_PID) },
    { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_6_PID) },
    { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_7_PID) },
+    { USB_DEVICE(FTDI_VID, FTDI_USINT_CAT_PID) },
+    { USB_DEVICE(FTDI_VID, FTDI_USINT_WKEY_PID) },
+    { USB_DEVICE(FTDI_VID, FTDI_USINT_RS232_PID) },
    { USB_DEVICE(FTDI_VID, FTDI_ACTZWAVE_PID) },
    { USB_DEVICE(FTDI_VID, FTDI_IRTRANS_PID) },
    { USB_DEVICE(FTDI_VID, FTDI_IPLUS_PID) },
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -40,6 +40,11 @@

#define FTDI_NXTCAM_PID        0xABB8 /* NXTCam for Mindstorms NXT */

+/* US Interface Navigator (http://www.usinterface.com/) */
+#define FTDI_USINT_CAT_PID    0xb810    /* Navigator CAT and 2nd PTT 
lines */
+#define FTDI_USINT_WKEY_PID    0xb811    /* Navigator WKEY and FSK 
lines */
+#define FTDI_USINT_RS232_PID    0xb812    /* Navigator RS232 and CONFIG 
lines */
+
/* OOCDlink by Joern Kaipf <joernk@web.de>
 * 
(http://www.joernonline.de/dw/doku.php?id=start&idx=projects:oocdlink) */
#define FTDI_OOCDLINK_PID    0xbaf8    /* Amontec JTAGkey */





