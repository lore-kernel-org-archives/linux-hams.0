From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: Re: packet radio indoor :-(
Date: Mon, 30 Dec 2002 13:48:16 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021230214816.58459.qmail@web14408.mail.yahoo.com>
References: <Pine.LNX.4.44.0212301220060.6319-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1347117075-1041284896=:57969"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212301220060.6319-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

--0-1347117075-1041284896=:57969
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- Wilbert Knol <zl2bsj@zl2tze.ath.cx> wrote:
> Is sm0 'UP'?? (next line, please)

Yes, I think so ... because

my1com# ifconfig
eth0   ..
lo      ..		
sm0  Link encap: AMPR AX.25 HWaddr MY1COM
     inet addr: 44.128.1.5 Bcast: 44.128.1.255 Mask:
255.255.255.0
     ..

my2com# ifconfig
eth0  ..
lo    .. 
sm0  Link encap: AMPR AX.25 HWaddr MY2COM
     inet addr: 44.128.1.8 Bcast: 44.128.1.255 Mask:
255.255.255.0
     ..

> Are the sound modems actually transmitting audio?
> Check with as 
> pair of headphones. If you blow your brains out,
> then it's working :-)

The sound modem transmit audio/noise if I connect
spk_out to a speaker
[my1com]$ ping my2com

spk_sc1|-----|speaker| ...bep...bep... 


[my1com] route -n
Destination      Gateway     Genmask        Flags 
Metric  Ref  Use  Iface
44.128.1.0      0.0.0.0     255.255.255.0   U        0
        0      0     sm0
192.168.10.0  0.0.0.0     255.255.255.0   U        0  
      0      0     eth0
127.0.0.0        0.0.0.0     255.0.0.0           U    
   0         0      0      lo

> You will have to tell your machine what port to send
> the frame on;
> 
> route add 44.128.1.8 sm0

[my1com] route add 44.128.1.8  sm0
[my1com] route -n
Destination      Gateway     Genmask             Flags
 Metric  Ref  Use  Iface
44.128.1.8      0.0.0.0     255.255.255.255    UH    
0         0      0     sm0
44.128.1.0      0.0.0.0     255.255.255.0        U    
   0         0      0     sm0
192.168.10.0  0.0.0.0     255.255.255.0        U      
 0         0      0     eth0
127.0.0.0        0.0.0.0     255.0.0.0               
U        0         0      0      lo

> You may also have to set an ARP entry (man arp)

[my1com] cat /etc/ax25/axports
name   callsign    speed   paclen   window   
description
sc        my1com  1200     255         2           
soundcard

[my1com] arp  -n  44.128.1.8  -H  ax25  -s  MY2COM  -i
 sm0
[my1com] cat  /proc/net/arp
IP add           HW type   Flags    HW address        
   mask    Device
44.128.1.8      0x3           0x6     MY2COM-0     *  
 sm0

> Are you seeing anything on the interfaces? Try:
> 'listen -a -c'

[my1com]# ping my2com
PING my2com.ampr.org (44.128.1.8) from 44.128.1.5:
56(84) bytes of data
From my1com.ampr.org (44.128.1.5): Destination Host
unreachable
..
[my1com]# listen -a
axconfig: port 1 not active
axconfig: port 2 not active
sc: fm my1com to my2com ctl UI pid=CC(IP) len 84
IP: len 84  44.128.1.5->44.128.1.8 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 22789 seq 3840
0000  -..>iD..................| "#$%&'()*+,-./01234567
sc: ....
....


Many thanks for all assistance, but 'ping' is still
unuseable ;-(
What should I do please?
 
Thanks,
Vivi.


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
--0-1347117075-1041284896=:57969
Content-Type: text/richtext; name="packet_radio_indoor.rtf"
Content-Description: packet_radio_indoor.rtf
Content-Disposition: inline; filename="packet_radio_indoor.rtf"

{\rtf1\ansi\ansicpg10001\deff0{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fswiss\fcharset77 Helvetica;}{\f2\fmodern\fcharset77 CourierNewPSMT;}}
\viewkind4\uc1\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\lang1033\f0\fs24 [my1com] route -n\par
Destination      Gateway     Genmask        Flags  Metric  Ref  Use  Iface\par
44.128.1.0      0.0.0.0     255.255.255.0   U        0         0      0     sm0\par
192.168.10.0  0.0.0.0     255.255.255.0   U        0         0      0     eth0\par
127.0.0.0        0.0.0.0     255.0.0.0           U        0         0      0      lo\f1\par
\par
> You will have to tell your machine what port to send\par
> the frame on;\par
> \par
> route add 44.128.1.8 sm0\par
\par
\f0 [my1com] route add 44.128.1.8  sm0\par
[my1com] route -n\par
Destination      Gateway     Genmask             Flags  Metric  Ref  Use  Iface\par
44.128.1.8      0.0.0.0     255.255.255.255    UH     0         0      0     sm0\par
44.128.1.0      0.0.0.0     255.255.255.0        U        0         0      0     sm0\par
192.168.10.0  0.0.0.0     255.255.255.0        U        0         0      0     eth0\par
127.0.0.0        0.0.0.0     255.0.0.0                U        0         0      0      lo\f1\par
\par
> You may also have to set an ARP entry (man arp)\par
\par
\f0 [my1com] cat /etc/ax25/axports\par
name   callsign    speed   paclen   window    description\par
sc        my1com  1200     255         2            soundcard\par
\par
[my1com] arp  -n  44.128.1.8  -H  ax25  -s  MY2COM  -i  sm0\par
[my1com] cat  /proc/net/arp\f1\par
\f0 IP add           HW type   Flags    HW address            mask    Device\par
44.128.1.8      0x3           0x6     MY2COM-0     *    sm0\f2\par
}

--0-1347117075-1041284896=:57969--
