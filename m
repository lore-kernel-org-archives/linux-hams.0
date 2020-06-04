From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] yam: fix possible memory leak in yam_init_driver
Date: Thu, 04 Jun 2020 15:58:59 -0700 (PDT)
Message-ID: <20200604.155859.185403656964744319.davem@davemloft.net>
References: <20200604121851.63880-1-wanghai38@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20200604121851.63880-1-wanghai38@huawei.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: wanghai38@huawei.com
Cc: jpr@f6fbb.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wang Hai <wanghai38@huawei.com>
Date: Thu, 4 Jun 2020 20:18:51 +0800

> If register_netdev(dev) fails, free_netdev(dev) needs
> to be called, otherwise a memory leak will occur.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Applied, thanks.
