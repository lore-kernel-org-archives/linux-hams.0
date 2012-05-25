From: Christoph =?ISO-8859-1?Q?R=FCckert?= <christoph.rueckert@arcor.de>
Subject: Re: Using ax25ipd
Date: Fri, 25 May 2012 08:36:45 +0200
Message-ID: <1847524.gVffkFcPB5@dk2crn-new>
References: <4FBEB9ED.3050805@boling.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FBEB9ED.3050805@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: "Charles Boling (AD7UF)" <junk07+ham@boling.us>
Cc: linux-hams@vger.kernel.org

Hello,

well I'm using the ax25ipd-software from <http://www.linux-ax25.org/wiki/CVS>.
You can create a connection between kernel and ax25ipd by bpq-pipe:

change device-line in /etc/ax25/ax25ipd.conf:
device axipd

no changes in /etc/ax25/axports.

create startscript /etc/init.d/ax25:
#!/bin/sh
AXPORT=axudp
BPQPIPE=axipd
ARP_CALL=AD7UF-12
IP_ADRESS=192.168.2.220/24      # you can also use an official 44er ip-address

case "$1" in
    start)
       # loading kernel drivers
       modprobe ax25
       modprobe bpqether

       # create bpq-pipe and axudp-device
       /usr/sbin/ax25ipd -c /etc/ax25/ax25ipd.conf
       sleep 3
       if [ -f /proc/net/bpqether ]
       then
           PORT=$(cat /proc/net/bpqether | grep $BPQPIPE | head -c4)
       else
           echo "Cannot create BPQ-Pipe, Abort!"
           exit 1
       fi

       #configure BPQ-kernel-device

       /sbin/ifconfig $PORT hw ax25 $ARP_CALL $IP_ADRESS mtu 1296 up

       ;;
    stop)

        killall ax25ipd
        sleep 5
        rmmod bpqether

        ;;
esac
exit 0

The kernel-device "axudp" was created. You can test the device by "call"-
program: call -s ad7uf axudp ke7awr

73 de Chris, dk2crn


Am Donnerstag, 24. Mai 2012, 15:45:01 schrieb Charles Boling:
> I've done the soundcard driver.  I've done the BPQ driver.  I've done
> NET/ROM.  I've done a basic node.  And now I've done gotten myself
> stuck! :-)
> 
> I want to use ax25ipd to establish an AXUDP tunnel over the Internet.
> 
> Unfortunately, all of the documentation I've been able to find so far is
> either obviously outdated (e.g. from 2000, uses old-style BSD
> pseudo-TTYs), or otherwise doesn't work (e.g. expects ax25ipd to
> immediately write data to stdout after launch, as in
>   http://mailman.f6fbb.org/pipermail/xfbb/2012-March/004316.html)
> 
> Add to that the fact that I'm really green on pseudo-TTYs, kissattach, etc.
> 
> Here's what I have in axports:
>  sm0	AD7UF	1200	255	2	SignaLink USB
>  bpq0	AD7UF-9	1000000000	255	5	BPQ node for eth1
>  axudp	AD7UF-12	115200	255	5	AX25 over UDP 
(ax25ipd)
> 
> and here's what's in ax25ipd.conf:
>  socket udp 10093
>  mode tnc
>  mycall ad7uf-12
>  device /dev/ptmx
>  speed 115200
>  loglevel 4
>  broadcast QST-0 NODES-0 ANYONE-0
>  route ke7awr ke7awr.no-ip.org udp 10093
> 
> After launching ax25ipd, I see this logged:
>  14:47:48  ax25ipd: #012Current configuration:
>  14:47:48  ax25ipd:   socket     udp on port 10093
>  14:47:48  ax25ipd:   mode       tnc
>  14:47:48  ax25ipd:   device     /dev/ptmx
>  14:47:48  ax25ipd:   speed      115200
>  14:47:48  ax25ipd:   loglevel   1
>  14:47:48  ax25ipd: #0121 active routes.
>  14:47:48  ax25ipd:   KE7AWR#01124.21.99.210#011udp#01110093#0110
>  14:47:48  ax25ipd: #0120 parameters
> 
> What now?  Do I need to use kissattach to attach to the other end of the
> pseudo-TTY?  Which one?
> 
> Of course, without the missing piece, I get this:
>  axcall axudp ke7awr
>  axconfig: port axudp not active
>  axcall: invalid port setting
> 
> Any help would be greatly appreciated!
> 
> PS: I'm running Ubuntu 11.04.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
