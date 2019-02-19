From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] net: rose: add missing dev_put() on error in
 rose_bind
Date: Tue, 19 Feb 2019 13:23:48 -0800 (PST)
Message-ID: <20190219.132348.333357401086026145.davem@davemloft.net>
References: <20190219080622.17312-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219080622.17312-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: yuehaibing@huawei.com
Cc: ralf@linux-mips.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 19 Feb 2019 16:06:22 +0800

> when capable check failed, dev_put should
> be call before return -EACCES.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
