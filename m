From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Thu, 9 Jun 2022 06:53:21 -0700
Message-ID: <CANn89iLzAY1FAJASwrDcV9xB8UvhPAWfuFsjfiRiu1F9Tu0ciA@mail.gmail.com>
References: <20220608043955.919359-1-kuba@kernel.org> <YqBdY0NzK9XJG7HC@nanopsycho>
 <20220608075827.2af7a35f@kernel.org> <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
 <CANn89i+RCCXQDVVTB+hHasGmjdXwdm8CvkPQv3nYSLgr=MYmpA@mail.gmail.com> <b00ab3c4a12fb11ed95b2a4634e50e3cba10ec28.camel@redhat.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxk3erEnK6X8l1h+c5LR7dYudSNnktRPy2YkDiUavZk=;
        b=bf+4vrjXiHJ31KIu4Gn9fz0kzCJfCOU1lBmNIi3MPCYOGfE+K+yZz1oe4L1g+wVUzE
         LNi2rjTseY7kRuZiBASR8T18LSqHIttiHYhOXHbfJASuY4nO5P0MjXUPUy+4QXCqQ7fC
         zgGR+NTJmwqnmycnN0CYnqt72iPvh/9kRB7iy+1bF6srWKu1VG90EwBAsbXMKIVy9p8s
         0S72jwsSQeSoBdx+gWSUIeOzQfx5ouizQ1XoVOqAo3zD+FDIH5a9G048GwSJhTs2GoOC
         00B1oEzBvVvfgVWdJ9rXYDIVasCp7iBVzWF92aj83aQp+MbBwJyDHHrCC5LeDJn91mm1
         bL7A==
In-Reply-To: <b00ab3c4a12fb11ed95b2a4634e50e3cba10ec28.camel@redhat.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Abeni <pabeni@redhat.com>
Cc: David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, jreuter@yaina.de, razor@blackwall.org, Karsten Graul <kgraul@linux.ibm.com>, ivecera@redhat.com, Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, Xin Long <lucien.xin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Yajun Deng <yajun.deng@linux.dev>, Antoine Tenart <atenart@kernel.org>, richardsonnick@google.com, Heiner Kallweit <hkallweit1@gmail.com>, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

On Thu, Jun 9, 2022 at 4:50 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On Wed, 2022-06-08 at 16:00 -0700, Eric Dumazet wrote:
> > On Wed, Jun 8, 2022 at 3:58 PM David Ahern <dsahern@kernel.org> wrote:
> > >
> > > On 6/8/22 8:58 AM, Jakub Kicinski wrote:
> > > > IMO to encourage use of the track-capable API we could keep their names
> > > > short and call the legacy functions __netdev_hold() as I mentioned or
> > > > maybe netdev_hold_notrack().
> > >
> > > I like that option. Similar to the old nla_parse functions that were
> > > renamed with _deprecated - makes it easier to catch new uses.
> >
> > I think we need to clearly document the needed conversions for future
> > bugfix backports.
> >
>
> To be on the same page: do you think we need something under
> Documentation with this patch? or with the later dev_hold rename? or
> did I misunderstood completely?

Adding instructions in the comments describing the functions would probably help
stable teams (or ourselves because they will ask us to take care of conflicts)

And backport the dev_put()/dev_hold() rename to kernels without
CONFIG_NET_DEV_REFCNT_TRACKER infra.

s/dev_put()/netdev_put_notrack()/
s/dev_hold()/netdev_hold_notrack()/
