From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and
	enhanced failure logging
Date: Mon, 05 Mar 2007 14:45:09 +0100
Message-ID: <1173102309.20023.25.camel@xbox360>
References: <20070304213034.GU10782@vanheusden.com>
	 <20070304233052.GA27505@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070304233052.GA27505@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

On Mon, 2007-03-05 at 10:30 +1100, Hamish Moffatt wrote:

> Ideally it wouldn't have its own 16550 driver.. I have a non-16550 card
> here (using the parport_serial driver) which then couldn't be used with
> the baycom.

The baycom modem really doesn't have anything to do with RS232, it just
uses the RS232 port as a PIO port + timer. That's why it needs its own
16550 driver.

Tom

