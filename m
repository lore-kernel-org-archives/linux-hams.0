From: Jarek Poplawski <jarkao2@gmail.com>
Subject: [PATCH] ax25: Add missing dev_put in ax25_setsockopt
Date: Mon, 28 Sep 2009 07:12:11 +0000
Message-ID: <20090928071211.GA8658@ff.dom.local>
References: <20090921201157.GA5460@del.dom.local> <4ABA9058.3010605@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=fX5lomy90Bp4ACfa7Hfrs1MnaAgHjcNeG3/8lRdql5M=;
        b=YAIpX/zUYdsn6j9cDeTfKAlCiux1u152YuBMoBugZG1Yf2jJImfQ43VH2tolYyxxz3
         7SwBDJ9dEEUA+QVV2UWaDfz+aC7Tq10G6gzLrwbw1+YL45zUfIzt6mRL1vEAARs19U2l
         lHDmuQX8IZ8cv+foG5EPs6CS17Ry6UllNfFwM=
Content-Disposition: inline
In-Reply-To: <4ABA9058.3010605@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Bernard Pidoux F6BVP <f6bvp@free.fr>, Bernard Pidoux <bernard.pidoux@upmc.fr>, Ralf Baechle DL5RB <ralf@linux-mips.org>, Linux Netdev List <netdev@vger.kernel.org>, linux-hams <linux-hams@vger.kernel.org>

There is no dev_put ending positive SO_BINDTODEVICE call in
ax25_setsockopt and no matching dev_put later. This ref isn't used by
ax25_cb's because it's handled with up and down device events.

BTW of reported-by: Bernard Pidoux F6BVP <f6bvp@free.fr>

Signed-off-by: Jarek Poplawski <jarkao2@gmail.com>
---

 net/ax25/af_ax25.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fbcac76..3eee8eb 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -663,6 +663,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 
 		ax25->ax25_dev = ax25_dev_ax25dev(dev);
 		ax25_fillin_cb(ax25, ax25->ax25_dev);
+		dev_put(dev);
 		break;
 
 	default:
