From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: SignaLink USB w/NVidia Chipset motherboard.  Fix.
Date: Thu, 22 Jul 2010 13:27:17 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1007221316020.6511@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:user-agent:mime-version:content-type;
        bh=+21rDZbLzS3H29B6RexAbLWLugJR38aHoRhQe7yLdfI=;
        b=KM9aTpfWI5/IglcmbviY855neEUxFN4EMsflH1S59S4TURroVMD/gCr6YYg68X0jNF
         F67ctO61fNGqux3VUfgkuOdPvl+qK91LPcv/bNXAHvjwkZYydKYghUGtwi++x77Ntmf9
         7kNpn9U/+TzMDJm/iwt2SxcUuVpKpW67j+2/o=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


This may bite others, so I'm trying to document it in a few places.

I plugged a SignaLink USB into my OpenSuSE-11.2 32-bit laptop and
had no issues configuring the 2nd soundcard and using the device
with WSPR and Fldigi.

On my desktop it was quite another matter:  The desktop machine has
a motherboard with an integrated NVidia 8200 video card.  This
particular chipset has a bug in the USB1.1 "high-speed" controller,
but not in the USB1.1 low-speed or USB2.0 controllers.  Of course
the SignaLink USB is a USB1.1 "high-speed" device and triggers the
bug.  On Linux this caused my entire USB stack to crash, taking out
the mouse, external USB hard drive, etc, requiring a reboot to make
all of those devices responsive again.  This happens within a few
seconds of starting up Fldigi or WSPR using the SignaLink.

Evidently Windows has implemented a fix for this particular chipset
problem but Linux has not.

One fix:  Plug in a USB2.0 PCI card and plug the SignaLink into
that.  Here's a link with more details on the bug and this initial
fix, but a different motherboard manufacturer than mine (mine's an
ASUS):  http://kjellquist.com/WordPress/?p=283

Another fix (which I'm using):  Plug in a USB2.0 HUB and plug the
SignaLink into it.

Either of the above fixes causes USB1.1 "high-speed" protocol to be
converted to USB2.0 "full-speed" protocol, which then uses the
motherboard USB2.0 controller which apparently doesn't have the bug.

I sent a note to Tigertronics about it as well.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
