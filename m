From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] fix potential NULL pointer dereference in yam
Date: Sun, 14 May 2006 18:08:27 +0100
Message-ID: <20060514170827.GA24169@linux-mips.org>
References: <200605141512.50923.jesper.juhl@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200605141512.50923.jesper.juhl@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: linux-kernel@vger.kernel.org, Frederic Rible <frible@teaser.fr>, Jean-Paul Roubelat <jpr@f6fbb.org>, linux-hams@vger.kernel.org

On Sun, May 14, 2006 at 03:12:50PM +0200, Jesper Juhl wrote:

> Testing a pointer for NULL after it has already been dereferenced is not
> very safe.
> Patch below to rework yam_open() so that `dev' is not dereferenced until
> after it has been tested for NULL.

It may not obvious and that itself is some sort of bug bug netdev_priv()
assumes that the private part of struct netdev has been allocated
immediately following struct netdev, so the macro will compile into just
pointer arithmetic.  So no possible NULL pointer dereference here.

  Ralf
