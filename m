From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Updates & MKISS on USB serial?
Date: Wed, 23 Jun 2004 22:55:44 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200406232255.44676.w.knol@niwa.co.nz>
References: <S265230AbUFWHpu/20040623074550Z+62@vger.kernel.org>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <S265230AbUFWHpu/20040623074550Z+62@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Jenkins <raj@jrw.co.uk>
Cc: linux-hams@vger.kernel.org


> Can anyone tell me if USB serial adaptors will work OK with the standard
> AX25 serial port stuff - Kissattach / MKISS??
> (For KISS TNC connection.)

Yes. It works great.

> If so, any advice on make or type?

I use a Keyspan USA-49W, a USB hub with 4 serial ports.

http://www.keyspan.com

Best piece of kit I've bought for the notebook.  It runs a KISS TNC, as well 
as a CI-V rig interface (the excellent Hamlib rig control libraries). In 
addition, the hub keys the radio on the 3rd port using CWdaemon.

I have also successfully used a USC-1000  USB to 1 serial port 'dongle'. It 
uses the FTDI chipset.

Both gizmos are supported by Linux, although you may have to recompile the 
kernel in order to get the drivers. Suggest you use kernel 2.4.22.. there 
were several USB improvements over 2.4.21. Check the 2.4.22 ChangeLog.

One drawback of USB: as with most modern hardware, the connectors aren't well 
engineered. The plug-socket combination appears to have intermittents on the 
shield and the lift in QRM is noticable. How this USB stuff ever passed basic 
EMC tests is beyond me.


Wilbert, ZL2BSJ
