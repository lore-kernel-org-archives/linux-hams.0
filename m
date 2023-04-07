From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next] ax25: exit linked-list searches earlier
Date: Fri, 7 Apr 2023 18:14:33 +0300
Message-ID: <5d555fd8-0c9b-4460-9adf-9f8c2076f39a@kili.mountain>
References: <20230407142042.11901-1-peter@n8pjl.ca>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680880479; x=1683472479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOp6B3Yrf8/IElRYh7BCFuo52ng4eeD3hfWMY8BurBw=;
        b=KhP0mxxllubIFX67GhecQYjfyspDjUfp6IGTgoo79QDraja9BpDHQSa4uh7byHUtmt
         fPOc0hSsv7wxiQV0ClZIm7eRLXBwuZT06gl8DWPT4+Gaytm1HPWNK9fVzPinrQvmCox6
         6vK7z+Xy42hOj0dp5EBSV9jzh2MCcsr8do92Nx5Yws6dIU7Db+N7/gQiqhw05m26i35w
         U+XGz4r3kIejOc+BY+2x3pXaWJaYqicTotHJaSiPCdya2j0oqI1knX59uBKNnFAkSumC
         HhuAhH3Ye7glX/+jacAIrrLjAlEXInSOSnJgnmT4RHs7V60sVeytdJOPF64oEVB3xTM8
         k2nA==
Content-Disposition: inline
In-Reply-To: <20230407142042.11901-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Fri, Apr 07, 2023 at 10:20:42AM -0400, Peter Lafreniere wrote:
> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> index b7c4d656a94b..ed2cab200589 100644
> --- a/net/ax25/ax25_route.c
> +++ b/net/ax25/ax25_route.c
> @@ -364,6 +364,9 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
>  			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
>  				ax25_def_rt = ax25_rt;
>  		}
> +
> +		if (ax25_spe_rt != NULL)
> +			break;

Better to just return directly.

diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b7c4d656a94b..a8a3ab8c92f6 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -364,13 +364,12 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
 				ax25_def_rt = ax25_rt;
 		}
-	}
 
-	ax25_rt = ax25_def_rt;
-	if (ax25_spe_rt != NULL)
-		ax25_rt = ax25_spe_rt;
+		if (ax25_spe_rt)
+			return ax25_spe_rt;
+	}
 
-	return ax25_rt;
+	return ax25_def_rt;
 }
 
 /*
