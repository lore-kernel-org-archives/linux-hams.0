From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net] ax25: use after free in ax25_connect
Date: Fri, 14 Jan 2022 07:19:56 -0800
Message-ID: <8fc4701f-c151-0545-c047-a5df90575d69@gmail.com>
References: <20220111042048.43532-1-hbh25y@gmail.com>
 <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
 <f48850cb-8e26-afa0-576c-691bb4be5587@gmail.com>
 <571c72e8-2111-6aa0-1bd7-e0af7fc50539@gmail.com>
 <80007b3e-eba8-1fbe-302d-4398830843dd@gmail.com>
 <ff65d70b-b6e1-3b35-8bd0-92f6f022cd5d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9qFR11nHm+mhLAm3o9SpfomQXzxlqFjZg2rE8HQK518=;
        b=EKlgr34LKZ98bPASCBMZGjdPQDoh5Eg4rIu8TfP0G8iiYVTKmaX0lhr36pnp3ey/j1
         CDS/je9FWYN3bieeoqUXTWKj8QAsgu1tzHapYnFBxB5PfsbmdCAqo6+WWJTIAsMWCmRc
         VIAgLy9pzAH10q3QWBr7CHz7s4+duuq1KQPryh2wXce0TYfP+5tL1YlkVZqyYV73/vhR
         05i4ax74+8oqKViVOdNlTPmW2S0Ps8zLRyoVINGStPrnOHtvw58ssKjYGE0yewKzupQm
         eirsDOJ+1UTBTiPQfvNJK95IpaiYcL9Gcm/M44157vWtiMmhSJwQbkXJd3pKmbq7d933
         yy6A==
Content-Language: en-US
In-Reply-To: <ff65d70b-b6e1-3b35-8bd0-92f6f022cd5d@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hangyu Hua <hbh25y@gmail.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


On 1/13/22 22:54, Hangyu Hua wrote:
> Any suggestions for this patch ? Guys.
>
> I think putting sk_to_ax25 after lock_sock(sk) here will avoid any 
> possilbe race conditions like other functions in ax25_proto_ops. CTING) {
>

As explained, your patch is not needed.

You failed to describe how a race was possible.

Just moving code around wont help.

How about providing a stack trace or some syzbot repro ?

