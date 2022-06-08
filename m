From: David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Wed, 8 Jun 2022 16:58:08 -0600
Message-ID: <f263209c-509c-5f6b-865c-cd5d38d29549@kernel.org>
References: <20220608043955.919359-1-kuba@kernel.org>
 <YqBdY0NzK9XJG7HC@nanopsycho> <20220608075827.2af7a35f@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654729091;
        bh=7b2L2H8ucBg4c9J7v/FFroooKt+KN2n9czhTLRJEah8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Jz1KTWNYdOcojfE5YoGaeusea4ZhdHgAC7LJS4WIrIYaC+RdF+1jwH4EUUBv1fqlA
         7oTc0thaYL+c47XbH9G2pG3KbitUz1a4yxB3lY+O1KKGr6jl3LTmrzhoTujAq9UREJ
         ijIhzU0tkhY05rgH0NwIvH27u16ODLs0T+Kz52ZIwChg3IvtisR2Q3uyMLFOaZoROd
         wjQdcRTZpgeukMpCB1GFIcSwX3fAsDxP+IPIH9BUsBWU9SPkSBQwtAkDrS8aXrnJtX
         D+hYUlDtXP90tRdx+HhNkYB5uo9iFhNK61iKaWZiUXwTB2fewSTjjdgXZOKEgWUr35
         HOXBpzwvDRGLA==
Content-Language: en-US
In-Reply-To: <20220608075827.2af7a35f@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, steffen.klassert@secunet.com, jreuter@yaina.de, razor@blackwall.org, kgraul@linux.ibm.com, ivecera@redhat.com, jmaloy@redhat.com, ying.xue@windriver.com, lucien.xin@gmail.com, arnd@arndb.de, yajun.deng@linux.dev, atenart@kernel.org, richardsonnick@google.com, hkallweit1@gmail.com, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

On 6/8/22 8:58 AM, Jakub Kicinski wrote:
> IMO to encourage use of the track-capable API we could keep their names
> short and call the legacy functions __netdev_hold() as I mentioned or
> maybe netdev_hold_notrack().

I like that option. Similar to the old nla_parse functions that were
renamed with _deprecated - makes it easier to catch new uses.
