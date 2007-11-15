From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: dmascc ?
Date: Thu, 15 Nov 2007 15:22:01 +0000
Message-ID: <20071115152201.GC4973@linux-mips.org>
References: <47380198.7020906@ve7hex.ampr.org> <20071115000703.GA30665@linux-mips.org> <473C4328.9020709@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <473C4328.9020709@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Niall Parker <niall@ve7hex.ampr.org>, linux-hams <linux-hams@vger.kernel.org>

On Thu, Nov 15, 2007 at 02:01:28PM +0100, Bernard Pidoux wrote:

> Is an SMP kernel mandatory for running a multithreaded P4 CPU or 
> would'not a single CPU kernel make it  (with a 50% performance reduction) ?

The performance benefit or even if there's one at all depends very much
on what generation of P4 you're using and many more factors, but yes, if
you want to realize that gain you will need to enable CONFIG_SMP or
hyperthreading is just going to be a few square milimeters of wasted
silicon.

  Ralf
