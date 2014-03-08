From: Stuart Longland <stuartl@longlandclan.yi.org>
Subject: Multicast AX.25?
Date: Sat, 8 Mar 2014 14:34:03 +1000
Message-ID: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi all,

Does anyone know if there's a way to a Linux host relay AX.25 packet data 
between a local multicast group on Ethernet to a TNC?

I'm thinking something along the lines of ax25ipd, using AX/UDP, but with 
a IPv4 (or v6) multicast address as the destination.  So basically all 
traffic I see on the multicast group, is sent via AX.25 packet, and 
anything heard on AX.25 packet, is sent back to the multicast group as if 
each member of that multicast group had its own TNC/radio/antenna.

Use case: a small home LAN, where you might have one or two computers 
that you may wish to do packet radio on, and not have to statically 
configure the routes of each one in ax25ipd.

Regards,
Stuart Longland

