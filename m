From: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH net-next] net: rename reference+tracking
	helpers
Date: Wed, 8 Jun 2022 07:58:27 -0700
Message-ID: <20220608075827.2af7a35f@kernel.org>
References: <20220608043955.919359-1-kuba@kernel.org>
 <YqBdY0NzK9XJG7HC@nanopsycho>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ovs-dev-bounces-yBygre7rU0TnMu66kgdUjQ@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654700309;
 bh=/L6Z0/s3Qk30K+HFd4XuKvY7Ku6Ad/XQ0r4A3ePbSwE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R24PkBKLGmeLQF3YM2t6LP6LgKCzFTf30qZTsbef97EW2IaN6fUIXn3aaWjXlW8PD
 JEBs5XlkemP80qwBoVx/bQ4CHugVs+gA1+nKPYSdNnYqkp+mQY4RxAUg3acGKu6pYg
 Xbfh5dKIEvfo4Jn2yi0rUA+N/QgloWZdll6IxFq6GyxAy+AH9AYqjSTFpq3nK9ggGh
 qYLUI+UxElpb0LKNyRwxKIaQtpcw7OqqqpqgJRsOQ8+4SlJCG+MUa0is+9rdnkLavU
 jFpCDBhynxgcooRtT7wuSb+9tc0eP9fqvZC2bfD44QU1aKDRz4eLqGea919fdxRMt6
 FX9UnRTJP4ApQ==
In-Reply-To: <YqBdY0NzK9XJG7HC@nanopsycho>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://mail.openvswitch.org/mailman/options/ovs-dev>,
 <mailto:ovs-dev-request-yBygre7rU0TnMu66kgdUjQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://mail.openvswitch.org/pipermail/ovs-dev/>
List-Post: <mailto:ovs-dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org>
List-Help: <mailto:ovs-dev-request-yBygre7rU0TnMu66kgdUjQ@public.gmane.org?subject=help>
List-Subscribe: <https://mail.openvswitch.org/mailman/listinfo/ovs-dev>,
 <mailto:ovs-dev-request-yBygre7rU0TnMu66kgdUjQ@public.gmane.org?subject=subscribe>
Errors-To: ovs-dev-bounces-yBygre7rU0TnMu66kgdUjQ@public.gmane.org
Sender: "dev" <ovs-dev-bounces-yBygre7rU0TnMu66kgdUjQ@public.gmane.org>
To: Jiri Pirko <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>
Cc: razor-duuXeNIU69eXDw4h08c5KA@public.gmane.org, edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, richardsonnick-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, steffen.klassert-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lucien.xin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yajun.deng-fxUVXftIFDnyG1zEObXtfA@public.gmane.org, pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jreuter-K7Hl1MveuGQ@public.gmane.org, ivecera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dsahern-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, jmaloy-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tipc-discussion-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ying.xue-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, atenart-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, kgraul-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

On Wed, 8 Jun 2022 10:27:15 +0200 Jiri Pirko wrote:
> Wed, Jun 08, 2022 at 06:39:55AM CEST, kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> >Netdev reference helpers have a dev_ prefix for historic
> >reasons. Renaming the old helpers would be too much churn  
> 
> Hmm, I think it would be great to eventually rename the rest too in
> order to maintain unique prefix for netdev things. Why do you think the
> "churn" would be an issue?

Felt like we're better of moving everyone to the new tracking helpers
than doing just a pure rename. But I'm not opposed to a pure rename.

> >diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
> >index 817577e713d7..815738c0e067 100644
> >--- a/drivers/net/macsec.c
> >+++ b/drivers/net/macsec.c
> >@@ -3462,7 +3462,7 @@ static int macsec_dev_init(struct net_device *dev)
> > 		memcpy(dev->broadcast, real_dev->broadcast, dev->addr_len);
> > 
> > 	/* Get macsec's reference to real_dev */
> >-	dev_hold_track(real_dev, &macsec->dev_tracker, GFP_KERNEL);
> >+	netdev_hold(real_dev, &macsec->dev_tracker, GFP_KERNEL);  
> 
> So we later decide to rename dev_hold() to obey the netdev_*() naming
> scheme, we would have collision.

dev_hold() should not be used in new code, we should use tracking
everywhere. Given that we can name the old helpers __netdev_hold().

> Also, seems to me odd to have:
> OLDPREFIX_x()
> and
> NEWPREFIX_x()
> to be different functions.
> 
> For the sake of not making naming mess, could we rather have:
> netdev_hold_track()
> or
> netdev_hold_tr() if the prior is too long
> ?

See above, one day non-track version should be removed.
IMO to encourage use of the track-capable API we could keep their names
short and call the legacy functions __netdev_hold() as I mentioned or
maybe netdev_hold_notrack().
