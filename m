From: Phil <phil@spiderweb.com.au>
Subject: SIOCSIFFLAGS: Input/output error
Date: Sat, 7 May 2005 22:26:10 +1000
Message-ID: <200505072226.11233.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

Hello,

I'm about to do the "Grey Nomad" thing and hit the road in our motorhome. I 
thought it might be handy to have a packet system to play with.

I'm using a USB to serial converter which works without any problems with 
other serial devices, however, I get the error message shown on the subject 
line when I attempt to use my Baycom modem. This is the init script that I've 
used for years, but with /dev/ttyS0 instead of ttyUSB0:

setserial /dev/ttyUSB0 uart none
modprobe baycom_ser_fdx
sethdlc -p -i bcsf0 mode "ser12*" io 0x3f8 irq 4
ifconfig bcsf0 up
ifconfig bcsf0 10.0.0.1
axparms -setcall bcsf0 VK4BVM

I can see that the lines that begin with "ifconfig bcsf0" are the culprits. I 
have /etc/ax25/parms/bcf0/. What am I missing?

-- 
Regards,
Phil.
