From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Trying to get Ax25 running.
Date: Sat, 16 Oct 2004 15:45:27 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1097930726.1287.1.camel@oh2bns.ampr.org>
References: <620c905704101518153ff636e@mail.gmail.com>
	 <620c9057041015095771b236e0@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
	 <620c90570410151618432401d1@mail.gmail.com>
	 <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200410160128.i9G1Sk2M028098@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 2004-10-16 at 04:28, Dennis Boone wrote:

> 	echo -e "\r\033@K1\r" > /dev/ttyUSB0
> 	modprobe ax25; modprobe kiss; modprobe mkiss
> 	/usr/sbin/kissattach -i 44.1.1.1 /dev/ptyz0 kiss0
> 	/usr/sbin/kissparms -p kiss0 -r 254 -s 1 -l 10 -t 100
> 	/usr/sbin/mkiss -c -l /dev/ttyUSB0 /dev/ttyz0

Kissparms should be called *after* mkiss. Otherwise the commands
won't reach the TNC...

-- 
Tomi Manninen / OH2BNS / KP20ME04

