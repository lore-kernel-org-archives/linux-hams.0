From: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH NET 1/7] skbuff: introduce pskb_realloc_headroom()
Date: Mon, 12 Jul 2021 21:45:28 +0300
Message-ID: <55c9e2ae-b060-baa2-460c-90eb3e9ded5c@virtuozzo.com>
References: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
 <cover.1626093470.git.vvs@virtuozzo.com>
 <8049e16b-3d7a-64c3-c948-ec504590a136@virtuozzo.com>
 <20210712105310.46d265a5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
        Subject; bh=iAEZINJDepSq91s49rJlKY2GlIRP1NxaA+57Jcf/IuU=; b=UaNeQisPHAhOQk6p0
        R/9EJQTjFYSh2IJceO9Hc061xF5a/sUDJn9crRZpai/N012INLJB0oqw8nDXnjkyzP6Ione0d+Pj1
        1IOuh5ejnGq0uiq9sSQrEN4CA2BgWiHBbfVdPXL7S+bMj52C8x5H7F9IgSyAzNLJyZY+Jm4aYZTY0
        =;
In-Reply-To: <20210712105310.46d265a5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/12/21 8:53 PM, Jakub Kicinski wrote:
> I saw you asked about naming in a different sub-thread, what do you
> mean by "'pskb_expand_head' have different semantic"? AFAIU the 'p'
> in pskb stands for "private", meaning not shared. In fact
> skb_realloc_headroom() should really be pskb... but it predates the 
> 'pskb' naming pattern by quite a while. Long story short
> skb_expand_head() seems like a good name. With the current patch
> pskb_realloc_headroom() vs skb_realloc_headroom() would give people
> exactly the opposite intuition of what the code does.

Thank you for feedback,
I'll change helper name back to skb_expand_head() in next patch version.

	Vasily Averin
