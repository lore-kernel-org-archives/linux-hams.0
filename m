From: Jarek Poplawski <jarkao2@gmail.com>
Subject: [PATCH] ax25: Fix possible oops in ax25_make_new
Date: Sun, 27 Sep 2009 22:57:02 +0200
Message-ID: <20090927205701.GA7205@del.dom.local>
References: <20090921201157.GA5460@del.dom.local>
 <4ABA9058.3010605@free.fr>
 <20090925131038.GA14778@ff.dom.local>
 <20090925134052.GA1661@linux-mips.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=tajQHGnQCrqfZCFUT+L97Ac4M0dmFPSPzLlJ0OnfKhY=;
        b=BEbLQ4FIcxRTCDOqjQKKE+PZw7Cx05l+OpJI2eaG98ph+yBFdCHcD0R0bQn+bnw/Kf
         TphpC60EDzmzV+fCV5l4gdqwrkVzxY6yJwMQ8VNz22j/CFtoXE5zOUvHlTBe7ozWrGDu
         G9PCG1S11tX1/oXkxJjjqVQoGA8iyoZ3nQkPk=
Content-Disposition: inline
In-Reply-To: <20090925134052.GA1661@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: David Miller <davem@davemloft.net>, Bernard Pidoux F6BVP <f6bvp@free.fr>, Bernard Pidoux <bernard.pidoux@upmc.fr>, Linux Netdev List <netdev@vger.kernel.org>, linux-hams <linux-hams@vger.kernel.org>

In ax25_make_new, if kmemdup of digipeat returns an error, there would
be an oops in sk_free while calling sk_destruct, because sk_protinfo
is NULL at the moment; move sk->sk_destruct initialization after this.

BTW of reported-by: Bernard Pidoux F6BVP <f6bvp@free.fr>

Signed-off-by: Jarek Poplawski <jarkao2@gmail.com>
---

 net/ax25/af_ax25.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fbcac76..9884639 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -900,7 +900,6 @@ struct sock *ax25_make_new(struct sock *osk, struct ax25_dev *ax25_dev)
 
 	sock_init_data(NULL, sk);
 
-	sk->sk_destruct = ax25_free_sock;
 	sk->sk_type     = osk->sk_type;
 	sk->sk_priority = osk->sk_priority;
 	sk->sk_protocol = osk->sk_protocol;
@@ -938,6 +937,7 @@ struct sock *ax25_make_new(struct sock *osk, struct ax25_dev *ax25_dev)
 	}
 
 	sk->sk_protinfo = ax25;
+	sk->sk_destruct = ax25_free_sock;
 	ax25->sk    = sk;
 
 	return sk;
