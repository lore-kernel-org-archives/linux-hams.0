From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Wed, 8 Jun 2022 16:00:54 -0700
Message-ID: <CANn89i+RCCXQDVVTB+hHasGmjdXwdm8CvkPQv3nYSLgr=MYmpA@mail.gmail.com>
References: <20220608043955.919359-1-kuba@kernel.org> <YqBdY0NzK9XJG7HC@nanopsycho>
 <20220608075827.2af7a35f@kernel.org> <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yDmHaHfbP+V5NY5ockejgPMau+3mt71MxfGCliwuimo=;
        b=U5ZIepD986IE19Jdtz/JfQMpmGlOdj0Ma4qhBU6FvPG2yVumX/iIIxTkGWJvdARXmm
         crsUsGKAq+kZMs6Hsp0nX0/r6mck2nTRwjJ7WYltXAly8x2IeLGDEZSyxkyQ+CouzR+b
         GItTca7O9lML9JZiCZp9jl/ZrV9mXpgSAtsak14LlmxBcGt3919lfyPt1EtJt9+JsFq6
         6YCWY8yLavOYfz/nthcyHUBmrA4V3xKtIYPD7qH6NsA7jUdazC0A7h7D+2MgMR0wM2st
         fP/2jPgNzHEg2YS3QcplziHBkH2gfNGSQnrGm26XbAAvxK6HwQT9ZDG/CPFb8tzYzNSq
         zJwA==
In-Reply-To: <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steffen Klassert <steffen.klassert@secunet.com>, jreuter@yaina.de, razor@blackwall.org, Karsten Graul <kgraul@linux.ibm.com>, ivecera@redhat.com, Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, Xin Long <lucien.xin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Yajun Deng <yajun.deng@linux.dev>, Antoine Tenart <atenart@kernel.org>, richardsonnick@google.com, Heiner Kallweit <hkallweit1@gmail.com>, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

On Wed, Jun 8, 2022 at 3:58 PM David Ahern <dsahern@kernel.org> wrote:
>
> On 6/8/22 8:58 AM, Jakub Kicinski wrote:
> > IMO to encourage use of the track-capable API we could keep their names
> > short and call the legacy functions __netdev_hold() as I mentioned or
> > maybe netdev_hold_notrack().
>
> I like that option. Similar to the old nla_parse functions that were
> renamed with _deprecated - makes it easier to catch new uses.

I think we need to clearly document the needed conversions for future
bugfix backports.

Alternative would be to _backport_ the renaming for all stable versions ;)
