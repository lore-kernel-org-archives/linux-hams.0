From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH] yam: fix a memory leak in yam_siocdevprivate()
Date: Thu, 27 Jan 2022 04:59:56 +0100
Message-ID: <20220127035956.GE18529@x-berg.in-berlin.de>
References: <20220124032954.18283-1-hbh25y@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220124032954.18283-1-hbh25y@gmail.com>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hangyu Hua <hbh25y@gmail.com>
Cc: jpr@f6fbb.org, davem@davemloft.net, kuba@kernel.org, wang6495@umn.edu, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


Just a comment: Looks ok for me.

On Mon, Jan 24, 2022 at 11:29:54AM +0800, Hangyu Hua wrote:
> ym needs to be free when ym->cmd != SIOCYAMSMCS.
> 
> Fixes: 0781168e23a2 ("yam: fix a missing-check bug")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/net/hamradio/yam.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
> index 6376b8485976..980f2be32f05 100644
> --- a/drivers/net/hamradio/yam.c
> +++ b/drivers/net/hamradio/yam.c
> @@ -950,9 +950,7 @@ static int yam_siocdevprivate(struct net_device *dev, struct ifreq *ifr, void __
>  		ym = memdup_user(data, sizeof(struct yamdrv_ioctl_mcs));
>  		if (IS_ERR(ym))
>  			return PTR_ERR(ym);
> -		if (ym->cmd != SIOCYAMSMCS)
> -			return -EINVAL;
> -		if (ym->bitrate > YAM_MAXBITRATE) {
> +		if (ym->cmd != SIOCYAMSMCS || ym->bitrate > YAM_MAXBITRATE) {
>  			kfree(ym);
>  			return -EINVAL;
>  		}
> -- 
> 2.25.1
> 
