From: "Ruben Navarro Huedo" <eb5esx@eb5esx.ampr.org>
Subject: Re: Netrom Broadcast
Date: Thu, 11 Mar 2004 16:43:43 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <32623.194.140.66.170.1079019823.squirrel@palotes.com>
References: <001101c4077d$cba85690$0200a8c0@albertla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001101c4077d$cba85690$0200a8c0@albertla>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albert Duane Lawson <wb7awl@comcast.net>
Cc: linux-hams@vger.kernel.org

This is my nrbroadcast:

# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
nos     1       200     100     1
xnet    1       200     100     1

And it only TX netrom frames in nos port.


Albert Duane Lawson dijo:
> Makes sure the file "nrbroadcast" exists in /etc/ax25
>
> It should look like this:
>
> # /etc/ax25/nrbroadcast
> #
> # The format of this file is:
> #
> # ax25_name min_obs def_qual worst_qual verbose
> #
> 1       6       230     85      0
> 2       6       230     85      0
>
>
> Albert/WB7AWL
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
