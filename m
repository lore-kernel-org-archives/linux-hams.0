From: folkert <folkert@vanheusden.com>
Subject: Fw: problem with baycom driver
Date: Sat, 28 Jul 2012 23:55:11 +0200
Message-ID: <20120728215510.GR7638@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

----- Forwarded message -----
Date: Sat, 28 Jul 2012 23:38:33 +0200
To: linux-kernel@vger.kernel.org

Hi,

It seems the baycom driver (for ham radio) needs some attention.
The problems:
- the baycom_ser_hdx driver does not work at all: very occasionally it
  switches the radio to send and transmit the data, but that's only one
  in thousand
- the baycom_ser_fdx does seem to send, but only 1 or 2 packets, then
  something odd happens: the radio does transmit something but it is not
  recognizable as data. it sounds like a couple of ticks, not the
  recognizable modem sound. Important: if I do a sethdlc command, it
  again does send 1 or 2 valid packets!

The system on which I try it, is a 3.2GHz p4 (with HT) so I don't think
it is a problem with the system not keeping up.
The pc is a:
        Manufacturer: IBM
        Product Name: 8215F7G
        Version: ThinkCentre M52

Things are setup like this:
/bin/setserial /dev/ttyS0 uart none
/sbin/modprobe baycom_ser_fdx 'mode=ser12*' iobase=0x3f8 irq=4
/usr/bin/sethdlc -i bcsf0 -a txd 200 slot 100 ppersist 40 half
/sbin/ifconfig bcsf0 hw ax25 FH1GOU-1 up

I played a little with the txd and does not help. Using full or half
does not make a difference so far that it looks as if the first part of
the packet is missing if I full duplex mode but I'm not entirely sure of
that (no second modem setup).
I verified the problem by listening with a second radio.


Folkert van Heusden
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

----- End forwarded message -----
