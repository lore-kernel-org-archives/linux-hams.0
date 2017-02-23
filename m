From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [BUG] AX.25 sockets not destroyed
Date: Fri, 24 Feb 2017 00:26:25 +0630
Message-ID: <20170223175625.GB1904@linux-mips.org>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net>
 <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net>
 <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr>
 <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net>
 <598de982-d655-22bd-c5ba-2d9114f9fb7c@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <598de982-d655-22bd-c5ba-2d9114f9fb7c@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f6bvp <f6bvp@free.fr>
Cc: David Ranch <dranch@trinnet.net>, Basil Gunn <basil@pacabunga.com>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

On Thu, Feb 23, 2017 at 02:53:36PM +0100, f6bvp wrote:

> ffff8c80b5ed5800 ax0 F6BVP-7 F4BWT-9 1 0 0 0 18446744073709549 100 0 3 0 300 0 0 9 10 5 2 256 * * *
> ffff8c80b5ed5400 ax0 F6BVP-7 WA3MEZ-9 1 0 0 0 18446744073709549 100 0 3 0 300 0 0 9 10 5 2 256 * * *

> then it displays a very large number for a while,

The large number is an already expired t1 timer.  That means the time
to expiry is relativly small negative number like -1616 or as a hex
number 0xfffffffffffff9b0 which will be divied by HZ (probably 1000)
and displayed as a something like 18446744073709550.

Looking further into it.

  Ralf
