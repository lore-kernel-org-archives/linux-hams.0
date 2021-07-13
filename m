From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET v2 0/7] skbuff: introduce skb_expand_head()
Date: Tue, 13 Jul 2021 23:57:45 +0300
Message-ID: <15eba3b2-80e2-5547-8ad9-167d810ad7e3@virtuozzo.com>
References: <55c9e2ae-b060-baa2-460c-90eb3e9ded5c@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=sNeWr16D67k9ERD9fz0l1ggJ+G2nxSzI7yaf7NQ9na0=; b=DJgFQOy4wSSnzCq9GhR
        ZQgmbURved4np9B5ieb1Q5t48PpilGDirtKcDKFFBYWPi2Bk/XzK2iCe0AgJ/jiGiNZlv3f9oR25d
        J60UwD3yOcGcQYZGDvyN3ENUPYXp+zx8yfiiNY0TWBBcS7ldB7PqCl2oM4XwJwYtetExwbLYWUg=;
In-Reply-To: <55c9e2ae-b060-baa2-460c-90eb3e9ded5c@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

currently if skb does not have enough headroom skb_realloc_headrom is called.
It is not optimal because it creates new skb.

Unlike skb_realloc_headroom, new helper skb_учзфтв_head 
does not allocate a new skb if possible; 
copies skb->sk on new skb when as needed
and frees original skb in case of failures.

This helps to simplify ip[6]_finish_output2(), ip6_xmit() and a few other
functions in vrf, ax25 and bpf.

There are few other cases where this helper can be used but they require
an additional investigations. 

v2 changes:
 - helper's name was changed to skb_expand_head
 - fixed few mistakes inside skb_expand_head():
    skb_set_owner_w should set sk on nskb
    kfree was replaced by kfree_skb()
    improved warning message
 - added minor refactoring in changed functions in vrf and bpf patches
 - removed kfree_skb() in ax25_rt_build_path caller ax25_ip_xmit

NB: patch "ipv6: use skb_expand_head in ip6_finish_output2" depends on 
patch "ipv6: allocate enough headroom in ip6_finish_output2()" submitted separately
https://lkml.org/lkml/2021/7/12/732

Vasily Averin (7):
  skbuff: introduce skb_expand_head()
  ipv6: use skb_expand_head in ip6_finish_output2
  ipv6: use skb_expand_head in ip6_xmit refactoring
  ipv4: use skb_expand_head in ip_finish_output2
  vrf: use skb_expand_head in vrf_finish_output
  ax25: use skb_expand_head
  bpf: use skb_expand_head in bpf_out_neigh_v4/6

 drivers/net/vrf.c      | 21 +++++---------
 include/linux/skbuff.h |  1 +
 net/ax25/ax25_out.c    | 12 ++------
 net/ax25/ax25_route.c  | 13 ++-------
 net/core/filter.c      | 27 ++++-------------
 net/core/skbuff.c      | 42 +++++++++++++++++++++++++++
 net/ipv4/ip_output.c   | 13 ++-------
 net/ipv6/ip6_output.c  | 78 +++++++++++++++++---------------------------------
 8 files changed, 90 insertions(+), 117 deletions(-)

-- 
1.8.3.1

