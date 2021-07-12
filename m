From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET 1/7] skbuff: introduce pskb_realloc_headroom()
Date: Mon, 12 Jul 2021 16:26:44 +0300
Message-ID: <8049e16b-3d7a-64c3-c948-ec504590a136@virtuozzo.com>
References: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
 <cover.1626093470.git.vvs@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=4xvvJxEFJ5BdiccDhVEn/6X1ajbfe8RaCWu9N5O1n48=; b=VY1gLHJ58pd3yGm3n+p
        Bad9BfbADwp1dhq1s1WZjymtyMHP+IlQbe99P8JdU4IafAYMoDMxHTZRIu8Z+iMXBRmy2R4aoKxzf
        le1+QtltnFVu7VDNBXAI5uV6qlBtkZN05SrqednvcgHrk7P0yZWDqJiZD/dt1P2ekWu1Ey50LYo=;
In-Reply-To: <cover.1626093470.git.vvs@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

Unlike skb_realloc_headroom, new helper does not allocate a new skb
if possible; copies skb->sk on new skb when as needed and frees
original skb in case of failures.

This helps to simplify ip[6]_finish_output2() and a few other similar cases.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index dbf820a..381a219 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1174,6 +1174,8 @@ static inline struct sk_buff *__pskb_copy(struct sk_buff *skb, int headroom,
 int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail, gfp_t gfp_mask);
 struct sk_buff *skb_realloc_headroom(struct sk_buff *skb,
 				     unsigned int headroom);
+struct sk_buff *pskb_realloc_headroom(struct sk_buff *skb,
+				      unsigned int headroom);
 struct sk_buff *skb_copy_expand(const struct sk_buff *skb, int newheadroom,
 				int newtailroom, gfp_t priority);
 int __must_check skb_to_sgvec_nomark(struct sk_buff *skb, struct scatterlist *sg,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index bbc3b4b..13cbe98 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1769,6 +1769,47 @@ struct sk_buff *skb_realloc_headroom(struct sk_buff *skb, unsigned int headroom)
 EXPORT_SYMBOL(skb_realloc_headroom);
 
 /**
+ *	pskb_realloc_headroom - reallocate header of &sk_buff
+ *	@skb: buffer to reallocate
+ *	@headroom: needed headroom
+ *
+ *	Unlike skb_realloc_headroom, this one does not allocate a new skb
+ *	if possible; copies skb->sk to new skb as needed
+ *	and frees original scb in case of failures.
+ *
+ *	It expect increased headroom, and generates warning otherwise.
+ */
+
+struct sk_buff *pskb_realloc_headroom(struct sk_buff *skb, unsigned int headroom)
+{
+	int delta = headroom - skb_headroom(skb);
+
+	if (WARN_ONCE(delta <= 0, "%s expect positive delta", __func__))
+		return skb;
+
+	/* pskb_expand_head() might crash, if skb is shared */
+	if (skb_shared(skb)) {
+		struct sk_buff *nskb = skb_clone(skb, GFP_ATOMIC);
+
+		if (likely(nskb)) {
+			if (skb->sk)
+				skb_set_owner_w(skb, skb->sk);
+			consume_skb(skb);
+		} else {
+			kfree(skb);
+		}
+		skb = nskb;
+	}
+	if (skb &&
+	    pskb_expand_head(skb, SKB_DATA_ALIGN(delta), 0, GFP_ATOMIC)) {
+		kfree(skb);
+		skb = NULL;
+	}
+	return skb;
+}
+EXPORT_SYMBOL(pskb_realloc_headroom);
+
+/**
  *	skb_copy_expand	-	copy and expand sk_buff
  *	@skb: buffer to copy
  *	@newheadroom: new free bytes at head
-- 
1.8.3.1

