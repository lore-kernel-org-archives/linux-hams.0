From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET 0/7] skbuff: introduce pskb_realloc_headroom()
Date: Mon, 12 Jul 2021 16:26:38 +0300
Message-ID: <02202ac2-4cd8-4fea-290f-e49fb83eeb07@virtuozzo.com>
References: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=tsW93LKYsNwVYesCYjOwJko0OG56avvmHsNuF/Nk5SA=; b=EQ6wutd32AQNESjSR/Q
        4YQCZM+lubNVPm4LNJ3GKPgmjrVQNDEaw0xUKaq9+dU1p1r5Swr004UfmXkes+PKrpeEcBTeXBJFE
        Nb2lUZBGi/N0qtww+YY70vdA6SI2UG+Su9H42CaNf1xmdIX0o/q7Igg3+0cWckhjoZA92p4fDwk=;
In-Reply-To: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

currently if skb does not have enough headroom skb_realloc_headrom is called.
It is not optimal because it creates new skb.

Unlike skb_realloc_headroom, new helper pskb_realloc_headroom 
does not allocate a new skb if possible; 
copies skb->sk on new skb when as needed
and frees original skb in case of failures.

This helps to simplify ip[6]_finish_output2(), ip6_xmit() and a few other
functions in vrf, ax25 and bpf.

There are few other cases where this helper can be used but they require
an additional investigations. 

NB: patch "ipv6: use pskb_realloc_headroom in ip6_finish_output2" depends on 
patch "ipv6: allocate enough headroom in ip6_finish_output2()" submitted separately
https://lkml.org/lkml/2021/7/12/732

Vasily Averin (7):
  skbuff: introduce pskb_realloc_headroom()
  ipv6: use pskb_realloc_headroom in ip6_finish_output2
  ipv6: use pskb_realloc_headroom in ip6_xmit
  ipv4: use pskb_realloc_headroom in ip_finish_output2
  vrf: use pskb_realloc_headroom in vrf_finish_output
  ax25: use pskb_realloc_headroom
  bpf: use pskb_realloc_headroom in bpf_out_neigh_v4/6

 drivers/net/vrf.c      | 14 +++------
 include/linux/skbuff.h |  2 ++
 net/ax25/ax25_out.c    | 13 +++------
 net/ax25/ax25_route.c  | 13 +++------
 net/core/filter.c      | 22 +++-----------
 net/core/skbuff.c      | 41 ++++++++++++++++++++++++++
 net/ipv4/ip_output.c   | 12 ++------
 net/ipv6/ip6_output.c  | 78 ++++++++++++++++++--------------------------------
 8 files changed, 89 insertions(+), 106 deletions(-)

-- 
1.8.3.1

