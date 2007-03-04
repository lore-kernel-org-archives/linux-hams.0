From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and enhanced failure logging
Date: Mon, 5 Mar 2007 10:30:52 +1100
Message-ID: <20070304233052.GA27505@cloud.net.au>
References: <20070304213034.GU10782@vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070304213034.GU10782@vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Mar 04, 2007 at 10:30:35PM +0100, Folkert van Heusden wrote:
> The baycom_ser_fdx driver did not allow i/o ports >= 0x1000. Now that
> there are pci cards (with rs232 ports) which use for example 0xb800 this
> limit should not exists.
> Also, for non kernel coders find the cause of problems was challenging
> so I added extra logging.

Ideally it wouldn't have its own 16550 driver.. I have a non-16550 card
here (using the parport_serial driver) which then couldn't be used with
the baycom.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
