From: terry <wd0fpc@aniota.com>
Subject: Re: Problems with my new motherboard
Date: Wed, 22 Jan 2003 15:31:53 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.50.0301221346340.11030-100000@yossarian.aniota.net>
References: <Pine.LNX.4.44.0301221003080.973-100000@jazzy_earth_dragon.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301221003080.973-100000@jazzy_earth_dragon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

... ciao:

On Wed, 22 Jan 2003, jeremiah KD7DMP wrote:

> I just recently up-graded my system witha VA-503+ FIC motherboard and a
> K6-2/500MHZ. I've got most of the options on the board working, excetep
> for the Serial ports. It seems to bring up their kernel drivers at boot,
> but my serial mouse and TNC do not want to work, and when I try to talk to
> my TNC in user mode with minicom, I get nothing.

    this assumes you've enabled BOTH serial ports from within the board's
bios.

    check in '/proc' for "interrupts" and "ioports" to make sure the
kernel is seeing them.


    what 'exactly' does dmesg say.  on this system its:

"Serial driver version 4.27 with no serial options enabled
 ttyS00 at 0x03f8 (irq = 4) is a 16550A
 ttyS01 at 0x02f8 (irq = 3) is a 16550A"


    also, 'minicom.log' might offer some hints.


    finally, i am sure i'd build a new kernel , just in case ...


-- 
73 , de WD0FPC
    aka: terry
