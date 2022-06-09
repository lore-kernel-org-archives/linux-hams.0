From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Thu, 09 Jun 2022 13:49:48 +0200
Message-ID: <b00ab3c4a12fb11ed95b2a4634e50e3cba10ec28.camel@redhat.com>
References: <20220608043955.919359-1-kuba@kernel.org>
         <YqBdY0NzK9XJG7HC@nanopsycho> <20220608075827.2af7a35f@kernel.org>
         <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
         <CANn89i+RCCXQDVVTB+hHasGmjdXwdm8CvkPQv3nYSLgr=MYmpA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654775396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DuwhD3TtwqmPc3FtJmMtruEqS+FysyJ1M2ttopTd4UE=;
        b=QXRwcZKUWlYp26MQSQFUIAlm65ZDBXdmXrWsmaS5F2jHuaUT47L/BKxBoJQUr41ngcOUZM
        Um0Cnof/UJpstY+ynQi+cVLYrOFSHOAf+w0b2k8GEpDCJWbh5SsU0wATWMlh7XatWTcybt
        s+fFlDtEIowMKHBHPuB3p371xf6uoYw=
In-Reply-To: <CANn89i+RCCXQDVVTB+hHasGmjdXwdm8CvkPQv3nYSLgr=MYmpA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Dumazet <edumazet@google.com>, David Ahern <dsahern@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, jreuter@yaina.de, razor@blackwall.org, Karsten Graul <kgraul@linux.ibm.com>, ivecera@redhat.com, Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, Xin Long <lucien.xin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Yajun Deng <yajun.deng@linux.dev>, Antoine Tenart <atenart@kernel.org>, richardsonnick@google.com, Heiner Kallweit <hkallweit1@gmail.com>, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

On Wed, 2022-06-08 at 16:00 -0700, Eric Dumazet wrote:
> On Wed, Jun 8, 2022 at 3:58 PM David Ahern <dsahern@kernel.org> wrote:
> > 
> > On 6/8/22 8:58 AM, Jakub Kicinski wrote:
> > > IMO to encourage use of the track-capable API we could keep their names
> > > short and call the legacy functions __netdev_hold() as I mentioned or
> > > maybe netdev_hold_notrack().
> > 
> > I like that option. Similar to the old nla_parse functions that were
> > renamed with _deprecated - makes it easier to catch new uses.
> 
> I think we need to clearly document the needed conversions for future
> bugfix backports.
> 

To be on the same page: do you think we need something under
Documentation with this patch? or with the later dev_hold rename? or
did I misunderstood completely?

Thanks!

Paolo

