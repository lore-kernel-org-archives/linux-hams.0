From: David Miller <davem@davemloft.net>
Subject: Re: [AX.25] Fix locking of ax25 protocol function list.
Date: Mon, 10 Jul 2006 16:21:54 -0700 (PDT)
Message-ID: <20060710.162154.10943961.davem@davemloft.net>
References: <20060710230943.GA8350@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20060710230943.GA8350@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 11 Jul 2006 00:09:43 +0100

> Delivery of AX.25 frame to the layer 3 protocols happens in softirq context
> so locking needs to be bh-proof.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Applied, thanks Ralf.
