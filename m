From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] fix potential NULL pointer dereference in yam
Date: Sun, 14 May 2006 18:09:47 +0400
Message-ID: <20060514140946.GA23387@mipter.zuzino.mipt.ru>
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

> Found by coverity checker as #787

> --- linux-2.6.17-rc4-git2-orig/drivers/net/hamradio/yam.c
> +++ linux-2.6.17-rc4-git2/drivers/net/hamradio/yam.c
> @@ -845,15 +845,25 @@ static struct net_device_stats *yam_get_
>  
>  static int yam_open(struct net_device *dev)
>  {
> -	struct yam_port *yp = netdev_priv(dev);
> +	struct yam_port *yp;
>  	enum uart u;
>  	int i;
> -	int ret=0;
> +	int ret = 0;

Please, don't make unrelated changes.

> -	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
> +	if (!dev) {
> +		printk(KERN_ERR "yam_open() called without device\n");
> +		return -ENXIO;
> +	}

How can it be NULL here? The whole array of valid net_devices was
allocated at module init time.

> -	if (!dev || !yp->bitrate)
> +	yp = netdev_priv(dev);
> +	if (!yp->bitrate) {
> +		printk(KERN_ERR "%s: no bitrate\n", dev->name);
>  		return -ENXIO;
> +	}
> +
> +	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n",
> +		dev->name, dev->base_addr, dev->irq);
> +
>  	if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
>  		dev->irq < 2 || dev->irq > 15) {
>  		return -ENXIO;

