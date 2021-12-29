From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Date: Tue, 28 Dec 2021 17:33:39 -0800
Message-ID: <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
References: <20211229004913.513372-1-kuba@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IBcil9O+VRrBlwSK9WQFnnXvi87jfhzw0Yvv4tQzzQ4=;
        b=noDIEQ8P8sUYyX/OE18Q5FGCEdOtXRbYUWogiKJXUl19FWceFTLSzy33NO7370WsVb
         xNtywJS1aHmXYo/ZkLPfxpKAuLKxK4YE+eVz8VTkizITqKtfycFbgYZ8mkgMJWEJt21+
         SNTUf5JrpwvWrXhCSoo6DxEmJYz1lYAcgrZn5Siak7Xevszf8m10NCTaN+zXiqI+KIS/
         Eu3eNT4oCfEFd0fiD/WXOlhQ5EblQr9RpaZdLMvylKbA5ymBdmZHyFsCK1nxmVisoAn9
         uYVylo+Wo6Qmr7pTJyQxMeOn82Ns+dOHizKeng6bH3WIfBKj/q/NPdRFTbbgDlFIWhAW
         0Xqg==
Content-Language: en-US
In-Reply-To: <20211229004913.513372-1-kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ast-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org
Cc: bpf-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, luiz.dentz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jgg-uk2M96/98Pc@public.gmane.org, mustafa.ismail-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, shiraz.saleem-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, leon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ap420073-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org, woojung.huh-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olteanv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, george.mccollister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.chan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jesse.brandeburg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, anthony.l.nguyen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hawk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.fastabend-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tariqt-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, saeedm-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ecree.xilinx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, habetsm.xilinx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jreuter-K7Hl1MveuGQ@public.gmane.org, dsahern-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pkshih-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org, trond.myklebust-F/q8l9xzQnoyLce1RVWEUA@public.gmane.org, anna.schumaker-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org, viro-RmSDqhL/yNOoGNRTaapkhg@public.gmane.org



On 12/28/2021 4:49 PM, Jakub Kicinski wrote:
> sock.h is pretty heavily used (5k objects rebuilt on x86 after
> it's touched). We can drop the include of filter.h from it and
> add a forward declaration of struct sk_filter instead.
> This decreases the number of rebuilt objects when bpf.h
> is touched from ~5k to ~1k.
> 
> There's a lot of missing includes this was masking. Primarily
> in networking tho, this time.
> 
> Acked-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

It would be nice if we used the number of files rebuilt because of a 
header file change as another metric that the kernel is evaluated with 
from release to release (or even on a commit by commit basis). Food for 
thought.
-- 
Florian
