From: <linuxham@ntlworld.com>
Subject: Yaesu CAT issues
Date: Sat, 27 Dec 2003 13:17:34 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031227131724.WWFM19387.mta05-svc.ntlworld.com@[10.137.100.72]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I have an issue using my FT817 on my linux box. Initially I was using mserver to share the serial port to allow remote access from a windows PC. This didn't function properly with the 817 but worked fine with my Icom PCR1000. To eliminate any issues with the mserver installation I've installed hamlib and used the control control within that.

On the pcr1000 it works fine:-

./rigctl -vvvvv -s 9600 -r /dev/ttyS5 -m 401
rigctl, Hamlib version 1.1.4
Report bugs to <hamlib-developer@lists.sourceforge.net>

rig:rig_init called
rig: loading backend pcr
pcr: _init called
rig_register (402)
rig_register (401)
rig:rig_open called
TX 6 bytes
0000     48 31 30 31 0d 0a      H101..
RX 1 bytes
0000     0a     .
0000     47 30 30 ff    G00.
read_block: timedout after 4 chars
TX 6 bytes
0000     47 33 30 30 0d 0a      G300..
RX 1 bytes
0000     0d     .
RX 6 bytes
0000     47 30 30 30 0d 0a      G000..
Opened rig model 401, 'IC-PCR1000'
Backend version: 0.1, Status: Alpha

Rig command: f
Frequency: 145000000

Rig command: F
Frequency: 123456780
TX 20 bytes
0000     4b 30 30 31 32 33 34 35 36 37 38 30 30 35 30 32        K001234567800502
0010     30 30 0d 0a                                            00..
RX 1 bytes
0000     0a     .
RX 6 bytes
0000     47 30 30 30 0d 0a      G000..

Rig command: f
Frequency: 123456780

Rig command: q
rig:rig_close called
TX 6 bytes
0000     48 31 30 30 0d 0a      H100..
RX 1 bytes
0000     0a     .
0000     48 31 30 f8    H10.
read_block: timedout after 4 chars
rig:rig_cleanup called


But the 817 doesn't:-

./rigctl -vvvvv -s 4800 -r /dev/ttyS4 -m 120
rigctl, Hamlib version 1.1.4
Report bugs to <hamlib-developer@lists.sourceforge.net>

rig:rig_init called
rig: loading backend yaesu
yaesu: initrigs1_yaesu called
rig_register (121)
rig_register (105)
rig_register (120)
rig_register (101)
rig_register (115)
rig_register (113)
rig_register (114)
rig_register (104)
ft817:ft817_init called
rig:rig_open called
ft817:ft817_open called
Opened rig model 120, 'FT-817'
Backend version: 0.1, Status: Alpha

Rig command: f
TX 5 bytes
0000     00 00 00 00 03 .....
RX 5 bytes
0000     80 80 80 80 10 .....
Frequency: 808080800

Rig command: F
Frequency: 145000000
ft817: requested freq = 145000000 Hz
ft817: vfo =536870912
ft817: requested freq after conversion = 145000000 Hz
TX 5 bytes
0000     14 50 00 00 01 .P...

Rig command: f
TX 5 bytes
0000     00 00 00 00 03 .....
RX 5 bytes
0000     80 80 80 80 f0 .....
Frequency: 808080800

Rig command: quit
rig:rig_close called
ft817:ft817_close called
rig:rig_cleanup called
ft817:ft817_cleanup called

----

FWIW the 817 works fine on my laptop running windows. I've also tried different serial speeds (changing the relevant speed on the radio too). I've also tried ttyS1, ttyS4 and ttyS5 to eliminate any issues with a specific serial port. I have several serial devices connected to the machine (modem, pcr1000, ups) and these all function perfectly.


I've had the 817 working on the this machine with exactly the same hardware config before now. The only thing which has changed recently is I've upgraded the kernel to 2.6.0 - I've yet to try downgrading back to 2.4 but it seems unlikely this is the problem given everything else works fine.

Any ideas?

73

Steve G8ZQO


-----------------------------------------
Email provided by http://www.ntlhome.com/


