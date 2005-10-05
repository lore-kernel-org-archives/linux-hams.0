From: "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] AX.25: Fix packet socket crash
Date: Wed, 05 Oct 2005 12:16:15 -0700 (PDT)
Message-ID: <20051005.121615.117690960.davem@davemloft.net>
References: <20051004194803.GA2724@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051004194803.GA2724@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Date: Tue, 4 Oct 2005 20:48:03 +0100

> Since changeset 98a82febb6340466824c3a453738d4fbd05db81a AX.25 is passing
> received IP and ARP packets to the stack through netif_rx() but we don't
> set the skb->mac.raw to right value which may result in a crash with
> applications that use a packet socket.
> 
> Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

Applied, thanks a lot Ralf.
