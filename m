From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: paket station setup
Date: Mon, 27 Dec 2004 21:45:37 +0200
Message-ID: <1104176737.1218.2.camel@oh2bns.ampr.org>
References: <LFENLEGCDLCOKEJAECGNEENJCDAA.rkrasko1@nycap.rr.com>
	 <20041227194045.GA5032@office.n7xy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041227194045.GA5032@office.n7xy.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-12-27 at 21:40, Bob Nielsen wrote:

> There is no /dev/ax0 created.  As a minimum, you need to load the ax25
> and mkiss modules, edit /etc/ax25/axports and /etc/ax25/ax25d.conf and
> run the following (as root):
> 
> kissattach /dev/ttyS0 <portname> <ipaddress>
> 
> ax25d

No need to configure ax25d unless you want to set up a service that
accepts _incoming_ connections, like node.

-- 
Tomi Manninen / OH2BNS / KP20ME04

