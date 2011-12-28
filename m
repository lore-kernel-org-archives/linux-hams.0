From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] netrom: avoid overflows in nr_setsockopt()
Date: Wed, 28 Dec 2011 14:08:24 -0500 (EST)
Message-ID: <20111228.140824.803334102480724987.davem@davemloft.net>
References: <1325015093-28968-1-git-send-email-xi.wang@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1325015093-28968-1-git-send-email-xi.wang@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: xi.wang@gmail.com
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org

From: Xi Wang <xi.wang@gmail.com>
Date: Tue, 27 Dec 2011 14:44:53 -0500

> Check setsockopt arguments to avoid overflows and return -EINVAL for
> too large arguments.
> 
> Signed-off-by: Xi Wang <xi.wang@gmail.com>

Applied.
