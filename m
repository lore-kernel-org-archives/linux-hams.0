From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: bpqether.h: remove if_ether.h guard
Date: Sun, 13 Nov 2016 00:58:13 -0500 (EST)
Message-ID: <20161113.005813.483694959887178515.davem@davemloft.net>
References: <da8a959ec7a821eb179e5e5b40eff669daf9a338.1478776902.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <da8a959ec7a821eb179e5e5b40eff669daf9a338.1478776902.git.baruch@tkos.co.il>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: baruch@tkos.co.il
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Nov 2016 13:21:42 +0200

> __LINUX_IF_ETHER_H is not defined anywhere, and if_ether.h can keep itself from
> double inclusion, though it uses a single underscore prefix.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied.
