From: Francois Romieu <romieu@fr.zoreil.com>
Subject: Re: [PATCH] rose: check NULL rose_loopback_neigh->loopback
Date: Tue, 16 Aug 2022 23:57:24 +0200
Message-ID: <YvwSxBhoMl0ueJ3z@electric-eye.fr.zoreil.com>
References: <20220816185140.9129-1-bernard.f6bvp@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 27GLvQq12706831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1660687046;
        bh=6H8n/CJHMY/1dbaVlTl6Qe9UqLRpU4VI2YY+z9nF3XA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SznzSYA/4B5H02d5CucbwbPrfFwTUunQbGI0MMJNU7eNLKLqFx1rMYo6TvoFSC4GV
         LNJCTj1Aty/au5cKx8+C4s2sX6+JUM1AltzW15VrSE4y6zJnVgltrsxU1MV36lAW2A
         8F6PkE/VGnPN/o/i4O9IM0wwDTjQrPd6lCX3YSp8=
Content-Disposition: inline
In-Reply-To: <20220816185140.9129-1-bernard.f6bvp@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bernard.f6bvp@gmail.com
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, Bernard Pidoux <f6bvp@free.fr>

bernard.f6bvp@gmail.com <bernard.f6bvp@gmail.com> :
> From: Bernard <bernard.f6bvp@gmail.com>
> 
> Since kernel 5.4.83 rose network connections were no more possible.
> Last good rose module was with kernel 5.4.79.
> 
> Francois Romieu <romieu@fr.zoreil.com> pointed the scope of changes to
> the attached commit (3b3fd068c56e3fbea30090859216a368398e39bf
> in mainline, 7f0ddd41e2899349461b578bec18e8bd492e1765 in stable).

The attachment did not follow the references from the original mail. :o/

The paragraph above may be summarized as:

Fixes: 3b3fd068c56e ("rose: Fix Null pointer dereference in rose_send_frame()")

("Suggested-by" would be utter gourmandise)

[...]
> IMHO this patch should be propagated back to LTS 5.4 kernel.

3b3fd068c56e is itself tagged as 'Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")',
i.e. 'problem exists since git epoch back in 2005'. Stable people will
probably apply your fix wherever 3b3fd068c56e has been applied or backported,
namely anything post v5.10, stable v5.4, stable v4.19 and stable v4.14.

> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
> ---
>  net/rose/rose_loopback.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 11c45c8c6c16..1c673db52636 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -97,8 +97,10 @@ static void rose_loopback_timer(struct timer_list *unused)
> 
> 		if (frametype == ROSE_CALL_REQUEST) {
> 			if (!rose_loopback_neigh->dev) {
> -				kfree_skb(skb);
> -				continue;
> +				if (!rose_loopback_neigh->loopback) {
> +					kfree_skb(skb);
> +					continue;
> +				}

FWIW, avoiding the extra indentation may be marginally more idiomatic:

@@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
		}

		if (frametype == ROSE_CALL_REQUEST) {
-			if (!rose_loopback_neigh->dev) {
+			if (!rose_loopback_neigh->dev &&
+			    !rose_loopback_neigh->loopback) {
 				kfree_skb(skb);
 				continue;
			}
Good night.

-- 
Ueimor
