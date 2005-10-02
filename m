From: aa6qn@aa6qn.sytes.net
Subject: UDEV and MKISS errors with 2.6.12 Gentoo
Date: Sun, 2 Oct 2005 07:15:38 -0700 (PDT)
Message-ID: <48692.127.0.0.1.1128262538.squirrel@127.0.0.1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have tried to get a Data Engine (dual port tnc) to load with mkiss. I am
using Bernards /dev/pts patches (mkiss.c, kissattach.c) and ax25ipd
patches (ax25ipd.h, ax25ipd.c and ioc.c).

BTW I did have this similar setup using devfs and pty interfaces for
several years with no known problem. However devfs is be depreciated with
the newer kernels.

My startup script:

# load modules
modprobe ax25
modprobe mkiss

#(it loads just fine and reports to lsmod)

#load secondary 44 domain to my eth0 port
/sbin/ifconfig eth0:0 44.8.0.115 netmask 255.255.255.0 broadcast
44.8.0.255 up

# attach the mkiss ports
 /usr/sbin/mkiss -s 9600 -l /dev/ttyS0 /dev/ptmx /dev/ptmx
 /bin/sleep 4
 # kissattach links a slave pseudo tty to ax25 port 0
 /usr/sbin/kissattach /dev/pts ax0 44.8.0.115
 # kissattach links a second slave pseudo tty to ax25 port ax2
 /usr/sbin/kissattach /dev/pts ax1 44.8.0.115

# note: my axports refers to ax0 and ax1 (as stated in the ifconfig -a
statement)

# Here is the console output
aa6qn conf.d #  /usr/sbin/mkiss -s 9600 -l /dev/ttyS0 /dev/ptmx /dev/ptmx
MKISS: pseudo tty Unix98 master device : /dev/ptmx
MKISS: pseudo tty Unix98 master device : /dev/ptmx
aa6qn conf.d #  /bin/sleep 4
aa6qn conf.d #  # kissattach links a slave pseudo tty to ax25 port 0
aa6qn conf.d #  /usr/sbin/kissattach /dev/pts ax0 44.8.0.115
KISSATTACH interface : /dev/pts
Unix98 slave pseudo tty requested
pseudo tty /dev/pts/1 opened
kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?
aa6qn conf.d #  # kissattach links a second slave pseudo tty to ax25 port ax2
aa6qn conf.d #  /usr/sbin/kissattach /dev/pts ax1 44.8.0.115
KISSATTACH interface : /dev/pts
Unix98 slave pseudo tty requested
pseudo tty /dev/pts/2 opened
kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel

# The tail of messages has this error msg
ct  2 06:43:28 aa6qn net.agent[11784]: add event not handled


I could use some help with "error setting line discipline: TIOCSETD".
Seems that I am close but no cigar. BTW I did try renaming the axports to
0 and 1 with no joy.

my axports:
# /etc/ax25/axports
#  Name Callsign        speed           paclen  window  description
#ax0    AA6QN-9         9600            256     2       AXIP Link
ax0     AA6QN-12        9600            256     1       1200 bps Port A DE
145.050 MHz
ax1     AA6QN-11        9600            256     2       9600 bps Port B DE
439.050 MHz

I have pty and pts support loaded in the kernel along with the Amateur
drivers (these are modules).

Thank you in advance, John AA6QN



