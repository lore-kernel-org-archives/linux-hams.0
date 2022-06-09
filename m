From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Thu, 9 Jun 2022 06:40:15 +0200
Message-ID: <YqF5rzIiLCJgW5Gd@nanopsycho>
References: <20220608043955.919359-1-kuba@kernel.org>
 <YqBdY0NzK9XJG7HC@nanopsycho>
 <20220608075827.2af7a35f@kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FGwLN6puZ2hD8UNyN4LTRFh855zcMnLstF1aT3B7ECg=;
        b=vckwlfQRJJgVJD2IArXfO8ivPnho4P23qQegmr2OKAnSRJamakuH15QFoEH5y7pl8c
         blM2Fz+NfuJjbvKPf3YJicVjEKs6XYI41DUM4AZgeS3Crl/NvLymV8vPXl3+3feBBdPi
         Dh0y7CoHm2DXxYSBVfPuDJzyW39BDxEZ/QuF4RLdurWL9JHlbx7L1xLb/bVnpI996DX6
         yO5r7IDiAbSEFtqx1gGfbH/pdBIO7Lx4Kmpu6yBbLPH2Xv3WD5I6wXQc3jwWOfFIHvmV
         QyLuvDk8LkAHIqxKHe6UXt7lUONKMkrvnhW8VbmWPjsnDA6dl9FSJ7xMAqrzP8NJ9BgI
         GnPw==
Content-Disposition: inline
In-Reply-To: <20220608075827.2af7a35f@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, dsahern@kernel.org, steffen.klassert@secunet.com, jreuter@yaina.de, razor@blackwall.org, kgraul@linux.ibm.com, ivecera@redhat.com, jmaloy@redhat.com, ying.xue@windriver.com, lucien.xin@gmail.com, arnd@arndb.de, yajun.deng@linux.dev, atenart@kernel.org, richardsonnick@google.com, hkallweit1@gmail.com, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

Wed, Jun 08, 2022 at 04:58:27PM CEST, kuba@kernel.org wrote:
>On Wed, 8 Jun 2022 10:27:15 +0200 Jiri Pirko wrote:
>> Wed, Jun 08, 2022 at 06:39:55AM CEST, kuba@kernel.org wrote:
>> >Netdev reference helpers have a dev_ prefix for historic
>> >reasons. Renaming the old helpers would be too much churn  
>> 
>> Hmm, I think it would be great to eventually rename the rest too in
>> order to maintain unique prefix for netdev things. Why do you think the
>> "churn" would be an issue?
>
>Felt like we're better of moving everyone to the new tracking helpers
>than doing just a pure rename. But I'm not opposed to a pure rename.
>
>> >diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
>> >index 817577e713d7..815738c0e067 100644
>> >--- a/drivers/net/macsec.c
>> >+++ b/drivers/net/macsec.c
>> >@@ -3462,7 +3462,7 @@ static int macsec_dev_init(struct net_device *dev)
>> > 		memcpy(dev->broadcast, real_dev->broadcast, dev->addr_len);
>> > 
>> > 	/* Get macsec's reference to real_dev */
>> >-	dev_hold_track(real_dev, &macsec->dev_tracker, GFP_KERNEL);
>> >+	netdev_hold(real_dev, &macsec->dev_tracker, GFP_KERNEL);  
>> 
>> So we later decide to rename dev_hold() to obey the netdev_*() naming
>> scheme, we would have collision.
>
>dev_hold() should not be used in new code, we should use tracking
>everywhere. Given that we can name the old helpers __netdev_hold().
>
>> Also, seems to me odd to have:
>> OLDPREFIX_x()
>> and
>> NEWPREFIX_x()
>> to be different functions.
>> 
>> For the sake of not making naming mess, could we rather have:
>> netdev_hold_track()
>> or
>> netdev_hold_tr() if the prior is too long
>> ?
>
>See above, one day non-track version should be removed.
>IMO to encourage use of the track-capable API we could keep their names
>short and call the legacy functions __netdev_hold() as I mentioned or
>maybe netdev_hold_notrack().

Okay, that makes sense.

