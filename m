From: Wijaya <wijaya_mail@yahoo.com>
Subject: Setting kiss mode Kantronics kpc-9612+ on linux
Date: Mon, 5 Jul 2004 06:57:14 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040705135714.44447.qmail@web41209.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi there, I need advice and help, how to setting up kiss mode on linux use
tnc from Kantronics (KPC-9612+). 
I never setting up any tnc devices before. But I've succed to control this
device via minicom to connect each others and send/receive simple message
over it without problem.
I want to to set up 1200bps connection via port 1 kpc-9612p.
Both use Slackware Linux 9.1, kernel 2.4.22 with tnc installed  on serial
port 2 (ttyS1). 
Hostname on each pc is JASMINE and WIJAYAKUSUMA. 
JASMINE ip address 172.16.12.12 with ssid/callsign is RE4YGY.
WIJAYAKUSUMA ip address 172.16.12.8 with ssid/callsign is RE4SLO.
I read and follow AX25-Howto. Kernel was reconfigured and compiled without
any problems. AX25 Library, tools and applications was compiled perfectly
without any error / warning message.
Both configure simillar. the only different is name and ip address. But it
can't connect each others. 

ax25d message :
AX.25 port JASMINE bound to device ax0
nrconfig: port netrom not active
rsconfig: port JASMINE not active

And ax25ipd giving error message :
fetching tty device parameters: Invalid argument
Look at configuration below :

/etc/modules.conf 
alias net-pf-3     ax25
alias net-pf-6     netrom
alias net-pf-11    rose
alias tty-ldisc-1  slip
alias tty-ldisc-3  ppp
alias tty-ldisc-5  mkiss
alias bc0          baycom
alias nr0          netrom
alias pi0a         pi2
alias pt0a         pt
alias scc0         optoscc    (or one of the other scc drivers)
alias sm0          soundmodem
alias tunl0        newtunnel
alias char-major-4 serial
alias char-major-5 serial
alias char-major-6 lp

JASMINE Configuration

/etc/rc.d/rc.local
#!/bin/sh
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local setup commands in here:
/sbin/insmod ax25
/sbin/insmod mkiss
/usr/sbin/mkiss -s 9600 /dev/ttyS1 /dev/ptyq0 /dev/ptyq1
/usr/sbin/kissattach /dev/ttyq0 JASMINE 172.16.12.8
#/sbin/ifconfig ax0 172.16.12.8 netmask 255.255.255.0
/usr/sbin/ax25d -l
/usr/sbin/ax25ipd 

/etc/ax25/axports
# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
#1	OH2BNS-1	1200	255	2	144.675 MHz (1200  bps)
#2	OH2BNS-9	38400	255	7	TNOS/Linux  (38400 bps)
#WIJAYA	RE4SLO		1200	255	2	144.675 MHz (1200  bps)
JASMINE	RE4YGY		1200	255	2	144.675 MHz (1200  bps)

/etc/ax25/nrports
# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
#netrom	OH2BNS-10 #LNODE	235	Switch Port
netrom	RE4YGY	  #LNODE	235	Switch Port

/etc/ax25/rsports
# /etc/ax25/rsports
#
# The format of this file is:
#
# name address description
#
#rose	2080192203	Rose port
rose	2080192203	Rose port

/etc/ax25/ax25d.conf
# /etc/ax25/ax25d.conf
#
# ax25d Configuration File.
#
# AX.25 Ports begin with a '['.
#
#[OH2BNS VIA 1]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
#[OH2BNS-2 VIA 1]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/sbin/node	node
#
#
#[OH2BNS VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
#[OH2BNS-2 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/sbin/node	node
#
#[OH2BNS-3 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/axwrapper	axwrapper
/usr/bin/finger finger
#
#[OH2BNS-9]
#NOCALL  * * * * * *  L
#default * * * * * *  -	root  /usr/sbin/node	node
#
# NET/ROM Ports begin with a '<'.
#
#<netrom>
#NOCALL  * * * * * *  L
#default * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
#<netrom>
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/sbin/node	node
#
#<netrom>
#NOCALL  * * * * * *  L
#default * * * * * *  -	root  /usr/sbin/node	node
#
[RE4SLO VIA JASMINE]

/etc/ax25/ax25ipd
#
# ax25ipd configuration file for station floyd.vk5xxx.ampr.org
#
# Select axip transport. 'ip' is what you want for compatibility
# with most other gates ...
#
socket ip
#
# Set ax25ipd mode of operation. (digi or tnc)
#
mode tnc
#
# If you selected digi, you must define a callsign.  If you selected
# tnc mode, the callsign is currently optional, but this may change
# in the future! (2 calls if using dual port kiss)
#
#mycall vk5xxx-4
#mycall2 vk5xxx-5
#
# In digi mode, you may use an alias. (2 for dual port)
#
#myalias svwdns
#myalias2 svwdn2
#
# Send an ident every 540 seconds ...
#
#beacon after 540
#btext ax25ip -- tncmode rob/vk5xxx -- Experimental AXIP gateway
#
# Serial port, or pipe connected to a kissattach in my case
#
#device /dev/ttyp0
device /dev/ttyq0
#
# Set the device speed
#
#speed 9600
speed 9600
#
# loglevel 0 - no output
# loglevel 1 - config info only
# loglevel 2 - major events and errors
# loglevel 3 - major events, errors, and AX25 frame trace
# loglevel 4 - all events
# log 0 for the moment, syslog not working yet ...
#
#loglevel 0
loglevel 4
#
# If we are in digi mode, we might have a real tnc here, so use param to
# set the tnc parameters ...
#
#param 1 20
#
# Broadcast Address definition. Any of the addresses listed will be
forwarded
# to any of the routes flagged as broadcast capable routes.
#
#broadcast QST-0 NODES-0
#
# ax.25 route definition, define as many as you need.
# format is route (call/wildcard) (ip host at destination)
# ssid of 0 routes all ssid's
#
# route <destcall> <destaddr> [flags]
#
# Valid flags are:
#         b  - allow broadcasts to be transmitted via this route
#         d  - this route is the default route
#
#route vk2sut-0 44.136.8.68 b
#route vk5xxx 44.136.188.221 b
#route vk2abc 44.1.1.1
route re4slo 172.16.12.12
#
#


		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail
