From: Sriram Chadalavada <swenggsri@yahoo.com>
Subject: Kernel panic on use of ping - over a kiss AX.25 interface
Date: Sat, 29 Jan 2005 18:11:08 -0800 (PST)
Message-ID: <20050130021108.395.qmail@web21602.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Hi everyone, 

    I am running a modified version of kissattach on a
MMU-less uCdimm (Motorola MC68VZ328) to create an
AX.25 kiss network interface.

# kissattach -m 512 /dev/ttyS1 radio 192.168.0.9
# ttyS1 console mode off

Contents of axports file:

# name callsign speed paclen window description
#
radio   KC0POH-1        9600    255     2       Radio 
                                    437.385 MHz
1200bps


The ifconfig of the interface is as follows:

ax0       Link encap:AMPR AX.25  HWaddr KC0POH-1
          inet addr:192.168.0.9  Bcast:192.168.0.255 
Mask:255.255.255.0
          UP BROADCAST RUNNING  MTU:512  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0
frame:0
          TX packets:0 errors:0 dropped:0 overruns:0
carrier:0
          collisions:0 txqueuelen:10

However, when I try to ping a peer machine over the
radio link, I get a kernel panic.

# ping -c 1 192.168.0.8
PING 192.168.0.8 (192.168.0.8): 56 data bytes
Kernel panic: Aiee, killing interrupt handler
                                                      
                         
In interrupt handler - not syncing


Relevant kernel configuration is:
# Amateur Radio support
#
CONFIG_HAMRADIO=y
                                                      
                         
#
# Packet Radio protocols
#
CONFIG_AX25=y
# CONFIG_AX25_DAMA_SLAVE is not set
# CONFIG_NETROM is not set
# CONFIG_ROSE is not set
                                                      
                         
#
# AX.25 network device drivers
#
                                                      
                         
#
# AX.25 network device drivers
#
CONFIG_MKISS=y

We need to resolve this problem ASAP to complete the
radio link for our project. I strongly request experts
to help me solve it. Please let me know if you need
any other information.

Thanks in advance,
Sriram





		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail
