From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: ax25ipd configuration problem
Date: Sun, 16 Nov 2003 21:38:05 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FB7E02D.D5CC7D78@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hello,

I tried to setup a high speed AX25 tunnel using our brand new wlan netw=
ork
without success.
The problem is the following answer:

[root@f6fgz root]# ax25ipd -l 3
fetching tty device parameters: Invalid argument

My ax25ipd.conf:
socket ip
mode tnc
device /dev/ttyp4
speed 19200
loglevel 0
broadcast QST-0 NODES-0
route f6fkq delta.localnet

My kiss stuffs:
mkiss -s 19200 -l /dev/ttyS1 /dev/ptyp1 /dev/ptyp2
mkiss -s 19200 -l /dev/ttyS0 /dev/ptyp3 /dev/ptyp4
kissattach -m 256 /dev/ttyp1 vhf  f6fgz
kissattach -m 512 /dev/ttyp2 uhf1 f6fgz
kissattach -m 256 /dev/ttyp3 uhf2 f6fgz
kissattach -m 256 /dev/ttyp4 uhf3 f6fgz

All AX interfaces are up and running since years with this config. Only=
 new
ax25ipd add-on won't work.

What's wrong ? Thanks for your help.

BTW, photos of the wlan on http://f6fgz.free.fr/HamLan (29 km and a ste=
ady 80
kb/s !)

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
