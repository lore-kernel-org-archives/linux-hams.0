From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring corruption HELP Required please
Date: Sun, 1 Jun 2014 10:48:36 +0100
Message-ID: <T1wVLuA0bviTFw2H@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk> <53406C67.3080008@trinnet.net>
 <0AC34FBF7531404B98449A9318023E3B011B294F@EXMBX16.thus.corp>
 <5341A229.8010902@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5341A229.8010902@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>


Hi David and everyone on list

Here is the Solution to the problem I encountered.


8 port PCI VScomm TC-800L multiport serial card.

Still using UBUNTU 12.04LTS
Linux gb7cip.ampr.org 3.5.0-51-generic #76~precise1-Ubuntu SMP
i686 i686 i386 GNU/Linux


There is an issue with setserial which is a 2000 version
setserial version 2.17, 27-Jan-2000 that does no update corrections
to configurations.
 From what I read from the Professor Google files, UBUNTU identified
the issue late 2013..

So MANUALLY configured the settings setserial.conf and applied them
system assigns IRQ22.

# If you want to configure this file by hand, use
# dpkg-reconfigure setserial
commanded failed  Set MANUAL
and rededited file /var/lib/setserial/autoserial.conf

/dev/ttyS4 uart 16950/954 port 0xef00 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS5 uart 16950/954 port 0xef08 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS6 uart 16950/954 port 0xef10 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS7 uart 16950/954 port 0xef18 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS8 uart 16950/954 port 0xed00 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS9 uart 16950/954 port 0xed08 irq 22 baud_base 921600 spd_normal 
autoconfigure
/dev/ttyS10 uart 16950/954 port 0xed10 irq 22 baud_base 921600 
spd_normal autoconfigure
/dev/ttyS11 uart 16950/954 port 0xed18 irq 22 baud_base 921600 
spd_normal autoconfigure

This still did not resolve the problem of random lost of up to 4 of the 
serial radio ports still continued.

The associated interface socat and kissattach processes were still 
running.
ax25d process check every minute advising lost ports.
The IP routes and netrom routes get deleted as well, which are 
associated with the failed interface.

ifconfig ax## would confirm that it has lost the port/interface axport 
parameters.

To force an error. I set the boot option in the GRUB menu
pci=routeirq  # For all devices temp work around for broken drivers

Then reviewed the syslog  Was very Interesting.. and Bingo!!!
Found modem-manager starting and stopping the serial ports.

Deleted modem-manager  sudo apt-get purge modemmanager
as do not run dial up modems. rebooted without the pci=routeirq boot 
option.


We now have PCI VScomm  8 serial ports active connected to 6 paccom 
TNC's and
two SCS PTCiipro data controllers.  All working.

At the time of writing this. they have been up for 23 hours..  instead 
of a few minutes.

another Big 'EUREKA' moment..

Now to get back to working on the other code that are not working
during this 'now painfull' phase 2 rebuild that I started 31 March.

Hope this is of interest.

73 de Paul g4apl sysop gb7cip


In message <5341A229.8010902@trinnet.net>, David Ranch 
<linux-hams@trinnet.net> writes
>
>Hello Paul,
>
>
>> test 3 FAILED  I was able to connect out via the three radio interfaces
>> then found ax1 had later gone AWOL.  Extracted all that I can find 
>>related toe ax0 ax1 ax2 in the
>> messages log
>
>So are you saying that ax0, ax1, and ax2 all looked ok and you were 
>able to make outgoing connections on each of them but after a period of 
>me, ax1 disappeared?  Do you know when?  Maybe it disappeared after you
>disconnected from the ax1 link?   This is a key detail we need to know.
>
>> ax0 u433 ttyS8
>> ax1 u439 ttyS5
>> ax2 v70  ttyS10
>
>What are these "u433, u439, and v70" terms?  Are those the device names 
>in /etc/ax25/axports?
>
>
>> confirm
>> connect out via radio on port ax0 u433
>> connect out via radio on port ax1 u439
>> connect our via radio on port ax2 v70
>
>What program are you using to make these outgoing calls?  "axcall" or 
>"call"?  Maybe something else?
>
>
>What other packet software are you running during these simple tests? 
>Any netrom, node, ax25d, ax25ipd, BBS, or other software?  Below it 
>shows you might be running the legacy NODE program.  Yes?
>
>
>> 15:51  u439 has gone AWOl
>> ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8
>>            inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
>>            UP BROADCAST RUNNING  MTU:256  Metric:1
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:603 (603.0 B)
>>
>> ax1       Link encap:AMPR AX.25  HWaddr 
>>AWOL <<<<<<<<<<<<<<<<<<<<<<
>>            BROADCAST MULTICAST  MTU:236  Metric:1          NOTE MTU 
>>as changed
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>>
>> ax2       Link encap:AMPR AX.25  HWaddr GB7CIP-4
>>            inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
>>            UP BROADCAST RUNNING  MTU:256  Metric:1
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:250 (250.0 B)
-- 
paul@skywaves.demon.co.uk
