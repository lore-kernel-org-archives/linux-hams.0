From: Dan Cross <crossd@gmail.com>
Subject: Re: [PATCH net v3 2/2] net: rose: fix null-ptr-deref caused by rose_kill_by_neigh
Date: Wed, 29 Jun 2022 08:54:37 -0400
Message-ID: <CAEoi9W6KBmJNO1obk5pPVhugjRjSs8PY2fC3r0wN2OD=3Ei5eg@mail.gmail.com>
References: <cover.1656031586.git.duoming@zju.edu.cn> <c31f454f74833b2003713fffa881aabb190b8290.1656031586.git.duoming@zju.edu.cn>
 <ecac788497ea0e4e5b725226ad8b1209dc62fa0e.camel@redhat.com> <411487ea.1b211.181ad932398.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJv7P9JBK5V21yUHUPSn4s4mgLe8+QTUb4c7j/mSOLk=;
        b=eM9fqYL7ibhxiiJX8yOPW5oaV4u0Psui/sBLW5T3uFQmjEewxYqjdbXglrZPcg6Mb+
         gx3Z/xnu6ZwC1yC2UsmNxBRW4CEQZEz6BkpBuq1g+r3XrAEWRWoojU+NIdBUwoDT+ozG
         YFZZFfmGh+lQbFoBiZsKgXXn5BQZJHRBd/NPhXgIjGW5OoivEFa723vgglP7u6cEyPWT
         iLxZVYR09XdioFObXfZAn4Cl5hJSAk7SfxUaxgw4q9KoV/mr1fpcmdKqN+XDnHCxDg8n
         l33B3qs8wiEnDGpm+9lQTFzTRlg0MCdgdOSQuDcBkXKzkDrY2rb9ab4GkJ2VvU6lnJzu
         2Myg==
In-Reply-To: <411487ea.1b211.181ad932398.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: duoming@zju.edu.cn
Cc: Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 28, 2022 at 11:59 PM <duoming@zju.edu.cn> wrote:
> Hello,
>
> On Tue, 28 Jun 2022 13:12:40 +0200 Paolo Abeni wrote:
> > [snip]
> > I'm sorry, I likely was not clear enough in my previous reply. This is
> > broken. If a list is [spin_]lock protected, you can't release the lock,
> > reacquire it and continue traversing the list from the [now invalid]
> > same iterator.
> >
> > e.g. if s is removed from the list, even if the sock is not de-
> > allocated due to the addtional refcount, the traversing will errnously
> > stop after this sock, instead of continuing processing the remaining
> > socks in the list.
>
> I understand. The following is a new solution:
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index bf2d986a6bc..24dcbde88fb 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -165,13 +165,21 @@ void rose_kill_by_neigh(struct rose_neigh *neigh)
>         struct sock *s;
>
>         spin_lock_bh(&rose_list_lock);
> +again:
>         sk_for_each(s, &rose_list) {
>                 struct rose_sock *rose = rose_sk(s);
>
>                 if (rose->neighbour == neigh) {
> +                       sock_hold(s);
> +                       spin_unlock_bh(&rose_list_lock);
> +                       lock_sock(s);
>                         rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
>                         rose->neighbour->use--;
>                         rose->neighbour = NULL;
> +                       release_sock(s);
> +                       spin_lock_bh(&rose_list_lock);
> +                       sock_put(s);
> +                       goto again;

It may be worthwhile noting that this changes the time complexity
of the algorithm to be O(n^2) in the number of entries in `rose_list`,
instead of linear.  But as that number is extremely unlikely to ever
be large, it probably makes no practical difference.

        - Dan C.

>                 }
>         }
>         spin_unlock_bh(&rose_list_lock);
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index fee6409c2bb..b116828b422 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -827,7 +827,9 @@ void rose_link_failed(ax25_cb *ax25, int reason)
>                 ax25_cb_put(ax25);
>
>                 rose_del_route_by_neigh(rose_neigh);
> +               spin_unlock_bh(&rose_neigh_list_lock);
>                 rose_kill_by_neigh(rose_neigh);
> +               return;
>         }
>         spin_unlock_bh(&rose_neigh_list_lock);
>  }
>
> If s is removed from the list, the traversing will not stop erroneously.
>
> Best regards,
> Duoming Zhou
