From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Date: Wed, 12 Oct 2022 12:16:53 -0700
Message-ID: <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel__21203.3817240567$1665602803$gmane$org@perches.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
         <20221005214844.2699-4-Jason@zx2c4.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20221005214844.2699-4-Jason@zx2c4.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com, cake@lists.bufferbloat.net, ceph-devel@vger.kernel.org, coreteam@netfilter.org, dccp@vger.kernel.org, dev@openvswitch.org, dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com, linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-hams@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org

On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> The prandom_u32() function has been a deprecated inline wrapper around
> get_random_u32() for several releases now, and compiles down to the
> exact same code. Replace the deprecated wrapper with a direct call to
> the real function.
[]
> diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
[]
> @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
>  				   &ep->com.remote_addr;
>  	int ret;
>  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> -	u32 isn = (prandom_u32() & ~7UL) - 1;
> +	u32 isn = (get_random_u32() & ~7UL) - 1;

trivia:

There are somewhat odd size mismatches here.

I had to think a tiny bit if random() returned a value from 0 to 7
and was promoted to a 64 bit value then truncated to 32 bit.

Perhaps these would be clearer as ~7U and not ~7UL

>  	struct net_device *netdev;
>  	u64 params;
>  
> @@ -2469,7 +2469,7 @@ static int accept_cr(struct c4iw_ep *ep, struct sk_buff *skb,
>  	}
>  
>  	if (!is_t4(adapter_type)) {
> -		u32 isn = (prandom_u32() & ~7UL) - 1;
> +		u32 isn = (get_random_u32() & ~7UL) - 1;

etc...

drivers/infiniband/hw/cxgb4/cm.c:	u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/infiniband/hw/cxgb4/cm.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:	rpl5->iss = cpu_to_be32((prandom_u32() & ~7UL) - 1);
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/target/iscsi/cxgbit/cxgbit_cm.c:	rpl5->iss = cpu_to_be32((prandom_u32() & ~7UL) - 1);

