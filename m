From: Dave Platt <dplatt@radagast.org>
Subject: Re: Raspberry Pi and AX25
Date: Sat, 11 Aug 2012 06:48:52 -0700
Message-ID: <23DA1DD8-7B9C-4B2B-9C51-2C13CA9B56F7@radagast.org>
References: <CAOP4WsNN2MXbryyH46+k9CKT+r3UBw4Lu4moj-Vmj+PgKkVTPQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAOP4WsNN2MXbryyH46+k9CKT+r3UBw4Lu4moj-Vmj+PgKkVTPQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Demetre SV1UY <demetre.sv1uy@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>


> All I want to do is connect 2 dula port TNC's and a WX station to my
> Raspberry Pi and run an AMPRnet GATEWAY, an APRS IGATE and my
> WXstation with it! Is it possible? I use an ATOM MBO now with
> Slackware now, but I would like to start using my Raspberry Pi
> instead.

If you connect the USB RS-232 adapter to a Linux desktop and
run "lsusb -v" as root, you should be to see the USB device
descriptors, including the power requirement number.  

Safest thing to do would be to connect a powered USB hub
with its own wallwart between the Pi and the serial adapter;
this will relieve the Pi of the load and avoid the problem
entirely.  You could probably arrange to run the Pi and
the hub from a single power supply, with a splitter cable.

