From: "K. David Prince" <kdp@hanhet.loew.washington.edu>
Subject: Serial configuration problems.
Date: Fri, 15 Nov 2002 11:52:55 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0211151144160.11367-100000@hanhet.loew.washington.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Here's what I can do:

Reset the PK-96 according to the documentation (9600, 7E1, COM1), then
type one "*" at which point the modem's cmd propt comes up.  I'm talking
to the modem using Hyperterminal under Windows 98.  In other words, the
serial port works; I can communicate with the modem.

Here's what I can't do:

Reboot to Debian (2.4.19 kernel).  Setserial so that I'm getting...

/dev/ttyS0, Line 0, UART: 16550A, Port: 0x03f8, IRQ: 4
	Baud_base: 9600, close_delay: 50, divisor: 0
	closing_wait: 3000
	Flags: spd_normal skip_test

I start minicom and configure the same as what I had been running with
Hyperterminal under Win98.  (9600, 7E1, COM1=/dev/ttyS0).  When I power
up the PK-96, minicom reports that I'm "online", but when I type the
asterisk "*", I get nothing back from the modem.

I've RTFM'd my eyeballs out, scanned the net for info. installed every
module that looks like it would remotely be relevant.  Installed the
latest kernel (2.4.19).  Even deleted the distribution and reinstalled
just to make sure.  No matter what I do, I can't get minicom to tickle the
PK-96 for a cmd prompt.  And, yes, I've tried setting minicom to (9600,
8N1, COM1=/dev/ttyS0)

My progression with my Debian installs goes from "stable" to "testing" to
"unstable."  None of these do anything with the PK-96.  The bottom line is
that the PK-96 works with Win98, and doesn't work with any of the Debian
distributions.  I find that to be highly...peculiar...to say the least.

Here's more specific information:

uname -a
========
Linux acs 2.4.19-586tsc #1 Sun Oct 6 18:00:21 EST 2002 i586 unknown unknown GNU/Linux

dmesg (relevant lines)
=======================
Serial driver version 5.05c (2001-07-08) with HUB-6 MANY_PORTS MULTIPORT SHARE_IRQ SERIAL_PCI enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS01 at 0x02f8 (irq = 3) is a 16550A

setserial -a /dev/ttyS0
=======================
/dev/ttyS0, Line 0, UART: 16550A, Port: 0x03f8, IRQ: 4
	Baud_base: 9600, close_delay: 50, divisor: 0
	closing_wait: 3000
	Flags: spd_normal skip_test

stty -a < /dev/ttyS0
====================
speed 9600 baud; rows 0; columns 0; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
eol2 = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R; werase = ^W;
lnext = ^V; flush = ^O; min = 1; time = 0;
-parenb -parodd cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff
-iuclc -ixany -imaxbel
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
echoctl echoke

As to the cable, I'm using an "off the shelf" Belkin cable, 9-pin on one
side, 25-pin on the other.  I'll have to retrieve my ohm meter from Jim's
place before I can check the pins.  I actually have two serial cables and
neither work.

Other info: I've tried connecting to the modem using other CD-ROM bootable
linux versions.  As in Knoppix 3.1 (very nice, by the way) and lnx-bbc.
Neither worked.

I did try going light with modules.  Did a rmmod on mkiss and ax25.
Also, poked around /proc and everything there seems to be in order.
I.e., I don't see any conflicts.  And, I still have the same problem.

Just to make sure, I checked all the pins on my serial cables:

Pin	TNC		Computer
Name	(25-pin)	(9-pin)
=================================
FG	1		n/a
TXD	2		3
RXD	3		2
RTS	4		7
CTS	5		8
DSR	6		6
SG	7		5
DCD	8		1
DTR	20		4

Both serial cables work with both TNC's (PK-96 and KPC-3+) under Win98.
I've got two machines running with debian and neither of them seem to be
getting up on /dev/ttyS0 (both have PS2 ports for the mouse connections;
no conflicts there).

I was poking around looking for packages that might help me with this
serial problem.  I found one called "statserial".  I ran it on one of the
machines I'm trying to setup.  It updates the table below every second or
so:

Signal  Pin  Pin  Direction  Status  Full
Name    (25) (9)  (computer)         Name
-----   ---  ---  ---------  ------  -----
FG       1    -      -           -   Frame Ground
TxD      2    3      out         -   Transmit Data
RxD      3    2      in          -   Receive  Data
RTS      4    7      out         1   Request To Send
CTS      5    8      in          0   Clear To Send
DSR      6    6      in          0   Data Set Ready
GND      7    5      -           -   Signal Ground
DCD      8    1      in          0   Data Carrier Detect
DTR     20    4      out         1   Data Terminal Ready
RI      22    9      in          0   Ring Indicator

When I turn on the PK-96, CTS, DSR and DCD go to status=1.  However, when
I fire up minicom or kermit and send "*", asterisks, TxD and RxD simply
show no status, neither a 1 or 0.  The fact that I'm getting a status
change on the input CTS, DSR and DCD, suggests there "shouldn't" be a
conflicting IRQ or port, I think, which leads me to believe there is some
misconfigured parameter.  This is all amateurish speculation, of course.
The plot thickens....

So, is there anyone out there that might give me a suggestions as to what
I'm missing?

Thanks,
Dave
WB0RAZ

