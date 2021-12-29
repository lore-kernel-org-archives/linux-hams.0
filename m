From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from
	net/sock.h
Date: Wed, 29 Dec 2021 08:51:23 -0800
Message-ID: <CAADnVQLd2y_Cuqrn+cAQzCjpXM_Lub5_X6xEfZdMMC2a2Jq41A@mail.gmail.com>
References: <20211229004913.513372-1-kuba@kernel.org>
Mime-Version: 1.0
Return-path: <bridge-bounces@lists.linux-foundation.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eyiokD87yXLE7dKoF/rAesIX6IaZjzEtJI7+LN04FEk=;
 b=jbps2qryj0Z0zQWn+lrBBlSxcDefe6KXi88QIlXKVc6Y7PKqWfUapjY8JxFcaIGigd
 ft7+84WoQ0h4UhL3vyJ1DIBHIIiAm5llGYmfk4nVkAe+3GrrBf97zhKbWsvTPX6JejKF
 1dkXJo0UGl+pIxJTyh0L4R8V7cOazLao67YG1WvcCgMJUT7Zmhf0eicJkPKKBztKsk7v
 D05fKDj1dOQc8zLv828bRzJys90kfBlRY+f583hLSA+S27xtYBrr/t46oqhBNzw2uXBi
 meZ8HORQpYNqIJLSkK446oH4j64Ut5bibHP4XsZdHoPvyO6AnHzKO5rs+vK+c+HbGKip
 7LUg==
In-Reply-To: <20211229004913.513372-1-kuba@kernel.org>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/bridge>, 
 <mailto:bridge-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/bridge/>
List-Post: <mailto:bridge@lists.linux-foundation.org>
List-Help: <mailto:bridge-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/bridge>,
 <mailto:bridge-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: bridge-bounces@lists.linux-foundation.org
Sender: "Bridge" <bridge-bounces@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: wintera@linux.ibm.com, Andrew Lunn <andrew@lunn.ch>, mustafa.ismail@intel.com, Pablo Neira Ayuso <pablo@netfilter.org>, ath11k@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, george.mccollister@gmail.com, anthony.l.nguyen@intel.com, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, linux-s390 <linux-s390@vger.kernel.org>, pkshih@realtek.com, Florian Fainelli <f.fainelli@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org, "moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>, John Fastabend <john.fastabend@gmail.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Jozsef Kadlecsik <kadlec@netfilter.org>

On Tue, Dec 28, 2021 at 4:49 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> sock.h is pretty heavily used (5k objects rebuilt on x86 after
> it's touched). We can drop the include of filter.h from it and
> add a forward declaration of struct sk_filter instead.
> This decreases the number of rebuilt objects when bpf.h
> is touched from ~5k to ~1k.
>
> There's a lot of missing includes this was masking. Primarily
> in networking tho, this time.
>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2: https://lore.kernel.org/all/20211228192519.386913-1-kuba@kernel.org/
>  - fix build in bond on ia64
>  - fix build in ip6_fib with randconfig

Nice! Applied. Thanks
