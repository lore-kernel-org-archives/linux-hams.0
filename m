From: David Ranch <linux-hams@trinnet.net>
Subject: Fwd: Re: Interesting Rose patch
Date: Tue, 18 Apr 2017 09:14:21 -0700
Message-ID: <8dc528da-6d60-0fc4-4d6f-fa78b1f4ba86@trinnet.net>
References: <309904235.63498.1492029796017@ox-groupware.bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <309904235.63498.1492029796017@ox-groupware.bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: "Bernard, f6bvp" <f6bvp@free.fr>, C Schuman <k4gbb1@embarqmail.com>, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>, Basil Gunn <basil@pacabunga.com>


Hey Bernard,

Do you want to consider testing with Walter's modification to Richard's=20
patch mentioned on April 12th (below)?

--David


-------- Forwarded Message --------
Subject: 	Re: Interesting Rose patch
Date: 	Wed, 12 Apr 2017 22:43:15 +0200 (CEST)
From: 	Walter Harms <wharms@bfs.de>
Organization: 	Bundesamt f. Strahlenschutz
To: 	David Ranch <dranch@trinnet.net>, f6bvp <f6bvp@free.fr>, Basil Gunn=20
<basil@pacabunga.com>
CC: 	C Schuman <k4gbb1@embarqmail.com>, linux-hams@vger.kernel.org, Ralf=20
B=C3=A4chle DL5RB <ralf@linux-mips.org>, Richard Stearn=20
<richard@rns-stearn.co.uk>



> f6bvp <f6bvp@free.fr> hat am 11. April 2017 um 19:26 geschrieben:
>
>
> Hi,
>
> I want to acknowledge here a set of very usefull ROSE patches provided
> by richard Stearn.
>
> Since years, it has not been possible to set rose0 device down without
> creating an endless loop of kernel waiting for rose to become free.
>
> Richard found that a number of dev_put(dev) were missing.
>
> Applying the following patch subset cured the issue and allowed a clean
> rose module removal.
>
> The following patches are part of a larger series committed by Richard
> but rejected by Dave Miller mostly for format reasons.
>
> I selected and checked the minimal changes necessary to cure the
> refcount issue.
>
> See :
>
> http://marc.info/?l=3Dlinux-hams&m=3D146873255413533&w=3D2
>
> Richard does not want to jump in again.
>
> So I would appreciate if someone could help us by confirming that this
> patch is extremely convenient.
>
> Then someone could submit this subset to linux-hams and linux-netdev
> referees.
>
> 73 de Bernard, f6bvp
>
> ----------------------------------------
>
>
> diff -ruN a/net/rose/af_rose.c b/net/rose/af_rose.c
> --- a/net/rose/af_rose.c        2017-04-03 19:02:14.205800053 +0200
> +++ b/net/rose/af_rose.c        2017-04-03 12:18:02.290052819 +0200
> @@ -688,8 +688,10 @@
>                  rose->source_call =3D user->call;
>                  ax25_uid_put(user);
>          } else {
> -               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
> +               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
> +                       dev_put(dev);
>                          return -EACCES;
> +               }
>                  rose->source_call   =3D *source;
>          }
>
> @@ -710,6 +712,7 @@
>          rose_insert_socket(sk);
>
>          sock_reset_flag(sk, SOCK_ZAPPED);
> +       dev_put(dev);
>
>          return 0;
>   }
> diff -ruN a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> --- a/net/rose/rose_loopback.c  2017-04-03 19:02:14.206800010 +0200
> +++ b/net/rose/rose_loopback.c  2017-04-03 12:18:02.291052777 +0200
> @@ -102,6 +102,7 @@
>                          if ((dev =3D rose_dev_get(dest)) !=3D NULL) {
>                                  if (rose_rx_call_request(skb, dev,
> rose_loopback_neigh, lci_o) =3D=3D 0)
>                                          kfree_skb(skb);
> +                               dev_put(dev);
>                          } else {
>                                  kfree_skb(skb);
>                          }
> diff -ruN a/net/rose/rose_route.c b/net/rose/rose_route.c
> --- a/net/rose/rose_route.c     2017-04-03 19:02:14.207799967 +0200
> +++ b/net/rose/rose_route.c     2017-04-03 12:18:02.290052819 +0200
> @@ -875,6 +875,11 @@
>          src_addr  =3D (rose_address *)(skb->data +
> ROSE_CALL_REQ_SRC_ADDR_OFF);
>          dest_addr =3D (rose_address *)(skb->data +
> ROSE_CALL_REQ_DEST_ADDR_OFF);
>
> +       if (ax25 =3D=3D NULL) {
> +               printk(KERN_ERR "rose_route_frame : called with ax25
> callback =3D=3D NULL\n");
> +               return res;
> +       }
> +

you can check this more early and return 0 directly.

just my 2 cents,
re,
  wh

>          spin_lock_bh(&rose_neigh_list_lock);
>          spin_lock_bh(&rose_route_list_lock);
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

