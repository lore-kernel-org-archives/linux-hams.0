From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [PATCH 1/3] net: ax25: fix information leak to userland
Date: Mon, 01 Nov 2010 17:55:53 +0100
Message-ID: <4CCEF119.4050500@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Eric Dumazet <eric.dumazet@gmail.com>

Hi,

I applied the AX25 patch and did not observe any problem with AX25 nor =
NetROM
or ROSE traffic.

I observed that a similar structure initialization existed in rose_getn=
ame() but
not in netrom nr_getname().

A similar patch for af_netrom could be :


--- a/net/netrom/af_netrom.c	2010-08-27 01:47:12.000000000 +0200
+++ b/net/netrom/af_netrom.c	2010-11-01 14:38:34.580000003 +0100
@@ -840,6 +840,7 @@ static int nr_getname(struct socket *soc
  	struct sock *sk =3D sock->sk;
  	struct nr_sock *nr =3D nr_sk(sk);

+	memset(sax, 0, sizeof(*sax));
  	lock_sock(sk);
  	if (peer !=3D 0) {
  		if (sk->sk_state !=3D TCP_ESTABLISHED) {
@@ -854,7 +855,6 @@ static int nr_getname(struct socket *soc
  		*uaddr_len =3D sizeof(struct full_sockaddr_ax25);
  	} else {
  		sax->fsa_ax25.sax25_family =3D AF_NETROM;
-		sax->fsa_ax25.sax25_ndigis =3D 0;
  		sax->fsa_ax25.sax25_call   =3D nr->source_addr;
  		*uaddr_len =3D sizeof(struct sockaddr_ax25);
  	}


Signed-off-by: Bernard Pidoux<bernard.pidoux@upmc.fr>



Le dimanche 31 octobre 2010 =C3  20:10 +0300, Vasiliy Kulikov a =C3=A9c=
rit :
>  Sometimes ax25_getname() doesn't initialize all members of fsa_digip=
eater
>  field of fsa struct.  This structure is then copied to userland.  It=
 leads to
>  leaking of contents of kernel stack memory.  We have to initialize t=
hem to zero.
>
>  Signed-off-by: Vasiliy Kulikov<segooon@gmail.com>
>  ---
>   net/ax25/af_ax25.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
>  diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>  index 26eaebf..a324d83 100644
>  --- a/net/ax25/af_ax25.c
>  +++ b/net/ax25/af_ax25.c
>  @@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, s=
truct sockaddr *uaddr,
>   	ax25_cb *ax25;
>   	int err =3D 0;
>
>  +	memset(&fsa->fsa_digipeater, 0, sizeof(fsa->fsa_digipeater));
>   	lock_sock(sk);
>   	ax25 =3D ax25_sk(sk);
>

If you really want to fix this for good, please do it completely ?

sa_family_t is a short

ax25_address is 7 bytes.

Therefore, there is a hole before sax25_ndigis.

struct sockaddr_ax25 {
         sa_family_t     sax25_family;
         ax25_address    sax25_call;
<hole>
         int             sax25_ndigis;
         /* Digipeater ax25_address sets follow */
};
struct full_sockaddr_ax25 {
         struct sockaddr_ax25 fsa_ax25;
         ax25_address    fsa_digipeater[AX25_MAX_DIGIS];
};


So a correct patch is the following one. Note AX25 is probably used by
nobody at all, so a full memset() is not performance critical in this
path.


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 26eaebf..6da5dae 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, stru=
ct sockaddr *uaddr,
  	ax25_cb *ax25;
  	int err =3D 0;

+	memset(fsa, 0, sizeof(*fsa));
  	lock_sock(sk);
  	ax25 =3D ax25_sk(sk);

@@ -1403,7 +1404,6 @@ static int ax25_getname(struct socket *sock, stru=
ct sockaddr *uaddr,

  		fsa->fsa_ax25.sax25_family =3D AF_AX25;
  		fsa->fsa_ax25.sax25_call   =3D ax25->dest_addr;
-		fsa->fsa_ax25.sax25_ndigis =3D 0;

  		if (ax25->digipeat !=3D NULL) {
  			ndigi =3D ax25->digipeat->ndigi;



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
