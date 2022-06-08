From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Wed, 8 Jun 2022 10:27:15 +0200
Message-ID: <YqBdY0NzK9XJG7HC@nanopsycho>
References: <20220608043955.919359-1-kuba@kernel.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RO+2GICEalTGWxqDS+LJ84EPVrBk/pFANY3/dBpnczA=;
        b=iu/4+hXctfQAi/PtOuus7Ng+2TGisjH8LOIQ9UWUu2nOercAT2Cd30VUAnyTfknNLH
         WdK6uKicZdZC0TbPF5J7HIFl4TsLBF4H31zMAbmY0aCKC3xZ3e/ztKH5NIEPBPP6p5vb
         4E0qwO85pXzuGOofQC0LImH2xumsNiLSqpRYJAazUnZPeRKALEdhxmhv2HNaAAd67MB1
         xq8XigI4Rn4w7GBhBzsoZaK0ul6XLDXJTr0X/XG0srSvzlvnBiswdMZex1xSxz6yDNVL
         8SCfZe/q1NzKDkfDZHtQUZPwF1CzgjpFRnTfTTb2OeBSNcMUk7nUBDaqyDoOooU3ARJx
         s4sQ==
Content-Disposition: inline
In-Reply-To: <20220608043955.919359-1-kuba@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, dsahern@kernel.org, steffen.klassert@secunet.com, jreuter@yaina.de, razor@blackwall.org, kgraul@linux.ibm.com, ivecera@redhat.com, jmaloy@redhat.com, ying.xue@windriver.com, lucien.xin@gmail.com, arnd@arndb.de, yajun.deng@linux.dev, atenart@kernel.org, richardsonnick@google.com, hkallweit1@gmail.com, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

Wed, Jun 08, 2022 at 06:39:55AM CEST, kuba@kernel.org wrote:
>Netdev reference helpers have a dev_ prefix for historic
>reasons. Renaming the old helpers would be too much churn

Hmm, I think it would be great to eventually rename the rest too in
order to maintain unique prefix for netdev things. Why do you think the
"churn" would be an issue?


>but we can rename the tracking ones which are relatively
>recent and should be the default for new code.
>
>Rename:
> dev_hold_track()    -> netdev_hold()
> dev_put_track()     -> netdev_put()
> dev_replace_track() -> netdev_ref_replace()

[...]


>diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
>index 817577e713d7..815738c0e067 100644
>--- a/drivers/net/macsec.c
>+++ b/drivers/net/macsec.c
>@@ -3462,7 +3462,7 @@ static int macsec_dev_init(struct net_device *dev)
> 		memcpy(dev->broadcast, real_dev->broadcast, dev->addr_len);
> 
> 	/* Get macsec's reference to real_dev */
>-	dev_hold_track(real_dev, &macsec->dev_tracker, GFP_KERNEL);
>+	netdev_hold(real_dev, &macsec->dev_tracker, GFP_KERNEL);

So we later decide to rename dev_hold() to obey the netdev_*() naming
scheme, we would have collision. Also, seems to me odd to have:
OLDPREFIX_x()
and
NEWPREFIX_x()
to be different functions.

For the sake of not making naming mess, could we rather have:
netdev_hold_track()
or
netdev_hold_tr() if the prior is too long
?
