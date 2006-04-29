From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [patch 1/1] request_region() return value missing check
Date: Sat, 29 Apr 2006 12:58:05 +0100
Message-ID: <20060429115805.GA26183@linux-mips.org>
References: <200603171330.40614.l.wandrebeck@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200603171330.40614.l.wandrebeck@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Wandrebeck <l.wandrebeck@free.fr>
Cc: linux-hams@vger.kernel.org

On Fri, Mar 17, 2006 at 01:30:40PM +0100, Laurent Wandrebeck wrote:

> Here is a simple patch against 2.6.16-rc6-git8.
> Is adds checks about return value for two request_region() in drivers/net/hamradio/scc.c.

Several things:

 o Your mailer garbles patches, so I couldn't apply it anymore.
 o If the second request_region your patches will abort initialization
   leaving the first one region allocated.
 o The potencial abort happens in a loop so if we abort anytime other than
   during the first iteration the resources will stay allocated and the
   driver won't drive instances found earlier.

Thanks,

  Ralf
