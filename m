From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v3 20/38] net: handle HAS_IOPORT dependencies
Date: Tue, 14 Mar 2023 22:41:04 -0700
Message-ID: <20230314224104.71db5ab4@kernel.org>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
        <20230314121216.413434-21-schnelle@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-can-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678858866;
        bh=FXai2qLa/oxwiLINWHjW+akZur4pSld/3ZcuGMVc30Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SQuoLTKrYJs2COu6Qkxi1TsG3DVOypXfLjk4NYc9xP5LQTgot2jL8VGx0RsYCzHRQ
         ebQeuI5EgWlygrnWeOQB8I+P2YHGOQPFObBwd3FgMEgZlDmRzde7PThKvm8bgpbTo/
         GOFLLGd1Y+Iknth/r6bhfJbsiA97l9Y4xnTkUHZaaUmPeHQK6wzcg09dmFMDDUtwqj
         ouUhe9wMN8pgYJ3pWB3AxSqMZ/42vYJ3V9FfTxJVWl1E40Q9N/NG17vohokSOftUzv
         D6S+aNeaDZk1Nz2T+tRVQaZSm8Ngl3TDZhlMADtHe+XUxQH1SAkAMj9CpqH3svmnNy
         wL4hubqX9Jf7g==
In-Reply-To: <20230314121216.413434-21-schnelle@linux.ibm.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Geert Uytterhoeven <geert@linux-m>

On Tue, 14 Mar 2023 13:11:58 +0100 Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers requiring them. For the DEFXX driver there use of I/O
> ports is optional and we only need to fence those paths.can It also
> turns out that with HAS_IOPORT handled explicitly HAMRADIO does not need
> the !S390 dependency and successfully builds the bpqether driver.

Acked-by: Jakub Kicinski <kuba@kernel.org>
