From: Roger Harris <roger@g3zfr.freeserve.co.uk>
Subject: AX25 decoding in tcpdump and ethereal?
Date: Sun, 18 May 2003 12:08:09 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20030518115844.00a2a5f0@pop.freeserve.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi

My version of tcpdump (3.4-39) recognises protocol 93 (AXIP) and UDP port 93 (AXUDP) and decodes the AX25 headers for these packets.

My system also carries AXUDP packets on other ports, such as 9393, but tcpdump does not recognise these as AX25 and therefore does not decode the AX25 headers.

Is there any way of telling tcpdump to treat a number of different UDP ports as AX25 and decode them accordingly?

Also, is there a version of ethereal available, or an add-on, which decodes AX25 packets?

Thanks

Roger

