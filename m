From: Fabio IZ4AFW <iz4afw@libero.it>
Subject: Need help with serial card + baycom
Date: Sun, 14 Nov 2004 20:47:10 +0100
Message-ID: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi guys,
     I'm new to the list, and I need help to use a baycom modem with linux.

I used it before for a long time with linux, connected directly to the 
RS-232 ports on the mainboard, and I had no problems, neither configuring 
it, nor using it on the air.
Now I need using those ports for different tasks, so I decided to buy a PCI 
cards with 2 additional RS232 ports (and another LPT, but this is not 
interesting to the problem).
I bought a PCI cards made by SUNIX (model 4079T), based on the SUN1889 
chip, which features a 16C650 UART (FIFO with 32 bytes, base speed 921600 
bps), which linux seems to recognize (setserial can set the various 
parameters, even if actually it recognizes it as a 16550A UART), and that 
is given as fully 16C650, 16C550, 16C450  compatible (and supported by linux).
Anyway, I have some problems using it with the baycom.
I'm using kernel 2.4.26 and latest ax25 suite. When I start up the whole 
thing, I have no errors until I invoke ifconfig. Then I have the following 
error message:

SIOCSIFFLAGS: No such device or address (repeated 2 times).

Of course, I can't use the baycom modem at all. Checking the logs it seems 
that the baycom module (baycom_ser_fdx.o) can't correctly recognize the 
uart and/or the serial port (which by the way is at address 0xb408 irq 11), 
because I don't get any "ser_fdx: open address 0xb408 etc." line in any log.
I tried checking the source code to see if it has problems recognizing the 
UART, but actually I have no clue where to search for problems. I added 
some printk() calls in several points in the code (ser12_check_uart() and 
ser12_open()) but I have no output from these, so I assume that the problem 
is elsewhere...

Can anyone help me?
I know C well enough to make some changes in the code of the driver, but 
actually I'd like to have some more clues to know where the problem is 
located...

The PC is located in a remote site (with no internet access), so things 
slow down a little...

Thanks very much,
73 & Ciao from Italy
Fabio
IZ4AFW


