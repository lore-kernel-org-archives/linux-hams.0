From: Dennis Boone <drb@msu.edu>
Subject: Re: AX25 to Telnet to CONV
Date: Wed, 14 Dec 2005 11:44:05 -0500
Message-ID: <200512141644.jBEGi5Fo000342@yagi.h-net.msu.edu>
References: <Pine.LNX.4.44.0512141015390.17763-100000@srv01.compumont.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Wed, 14 Dec 2005 10:17:16 CST.)
             <Pine.LNX.4.44.0512141015390.17763-100000@srv01.compumont.com> 
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 >  > Right.  That launches the dxcluster locally.  I'm looking for the
 >  > magic incantation to connect from packet on the local machine to a
 >  > remote dxcluser by telnet.  It'll be something like:
 >  > 
 >  > [NWPDX at *]
 >  > default         * *  * *  *   * - root telnet w7xy:7373 %u
 > 
 > Is "axwrapper" the magic ingredient I'm missing?   The examples
 > show it being used with a "finger" implementation.

Skip telnet, use axconv:

	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz

I'd think long and hard about running such things as root.  Telnet,
in particular, might be used to get a local shell.

De
