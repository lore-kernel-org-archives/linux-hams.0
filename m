From: "Abbaterusso Giuseppe" <iz2giu@tin.it>
Subject: Setting
Date: Mon, 29 Apr 2002 20:48:04 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000001c1efae$86f2eda0$04a3862c@iz2daw.2.it.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi!
Sorry I'm a few newbie,
There are someone can tell me what utils parameters for :
tnc kantronics - kpc 4?
At the moment they are: kissparms - p 1 - t 100  -s100  -r 25 but are not
good.

(See ax25-how-to)
OM have problem to connect my Linuxnode station..(Login..timeout after 60
second..when connect in telnet mode..PMS not run..et cetera):-(((
But If I connect BBS  there are no problem

It's possible without  to change ax25utils... to reinstall only PMS and how
to do..?


I use :

- trx "kenwood tm-v7"
- tnc "kantronics - kpc 4" - 1200 bps
- distro Linux Red Hat 6.1 and kernel 2.2.18
- pc pentium 166 mmx 64 MB Ram, HD 5 GB for S.O. Linux;
- vertical antenna for vhf/uhf
- ax25-utils-2.1.42a

What are alternative at prg PMS ? Perhaps Linkt or Linpac. This programs
need other
libraries more than default installed on Red Hat 6.1
Tanks in advances for info.
Best Regards..73! de iz2daw, Giuseppe.

P.S.
Here is my configurations:

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#

1   IZ2DAW-2   1200     255     7       144.800 MHx (1200 bps)
#2 OH2BNS-9  38400  255     7       TNOS/Linux  (38400 bps)
#1  IZ2DAW-2    38400  255     7       432.725 Mhz (38400 bps)
***************************************************************************

# /etc/ax25/node.conf - LinuxNode configuration file
#
# see node.conf(5)

# Idle timeout (seconds).
#
IdleTimeout 54000

# Timeout when gatewaying (seconds).
#
ConnTimeout 54000

# Visible hostname. Will be shown at telnet login.
#
HostName iz2daw.2.it.ampr.org

# ReConnect flag.
#
ReConnect on

# "Local" network.
#
#LocalNet 44.0.0.0
LocalNet 44.134.163.4/32

# Command aliases. See node.conf(5) for the meaning of the uppercase
# letters in the name of the alias.
#
Alias  CAllbook "telnet %{2:zone.oh7rba} 1235 %1 s"
#Alias  CONVers  "telnet %{2:oh2ti} 3600 \"/n %u %{1:139}\""
#Alias           CONV     "telnet iz2daw.2.it.ampr.org"
Alias  CLuster  "connect hkiclk"
#Alias           BBS "connect 1 i2nos-8"

# Hidden ports.
#
#HiddenPorts 2

# External commands. See node.conf(5) for the meaning of the uppercase
# letters in the name of the extcmd.
#
# Flags: 1 Run command through pipe
#  2 Reconnected flag
#
ExtCmd  PMS 3 root /usr/sbin/pms pms -u %U -o IZ2DAW
#ExtCmd  TPM 3 nobody /usr/bin/finger finger tpm
#ExtCmd  Echo 1 nobody /bin/echo echo %U %u %S %s %P %p %R %r %T %t %% %0
%{1:foobar} %{2} %3
%4 %5

# Node ID.
#
NodeId  #LNODE:IZ2DAW-9

# Netrom port name. This port is used for outgoing netrom connects.
#
#NrPort  netrom

# Logging level
#
LogLevel 3

# The escape character (CTRL-T)
#
EscapeChar      ^T

****************************************************************************
*********************************************


# /etc/ax25/node.perms - LinuxNode permissions file
#
# see node.perms(5)

# user type port passwd perms

# User oh2bns can login without password from anywhere else but 'inet'.
#
#oh2bns inet * qwerty 95
#oh2bns * * * 95
iz2daw  *       *       *      255
ik2pzs  *       *       *       95
iz2bka  *       *       *       95

# OH2RBI is a bbs so it needs escape disabled.
#
#oh2rbi * * * 287

# Default permissions per connection type.
#
* ax25 * *      159
* netrom * * 31
* local * *      159
* ampr * * 31
* inet * * 0
* host * * 31





