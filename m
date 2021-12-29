From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Date: Wed, 29 Dec 2021 15:05:57 +0100
Message-ID: <20211229140557.cuap5jjqz47yevda@steredhat>
References: <20211229004913.513372-1-kuba@kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640786792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aO/4Yp6T43XLmNMDQP+OwTqaYv7whlIlyBDq4dbPFsg=;
        b=cIKLPwvkNFjDmUgRNlTNSevOZIBBFlut6kEpMOFbQCxhZU69gSHGNYnoRflhGuMChScNM8
        MLLIYy1Jlu4IaaAOR1/o9cyYzvZDtsUr3P0CyuY6juobcOPXCitDDK0ZZO06bxnwR6prVQ
        6vzpTZjOkHWBIWOV7rNOYbKxvNXjFuU=
Content-Disposition: inline
In-Reply-To: <20211229004913.513372-1-kuba@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, bpf@vger.kernel.org, netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com, dledford@redhat.com, jgg@ziepe.ca, mustafa.ismail@intel.com, shiraz.saleem@intel.com, leon@kernel.org, ap420073@gmail.com, wg@grandegger.com, woojung.huh@microchip.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com, george.mccollister@gmail.com, michael.chan@broadcom.com, jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com, hawk@kernel.org, john.fastabend@gmail.com, tariqt@nvidia.com, saeedm@nvidia.com, ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com, jreuter@yaina.de, dsahern@kernel.org, kvalo@codeaurora.org, pkshih@realtek.com, trond.myklebust@hammerspa

On Tue, Dec 28, 2021 at 04:49:13PM -0800, Jakub Kicinski wrote:
>sock.h is pretty heavily used (5k objects rebuilt on x86 after
>it's touched). We can drop the include of filter.h from it and
>add a forward declaration of struct sk_filter instead.
>This decreases the number of rebuilt objects when bpf.h
>is touched from ~5k to ~1k.
>
>There's a lot of missing includes this was masking. Primarily
>in networking tho, this time.
>
>Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
>Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>---
>v2: https://lore.kernel.org/all/20211228192519.386913-1-kuba@kernel.org/
> - fix build in bond on ia64
> - fix build in ip6_fib with randconfig

For AF_VSOCK:
Acked-by: Stefano Garzarella <sgarzare@redhat.com>

