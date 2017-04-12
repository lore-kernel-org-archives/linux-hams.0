From: f6bvp <f6bvp@free.fr>
Subject: Re: Interesting Rose patch
Date: Wed, 12 Apr 2017 10:19:43 +0200
Message-ID: <df20e8f4-bd80-225f-ba78-d4822afea720@free.fr>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net>
 <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net>
 <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr>
 <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net>
 <3d0e170e-3995-84d0-007e-3d2065296237@free.fr>
 <9f9dba49-c2a5-41e8-9382-9154802e7fbf@trinnet.net>
 <20170327163641.0f992e2d@brox.localnet>
 <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hi,

Here is a short add to my previous post.

Actually rose_route.c patch is independant from the others but very 
important as it removes a rare but fatal bug causing kernel panic.

I could observed the bug after adding an IP address to a secondary 
network to an ethernet port but without giving a route to this network.

Obviously it should be the subject of an separate commit.

Here is original post explanation from Richard  :

List:       linux-netdev
Subject:    [PATCH 3/6]NET:AX25:ROSE  Traps calls to rose_route_frame
with a NULL ax25 callback
From:       Richard Stearn <richard () rns-stearn ! demon ! co ! uk>
Date:       2016-07-16 9:43:59
Message-ID: 201607160943.u6G9hx4i014901 () ux4 ! g1sog

Subject: [PATCH 3/6]NET:AX25:ROSE  Traps calls to rose_route_frame with a
NULL ax25 callback
Traps calls to rose_route_frame with a NULL ax25 callback to
prevent a kernel crash.

Calling rose_route_frame with a NULL ax25 callback parameter indicates a
locally generated frame.  The existing code does not handle the NULL value
and the kernel hard crashes in an interrupt, resulting in the system
stopping
processing.

Signed-off-by: Richard Stearn<richard@rns-stearn.demon.co.uk>




Le 11/04/2017 à 19:26, f6bvp a écrit :
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
> Applying the following patch subset cured the issue and allowed a 
> clean rose module removal.
>
> The following patches are part of a larger series committed by Richard 
> but rejected by Dave Miller mostly for format reasons.
>
> I selected and checked the minimal changes necessary to cure the 
> refcount issue.
>
> See :
>
> http://marc.info/?l=linux-hams&m=146873255413533&w=2
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
>                 rose->source_call = user->call;
>                 ax25_uid_put(user);
>         } else {
> -               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
> +               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
> +                       dev_put(dev);
>                         return -EACCES;
> +               }
>                 rose->source_call   = *source;
>         }
>
> @@ -710,6 +712,7 @@
>         rose_insert_socket(sk);
>
>         sock_reset_flag(sk, SOCK_ZAPPED);
> +       dev_put(dev);
>
>         return 0;
>  }
> diff -ruN a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> --- a/net/rose/rose_loopback.c  2017-04-03 19:02:14.206800010 +0200
> +++ b/net/rose/rose_loopback.c  2017-04-03 12:18:02.291052777 +0200
> @@ -102,6 +102,7 @@
>                         if ((dev = rose_dev_get(dest)) != NULL) {
>                                 if (rose_rx_call_request(skb, dev, 
> rose_loopback_neigh, lci_o) == 0)
>                                         kfree_skb(skb);
> +                               dev_put(dev);
>                         } else {
>                                 kfree_skb(skb);
>                         }
> diff -ruN a/net/rose/rose_route.c b/net/rose/rose_route.c
> --- a/net/rose/rose_route.c     2017-04-03 19:02:14.207799967 +0200
> +++ b/net/rose/rose_route.c     2017-04-03 12:18:02.290052819 +0200
> @@ -875,6 +875,11 @@
>         src_addr  = (rose_address *)(skb->data + 
> ROSE_CALL_REQ_SRC_ADDR_OFF);
>         dest_addr = (rose_address *)(skb->data + 
> ROSE_CALL_REQ_DEST_ADDR_OFF);
>
> +       if (ax25 == NULL) {
> +               printk(KERN_ERR "rose_route_frame : called with ax25 
> callback == NULL\n");
> +               return res;
> +       }
> +
>         spin_lock_bh(&rose_neigh_list_lock);
>         spin_lock_bh(&rose_route_list_lock);
>

