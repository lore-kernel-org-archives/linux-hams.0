From: Ray Heasman <nurf@spamcop.net>
Subject: Kernel panics with 2.4.xx and SCC and AX25
Date: 11 Jul 2002 18:10:10 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1026436211.12372.36.camel@maze.mythral.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I am remote administrating a Debian testing system that is having some
issues. Until recently, it was running a 2.2 kernel, but I needed
hardware support for a new device, forcing me to upgrade.

The old kernel runs fine. The new one (2.4.18 I think, I tried a few
with similar results) initially panicked whenever I tried to load ax25d.
I commented this out and thing seemed happy. Then, a day or so later,
the machine panicked and now panics whenever I try to boot.

The machine uses an ISA Baycom SCC card for communications.

I have gone back to 2.2 in the meantime. Because the machine really
screws up its logs when it panics, I had to get someone to copy out the
kernel panic by hand (ow!). If other information is needed, please
shout, or if someone would like a login to the machine in question etc,
I would be willing to consider the possibility.

Hand copied kernel panic:

AX.25 port loop3 bound to device ax2
Unable to handle kernel paging request at vitual address fffffffc
printing eip:
c010fe50
*pde = 00001063
*pte = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c010fe50>]   Tainted: P
EFLAGS: 00010007
eax: c3c2cb40   ebx: 00000000   ecx: 00000001   edx: 00000001
esi: c3dcd0c0   edi: 00000001   ebp: c0213f30   esp: c0213f18
ds: 0018   es: 0018   ss: 0018
Process swapper (pid: 0, stackpage=c0213000)
Stack: c3c2cb3c c3dcd0c0 c024669c c3c2cb40 00000286 00000001 c0246560
c0198097
       c3dcd0c0 c40b3cf0 c01978dc c3dcd0c0 00000000 c0198585 c40b3cf0
00000000
       c024669c c019be03 c40b3cf0 00000001 c0246568 fffffffd c011624a
c0246568
Call Trace: [<c0198097>] [<c01978dc>] [<c0198585>] [<c019be03>]
[<c011624a>]
   [<c010809e>] [<c0105370>] [<c0109fd8>] [<c0105370>] [<c0105393>]
[<c01053f7>]
   [<c0105000>] [<c0105027>]

Code: 8b 4b fc 8b 01 85 45 fc 74 4d 31 c0 9c 5e fa c7 01 00 00 00
 <0>kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

The relevant part of the script I use to start services follows.
Commented out lines were things I commented out to stop panics the first
time around. The current version produces a guaranteed panic on my
system when booting with 2.4.

-----8<------

#       modprobe netrom
        insmod mkiss
        kissnetd /dev/ptye4 /dev/ptye5&
        kissnetd /dev/ptye6 /dev/ptye7&
        sleep 10
        kissattach /dev/ttye4 loop 44.160.100.6
        kissattach /dev/ttye5 loop2 44.160.100.13
        kissattach  /dev/ttye6 loop3 44.160.100.14
#       nrattach -i 44.160.100.5 netrom
        sleep 3
#       /usr/sbin/mheardd -l
#       /usr/sbin/netromd -d -l -i -t 60
#       ax25d -l
        axparms -assoc ZR6RAY ray
        axparms -assoc ZS6FB bob
        nrparms -routes sccxx ZS6RO-2 + 192
        nrparms -routes scc2m ZS6AES-2 + 192

        beacon -c ZS6FB -d "APRS" -t 60 scc6m ' [KG44IB]!2556.00S/02842.00E#5500/ZS6FB/Bronkhorstspruit'
        beacon -c ZS6FB -d "APRS" -t 60 scc2m ' [KG44IB]!2556.00S/02842.00E#5500/ZS6FB/Bronkhorstspruit'
        beacon -c ZS6FB -d "APRS" -t 60 scchf ' [KG44IB]!2556.00S/02842.00E#5500/ZS6FB/Bronkhorstspruit'
        beacon -c ZS6FB -d "APRS" -t 60 sccxx ' [KG44IB]!2556.00S/02842.00E#5500/ZS6FB/Bronkhorstspruit'

        /usr/local/bin/syncsettings

        # kissparms -p scc6m -t 450
         kissparms -p scchf -s 400

-------8<-------

/usr/local/bin/syncsettings copies a bunch of settings into the proc
filesystem.

Any ideas or help would be much appreciated. I am not running any
proprietary kernel modules. I think one of the ax25 related modules
taints things for some reason.

Many thanks,
Ray
ZR6RAY



