From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Wed, 8 Jun 2022 20:29:34 -0700
Message-ID: <20220608202934.6412b843@kernel.org>
References: <20220608043955.919359-1-kuba@kernel.org>
        <YqBdY0NzK9XJG7HC@nanopsycho>
        <20220608075827.2af7a35f@kernel.org>
        <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654745376;
        bh=xoMdLg4homzX7FWVt3xib9e6tyLXTnBCuXHzsxIdiYU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SHTS45FZ1e4NdsSWYZaoPM01p8VvTFdnfmSUye57UgA/nGXzngjzNW5OJKi9+bzdM
         ZLMVnGAjbJ0MJovWKA6sdWs43dW9D3xJ1N7BKP+3KHhaDhGQsIHU/yEA/Ebw0HA6xH
         CjK+CajEOkREWLliuvGmu0pLv10rr4kQjGAPn8SqqX8yTpKEHtkmHzueLCgocozA1c
         Xu9141RD4pF85Sb56qROkM5WSUzdibeFV6UCKgQA87edE8NPNX3imSUDKbfSEleUqX
         9Rm6dfZR3qO/Me8hvV+wMhVXs8okdyoJCdlYUhy9utNGqKj1d2If2fbqsDsVvXUEBL
         hCkr/Khg1eYlQ==
In-Reply-To: <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ahern <dsahern@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, steffen.klassert@secunet.com, jreuter@yaina.de, razor@blackwall.org, kgraul@linux.ibm.com, ivecera@redhat.com, jmaloy@redhat.com, ying.xue@windriver.com, lucien.xin@gmail.com, arnd@arndb.de, yajun.deng@linux.dev, atenart@kernel.org, richardsonnick@google.com, hkallweit1@gmail.com, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

On Wed, 8 Jun 2022 16:58:08 -0600 David Ahern wrote:
> On 6/8/22 8:58 AM, Jakub Kicinski wrote:
> > IMO to encourage use of the track-capable API we could keep their names
> > short and call the legacy functions __netdev_hold() as I mentioned or
> > maybe netdev_hold_notrack().  
> 
> I like that option. Similar to the old nla_parse functions that were
> renamed with _deprecated - makes it easier to catch new uses.

Well, not really a perfect parallel because _deprecated nla has to stay
forever, given it behaves differently, while _notrack would hopefully
die either thru conversion or someone rightly taking an axe to the
cobwebbed code.

Either way, I hope nobody is against merging the current patch.
