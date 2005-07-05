From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 16:53:01 +0100
Message-ID: <20050705155301.GM5171@linux-mips.org>
References: <20050704173042.GA3090@linux-mips.org> <620c905705070503452dce267a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c905705070503452dce267a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

On Tue, Jul 05, 2005 at 04:45:56AM -0600, Chuck Hast wrote:

> Does 6pack still only handle 1 tnc under Linux or have you got it to do
> a ring of TNC's like the DOS one does? Sure would like to see that on
> Linux, would cut cost for us where we have multiple TNC's and want to
> use a simple machine.

Such a limitation has never existed as far as I can tell; the sole
limitation is to a single TNC per RS-232 interface.  Daisy chaining
multiple TNCs per interface is still not supported.  If you run out
of serial interfaces using for example USB serial interfaces should
work just fine.

(For dare devils, attaching a remote 6pack TNC via for example ssh sort
of works also ;-)

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
