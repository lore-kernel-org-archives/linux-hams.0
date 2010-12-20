From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH] [ROSE] AX25 packet routing improvement
Date: Mon, 20 Dec 2010 19:11:55 +0100
Message-ID: <4D0F9C6B.4020608@free.fr>
References: <4CF78B70.4060907@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070704090508080206070203"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF78B70.4060907@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: davem@davemloft.net, linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

This is a multi-part message in MIME format.
--------------070704090508080206070203
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Here is a new patch that completes the one I sent recently.

I hope you will find time to have a look at both patches
and approve them.

----------

[PATCH] [ROSE] [AX25] finding routes simplification

With previous patch, rose_get_neigh() routine
investigates the full list of neighbor nodes
until it finds or not an already connected node whether
it is called locally or through a level 3 transit frame.
If no routes are opened through an adjacent connected node
then a classical connect request is attempted.

Then there is no more reason for an extra loop such
as the one removed by this patch.

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>



Le 02/12/2010 13:05, f6bvp a =E9crit :
> Hi,
>
> Sorry for this second post.
> I found that spin_lock_bh was missing in the first loop !
>
>
> [PATCH] [ROSE] rose AX25 packet routing improvement
>
> FPAC AX25 packet application is using Linux kernel ROSE
> routing skills in order to connect or send packets to remote stations
> knowing their ROSE address via a network of interconnected nodes.
>
> Each FPAC node has a ROSE routing table that Linux ROSE module is
> looking at each time a ROSE frame is relayed by the node or when
> a connect request to a neighbor node is received.
>
> A previous patch improved the system time response by looking at
> already established routes each time the system was looking for a
> route to relay a frame. If a neighbor node routing the destination
> address was already connected, then the frame would be sent
> through him. If not, a connection request would be issued.
>
> The present patch extends the same routing capability to a connect
> request asked by a user locally connected into an FPAC node.
> Without this patch, a connect request was not well handled unless it
> was directed to an immediate connected neighbor of the local node.
>
> Implemented at a number of ROSE FPAC node stations, the present patch=20
> improved dramatically FPAC ROSE routing time response and efficiency.
>
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>
>


--------------070704090508080206070203
Content-Type: text/x-patch;
 name="af_rose.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="af_rose.patch"

--- a/net/rose/af_rose.c	2010-12-09 23:17:27.000000000 +0100
+++ b/net/rose/af_rose.c	2010-12-19 15:06:44.399455216 +0100
@@ -803,7 +803,6 @@
 
 		rose_insert_socket(sk);		/* Finish the bind */
 	}
-rose_try_next_neigh:
 	rose->dest_addr   = addr->srose_addr;
 	rose->dest_call   = addr->srose_call;
 	rose->rand        = ((long)rose & 0xFFFF) + rose->lci;
@@ -865,12 +864,6 @@
 	}
 
 	if (sk->sk_state != TCP_ESTABLISHED) {
-	/* Try next neighbour */
-		rose->neighbour = rose_get_neigh(&addr->srose_addr, &cause, &diagnostic, 0);
-		if (rose->neighbour)
-			goto rose_try_next_neigh;
-
-		/* No more neighbours */
 		sock->state = SS_UNCONNECTED;
 		err = sock_error(sk);	/* Always set at this point */
 		goto out_release;

--------------070704090508080206070203--
