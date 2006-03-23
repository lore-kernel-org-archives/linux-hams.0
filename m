From: Doug <appld@sasktel.net>
Subject: Problems loading xd704j drivers
Date: Wed, 22 Mar 2006 19:15:09 -0600
Message-ID: <6.1.2.0.2.20060322190026.031dc2f0@mail.sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I am attempting to get up and working xd704j with a front end node.
I am using Karl Larsen's 'NETROM-NODE mini HOW-TO'. Every thing seemed
to go well until I tried to start the bbs using the command fbb -a. I
got the following results and error:

********************************************************
* XFBB Linux daemon version 7.04j (Mar 20 2006) PID=1483
* Copyright F6FBB 1986-1999. All rights reserved.
*
* This software is in the public domain. It can be copied
* or installed for any use abiding by the laws.
*
* F6FBB (Jean-Paul ROUBELAT) declines any responsibilty
* in the use of XFBB software.
*
* This software is free of charge, but a 100 FF or 20 US$
* (or more) contribution will be appreciated.
*********************************************************
Parameters set-up
vers : FBB7.04
call : VE5TH.#SCSK.SK.CAN.NA
ssid : 0
qral : DO70QK
city : REGINA
conf : /etc/ax25/fbb
data : /var/ax25/fbb
mess : /var/ax25/fbb/mail
comp : /var/ax25/fbb/binmail
fbbd : *,*,/var/ax25/fbb/fbbdos,*,*,*,*,*
fbbd : <*,*,/var/ax25/fbb/fbbdos,*,*,*,*,*>
0 : {*}
0 : {}
1 : {*}
1 : {}
2 : {/var/ax25/fbb/fbbdos}
2 : {C:\var\ax25\fbb\fbbdos\}
3 : {*}
3 : {}
4 : {*}
4 : {}
5 : {*}
5 : {}
6 : {*}
6 : {}
7 : {*}
7 : {}
yapp : /var/ax25/fbb/fbbdos/yapp
docs : /var/ax25/fbb/docs
name : DOUG
syso : VE5DA
sysm :
impo : /var/ax25/fbb/mail/mail.in
logs : OK
test : NO
fbbf : OK 160
fbbc : OK 3
aski : OK
mask : 1634
secu : 0 4 63
warn : 255
hous : 2
time : 10 20
maxd : 0 0
loca : -6
beac : 8
scro : 1500 1500 1500
fwdh : [$c] $$:$R
maxb : 30000
life : 10
wpca :
zipc : 000000
unpr : 500 5 P
upba :
dwba :
   pg : /usr/lib/fbb/pg
fdir : /usr/lib/fbb/filter
sdir : /usr/lib/fbb/server
tdir : /usr/lib/fbb/tool
poph :
LINUX virtual paged memory Set-up
Texts set-up
1 language buffers allocated
Init lang  ENGLISH
Init lang FRANCAIS
ENGLISHRS232 ports set-up
Ports set-up
Message : Error file PORT.SYS line 15 :
< Wrong number of parameters     >
Configuration error ! Giving up.

It apparently saw an error when attempting to load the
port.sys file. That file is as follows:


# FBB7.03
#
#Ports TNCs
  3     4
#
#Com Interface Adress (Hex) Baud
  1   9         0            9600
  2   9         0            9600
  3   9         189C          0
#
#TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode  Freq
  0   0    0   0      0     0     0     0     00/01   ----  File-fwd.
  1   4    1   ax0   235   4     1     10     00/15   XUWY  447.050
  2   4    2   ax1   235   4     1     10     00/15   XUWY  144.910
  3   6    1   netbbs 235  4     4     10     00/60   XUW
  4   4    3   0     235   5     4     10     15/30  TUWY  TELNET
#
# End of file.
#

The error seems to happen when it tries to execute the line with
'netbbs' in it. If I comment out that line, and then start the
bbs, it loads, and I am able to copy packets with xfbbC and
with the Listen command. I can't for the life of me see what
is wrong with that line of code.

This is new territory for me and I need a little help. If anyone
can offer some assistance, I would greatly appreciate it.

Thanks
Doug VE5DA 


