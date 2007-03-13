From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX25 in libpcap & wireshark (was ethereal)
Date: Tue, 13 Mar 2007 19:40:19 +0000
Message-ID: <45F6FE23.8040306@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

It's hands up time!

I have ported my AX.25 dissection patch to wireshark 0.99.5 and added some
more protocols.

The patch now contains:

     AX.25
     Netrom
     Flexnet (well, it recognises Flexnet packets)
     APRS (according to V1.01 + 1.1 & 1.2 errata)
     AXIP (untested)
     BPQ
     AX.25_ARP

The AX.25 dissector hands off IP to the existing dissectors so IP over AX.25
is covered.

This patch is getting larger and I am hesitant about posting it to the the list.

So those who wish to play please put your hands up.  I can then distribute the
patch off list.

Packet captures for Flexnet & AXIP welcome.

-- 
Regards
     Richard
