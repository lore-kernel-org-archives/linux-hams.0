From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: Serial Port ;-(
Date: Sat, 22 Feb 2003 18:23:45 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030223022345.9961.qmail@web14403.mail.yahoo.com>
References: <20030220120526.GA28160@silly.cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030220120526.GA28160@silly.cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Dear Folks,
 
I have still problem to get the serial port 1 active
in my machine "one" (RH 7.1; Kernel 2.4.19; PCI Sound
Card; ax25 stuff; soundmodem-0.7). In idle condition
the voltage between pin 5 and 7 is -10.77 V, and in
ping condition is -10.79 V. The voltage different is
only 20 mV, I think it is not enough to trigger the
ptt circuit, isn't it.
[my1com]# ifconfig 
..
sm0 Link encap: AMPR AX.25 HWaddr MY1COM inet addr:
44.128.1.5 Bcast: 44.128.1.255 Mask: 255.255.255.0 

But in my other machine "three" (MiniLinux 2.2.15
pre10; ISA Sound Blaster) the serial port condition is
totally different. In idle condition the voltage
between pin 5 and 7 is -11.55 V and in ping condition
is +11.42 V. With this the ptt circuit works fine :-)
[my3com]# ifconfig 
..
sm0 Link encap: AMPR AX.25 HWaddr MY3COM inet addr:
44.128.1.12 Bcast: 44.128.1.255 Mask: 255.255.255.0  

How can I activate the serial port 1 in machine "one"?


Thanks for any help. 
Vivi 

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/
