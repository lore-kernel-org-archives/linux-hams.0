From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: netrom
Date: Fri, 20 Feb 2004 21:12:40 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1077304360.1271.70.camel@oh2bns.ampr.org>
References: <000501c3f7df$ff0fd060$794689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000501c3f7df$ff0fd060$794689d8@oem7paq6co5hph>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vavra <wb8zrl@avalon.net>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Fri, 2004-02-20 at 20:32, Tom Vavra wrote:

> [root@localhost root]# /usr/sbin/nrattach thenet
> NET/ROM port thenet bound to device nr0
> [root@localhost root]# /usr/sbin/netromd -i
> nrconfig: port thenet not active
> netromd: no NET/ROM ports defined

You need to give the netrom port an IP address with -i option.
The address doesn't need to be valid (unless you plan on running
IP-over-NETROM) so something from the 10.x.x.x or 192.168.x.x
blocks should be ok.

-- 
Tomi Manninen / OH2BNS / KP20ME04

