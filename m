From: terry <wd0fpc@aniota.com>
Subject: Re: Problems with my new motherboard
Date: Thu, 23 Jan 2003 03:11:33 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.50.0301230306280.12618-100000@yossarian.aniota.net>
References: <Pine.LNX.4.44.0301222011450.2655-100000@jazzy_earth_dragon.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301222011450.2655-100000@jazzy_earth_dragon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

... ciao:

On Wed, 22 Jan 2003, jeremiah KD7DMP wrote:

> 	I looked at Interrupts and ioports and one of the serial ports are
> using IRQ 4, but it only shows one.(in the Bios, ttyS0 is set to 3f8/IRQ4,
> and ttyS1 is set to 2f8/IRQ3)

    i would suggest 'statserial /dev/ttySn' to see what the system's
seeing for each device.

    then, i would run 'setserial' from the command line for the missing
device to see if it responds like it should.  might be a hardware problem
on the MB, which might include the cable from the header to the connector
...


-- 
73 , de WD0FPC		Pacific Nowthwest 2M Repeaters
    aka: terry 		http://www.aniota.com/~wd0fpc
