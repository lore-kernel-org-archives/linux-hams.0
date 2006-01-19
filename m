From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: ROSE lockup fix
Date: Thu, 19 Jan 2006 17:44:58 +0100
Message-ID: <43CFC20A.4060600@ccr.jussieu.fr>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net> <20060113210925.GB3516@linux-mips.org> <43CD2275.8050602@ccr.jussieu.fr> <20060118010843.GA3312@linux-mips.org> <20060118083816.GA7510@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060118083816.GA7510@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hi Ralf,

Sorry but I applied the patch and it did not change the problem.
When shutting down the system there is still a spinlock error.

I made some pictures of the different trials in order to compare.

The message actually starts with for example :

BUG: spinlock recursion on CPU#1, kissattach/5094
  lock: f8d68714, .magic: dead4ead, .owner: kissattach/5094, .owner_cpu=
: 1

Even if the name of the program may change i.e. kissattach or ax25ipd,=20
the associated /5094 and address after lock remains the same.
Also it can be CPU#0 or CPU#1

The rest of the track displays exactly the same sequence I reported on=20
the previous message.

Do we have another chance to track this "spinlock recursion" ?

---------------

Ralf Baechle DL5RB a =E9crit :
> On Wed, Jan 18, 2006 at 01:08:43AM +0000, Ralf Baechle DL5RB wrote:
>=20
>=20
>>Anyway, the problem is pretty obvious in your traceback and I'll cook=
 a
>>patch for you to test.
>=20
>=20
> Can you test the patch below?
>=20
>   Ralf
>=20
>  net/rose/rose_route.c |    7 -------
>  1 files changed, 7 deletions(-)
>=20
> Index: linux-mips/net/rose/rose_route.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-mips.orig/net/rose/rose_route.c
> +++ linux-mips/net/rose/rose_route.c
> @@ -48,8 +48,6 @@ static DEFINE_SPINLOCK(rose_route_list_l
> =20
>  struct rose_neigh *rose_loopback_neigh;
> =20
> -static void rose_remove_neigh(struct rose_neigh *);
> -
>  /*
>   *	Add a new route to a node, and in the process add the node and th=
e
>   *	neighbour if it is new.
> @@ -235,11 +233,8 @@ static void rose_remove_neigh(struct ros
> =20
>  	skb_queue_purge(&rose_neigh->queue);
> =20
> -	spin_lock_bh(&rose_neigh_list_lock);
> -
>  	if ((s =3D rose_neigh_list) =3D=3D rose_neigh) {
>  		rose_neigh_list =3D rose_neigh->next;
> -		spin_unlock_bh(&rose_neigh_list_lock);
>  		kfree(rose_neigh->digipeat);
>  		kfree(rose_neigh);
>  		return;
> @@ -248,7 +243,6 @@ static void rose_remove_neigh(struct ros
>  	while (s !=3D NULL && s->next !=3D NULL) {
>  		if (s->next =3D=3D rose_neigh) {
>  			s->next =3D rose_neigh->next;
> -			spin_unlock_bh(&rose_neigh_list_lock);
>  			kfree(rose_neigh->digipeat);
>  			kfree(rose_neigh);
>  			return;
> @@ -256,7 +250,6 @@ static void rose_remove_neigh(struct ros
> =20
>  		s =3D s->next;
>  	}
> -	spin_unlock_bh(&rose_neigh_list_lock);
>  }
> =20
>  /*
>=20
>=20

--=20

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org (mirror)
http://rose.fpac.free.fr/
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
