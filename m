From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: [PATCH] scc fix for 2.6.0
Date: Sat, 27 Dec 2003 05:05:23 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031227040522.GA7123@linux-mips.org>
References: <20031225195233.C3614@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20031225195233.C3614@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, jgarzik@pobox.com

On Thu, Dec 25, 2003 at 07:52:33PM +0100, Jeroen Vreeken wrote:

> This is a fix for the scc driver in 2.6.0
> It was calling register_netdev from within a ioctl and thus holding
> rtnl_lock()
> It now uses register_netdevice and calls rtnl_lock() itself if outside the
> ioctl.

Somehow the whole device registration in that driver looks suspect.
Registering from the driver's module_init() method is fine - but doing so
from ioctl looks more it's some kind of ancient workaround or so?

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
