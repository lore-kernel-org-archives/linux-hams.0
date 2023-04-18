From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 net-next] ax25: exit linked-list searches earlier
Date: Tue, 18 Apr 2023 09:15:42 +0200
Message-ID: <0b96894f4540d1d60761f92811a58c3844b6869d.camel@redhat.com>
References: <20230407142042.11901-1-peter@n8pjl.ca>
         <20230414143357.5523-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681802151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OFLrmPM4SY1LGfG6ef9nu/uLrU9eDtxg8RuZp9GHn+I=;
        b=Y/axmV0wFp0boT6Hm37bKxuQcDLe2vXRNwWGQG7Gv04H0WnOfKTG+p6NdRUDdH2eSgYy/i
        hrlmA95B42yDInoOh3nTfie4Gtlpsrb/7cfsIaQ+z9a6dOUOhxHLSXGARPNMAC8ywKg4wM
        hJlA55oj1UHUYFtmHvP1MKqX+VKl5lM=
In-Reply-To: <20230414143357.5523-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <peter@n8pjl.ca>, linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, error27@gmail.com

On Fri, 2023-04-14 at 10:33 -0400, Peter Lafreniere wrote:
> There's no need to loop until the end of the list if we have a result.
>=20
> Device callsigns are unique, so there can only be one dev returned from
> ax25_addr_ax25dev(). If not, there would be inconsistencies based on
> order of insertion, and refcount leaks.
>=20
> We follow the same reasoning in ax25_get_route(), and additionally
> reorder conditions to skip calling ax25cmp() whenever possible.=20
>=20
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
> ---
> v1 -> v2
>  - Make ax25_get_route() return directly
>  - Reorder calls to ax25cmp() in ax25_get_route()
>  - Skip searching for default route once found in ax25_get_route()
>=20
>  net/ax25/ax25_dev.c   |  4 +++-
>  net/ax25/ax25_route.c | 25 +++++++++++++------------
>  2 files changed, 16 insertions(+), 13 deletions(-)
>=20
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index c5462486dbca..8186faea6b0d 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -34,11 +34,13 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
>  	ax25_dev *ax25_dev, *res =3D NULL;
> =20
>  	spin_lock_bh(&ax25_dev_lock);
> -	for (ax25_dev =3D ax25_dev_list; ax25_dev !=3D NULL; ax25_dev =3D ax25_=
dev->next)
> +	for (ax25_dev =3D ax25_dev_list; ax25_dev !=3D NULL; ax25_dev =3D ax25_=
dev->next) {
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) =3D=
=3D 0) {
>  			res =3D ax25_dev;
>  			ax25_dev_hold(ax25_dev);
> +			break;
>  		}
> +	}
>  	spin_unlock_bh(&ax25_dev_lock);
> =20
>  	return res;
> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> index b7c4d656a94b..ebef46c38e80 100644
> --- a/net/ax25/ax25_route.c
> +++ b/net/ax25/ax25_route.c
> @@ -344,7 +344,6 @@ const struct seq_operations ax25_rt_seqops =3D {
>   */
>  ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
>  {
> -	ax25_route *ax25_spe_rt =3D NULL;
>  	ax25_route *ax25_def_rt =3D NULL;
>  	ax25_route *ax25_rt;
> =20
> @@ -354,23 +353,25 @@ ax25_route *ax25_get_route(ax25_address *addr, stru=
ct net_device *dev)
>  	 */
>  	for (ax25_rt =3D ax25_route_list; ax25_rt !=3D NULL; ax25_rt =3D ax25_r=
t->next) {
>  		if (dev =3D=3D NULL) {
> -			if (ax25cmp(&ax25_rt->callsign, addr) =3D=3D 0 && ax25_rt->dev !=3D N=
ULL)
> -				ax25_spe_rt =3D ax25_rt;
> -			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) =3D=3D 0 && ax25_=
rt->dev !=3D NULL)
> +			if (ax25_rt->dev !=3D NULL && ax25cmp(&ax25_rt->callsign, addr) =3D=
=3D 0)
> +				return ax25_rt;
> +
> +			if (ax25_def_rt !=3D NULL &&
> +			    ax25_rt->dev !=3D NULL &&
> +			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) =3D=3D 0)
>  				ax25_def_rt =3D ax25_rt;
>  		} else {
> -			if (ax25cmp(&ax25_rt->callsign, addr) =3D=3D 0 && ax25_rt->dev =3D=3D=
 dev)
> -				ax25_spe_rt =3D ax25_rt;
> -			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) =3D=3D 0 && ax25_=
rt->dev =3D=3D dev)
> +			if (ax25_rt->dev =3D=3D dev && ax25cmp(&ax25_rt->callsign, addr) =3D=
=3D 0)
> +				return ax25_rt;
> +
> +			if (ax25_def_rt !=3D NULL &&
> +			    ax25_rt->dev =3D=3D dev &&
> +			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) =3D=3D 0)
>  				ax25_def_rt =3D ax25_rt;

If I read correctly, multiple routes can legitly match the null
callsign and the above chunk introduces a behavioral change: before the
kernel selected the last of such routes, now the first one.

What about dropping the new condition 'ax25_def_rt !=3D NULL' ?

If so, this patch could target the -net tree - with a suitable fixes
tag.

Thanks!

Paolo

