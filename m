From: "Ronald Jochems" <acfnews@xs4all.nl>
Subject: Re: YAM transmit problem
Date: Sat, 6 Nov 2004 09:54:16 +0100
Message-ID: <001501c4c3de$32527fc0$0a01a8c0@amd2700>
References: <20041106025600.GV16055@alcatraz.vpizza.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Meehan <jmeehan@vpizza.org>, linux-hams@vger.kernel.org

Hi Jim

There are two things to check :
Verify if the HWaddr-ssid is unique for all interfaces (in this case -11)
and not set on other interfaces :
> yam0      Link encap:AMPR AX.25  HWaddr W6XE-11

Next check if this ssid corresponds to the /etc/ax25/axports file.
When the axports is correct pointing to this interface, you can confirm this
with listen. Listen should show the 'name' of the axports interface, not the
physical interface.

Ie : if your /etc/ax25/axports configures :
port1   W6XE-11        115200          255     7       KISS

Then listen should show the incoming packets marked as 'port1' and not
'yam0' :
port1: fm PD1ACF-11 to PD1ACF-5 ctl UI^ pid=CC(IP) len 49
IP: len 49 44.137.2.29->44.137.2.92 ihl 20 ttl 63 DF prot TCP
TCP: 3610->1054 Seq x7ab1128d Ack xb01b9cfc ACK PSH Wnd 16200 Data 9
0000  +OK 0 0..

Above is copied and pasted from my own running setup, only as example.

Next to that you can force some TCP traffic over your port :

#route add 44.1.1.1 yam0
and verify when you ping this 'host' if the transmitter is keyed :
# ping 44.1.1.1


Hope this helpes,

Ron
----- Original Message -----
From: "Jim Meehan" <jmeehan@vpizza.org>
To: <linux-hams@vger.kernel.org>
Sent: Saturday, November 06, 2004 3:56 AM
Subject: YAM transmit problem


> Hello all,
>
> I'm trying to get a YAM modem working with my Linux machine.  I believe
> I've got the configuration correct using yamcfg, ifconfig, and the
> /etc/ax25/axports file.  I can see inbound packets using the "listen" tool
> from the ax25-utils package, and the RX packets counter is incrementing
> when I look at ifconfig:
>
> yam0      Link encap:AMPR AX.25  HWaddr W6XE-11
>           inet addr:10.0.0.1  Mask:255.0.0.0
>           UP RUNNING  MTU:256  Metric:1
>           RX packets:108 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
>           Interrupt:4 Base address:0x3f8
>
> However, when I try to transmit packets, using the "beacon" tool, or
> ax25_call, no packets are transmitted.  I don't believe this is a hardware
> problem, since I don't see the TX packets counter in ifconfig
incrementing,
> and I don't see any outbound packets in the output from "listen".  Also,
> I don't see the red TX LED go on on the YAM board.
>
> Any ideas on why none of the ax25 programs are transmitting packets?
>
> Thanks,
>
> Jim, W6XE
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

