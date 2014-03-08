From: Stuart Longland <stuartl@longlandclan.yi.org>
Subject: Re: Multicast AX.25?
Date: Sat, 8 Mar 2014 19:21:36 +1000
Message-ID: <024rua-e6d.ln1@atomos.longlandclan.yi.org>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sat, 08 Mar 2014 14:34:03 +1000, Stuart Longland wrote:

> Hi all,
> 
> Does anyone know if there's a way to a Linux host relay AX.25 packet
> data between a local multicast group on Ethernet to a TNC?
> 
> I'm thinking something along the lines of ax25ipd, using AX/UDP, but
> with a IPv4 (or v6) multicast address as the destination.

Managed to hack up ax25ipd to do just this, with IPv4 multicast for now.  
Patch coming right up.

