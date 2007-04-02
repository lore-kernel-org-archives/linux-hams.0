From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX25 in libpcap & wireshark
Date: Mon, 02 Apr 2007 20:30:18 +0100
Message-ID: <461159CA.5080301@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Another set of patches for the foolhardy, desperate or those who just
like to live dangerously.

At:
     http://www.rns-stearn.demon.co.uk/

	Changelog_2007-03-25
	README_2007-03-25
	libpcap-0.9.5_ax25_patch_2007-03-28.gz
	wireshark-0.99.5_ax25_patch_2007-03-25.gz

 From the Changelog
         APRS    - now a plugin.
         APRS    - MIC-E pass through of AX.25 dest header added.
                         Dissection of MIC-E extended.
         APRS    - general tidy up of indicated protocol & information.
         NetROM  - IP frames passed to existing IP dissector.
         AXIP    - now handled withing packet-ax25.c
         BPQ     - now handled withing packet-ax25.c

My thanks to those who have tested and commented, they have got much of
what they wanted, them as didn't, haven't.

-- 
Regards
	Richard
