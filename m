From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: nrattach ports
Date: Mon, 26 Jan 2004 02:00:11 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1075075211.1298.41.camel@oh2bns.ampr.org>
References: <1074877572.1299.114.camel@oh2bns.ampr.org>
	 <40145D92.4020408@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40145D92.4020408@ccr.jussieu.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-01-26 at 02:21, Bernard Pidoux wrote:

> # /usr/sbin/nrattach -i 44.30.2.5 netrom
> # /usr/sbin/nrattach -i 44.30.2.5 netmod
> 
> However nrattach creates two ports on my system that are identified as 
> nr0 and nr1
> not netrom and netmod as I can see with 'ip address' command.
> Is there a problem with nrattach ? It does'nt seem to use the 
> netrom/netmod argument ?
> However I know that it works for I can use the netrom ports defined in 
> /etc/nrports alias.
> So maybe its only a display problem ?

Port names and interface names are two different things. 
Nrattach (like most of the ax25-tools/apps) takes a port name
from /etc/ax25/nrports as the last argument. When the kernel
interface is created, it's name is whatever the kernel decides.
Nrattach does not try to rename it. (Maybe it should now that
it's possible..?)

-- 
Tomi Manninen / OH2BNS / KP20ME04

