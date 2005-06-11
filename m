From: "Stewart Wilkinson" <g0lgs@gb7lgs.co.uk>
Subject: RE: Problems in my ax25 interface.
Date: Sat, 11 Jun 2005 22:16:18 +0100
Message-ID: <OMEGIMHHANGHDCMEGEJCEEBDCCAA.g0lgs@gb7lgs.co.uk>
References: <200506112158.32378.ct1drb@iol.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506112158.32378.ct1drb@iol.pt>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>


To stop Samba sending things on the AX25 interfaces make sure 
your smb.conf has a line like:

	interfaces = 192.168.21.1/24

To restrict it to using only the interfaces you need SMB to work over.

--
Stewart G0LGS

