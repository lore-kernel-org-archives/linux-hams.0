From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 02/15] hamradio: yam: remove YAM_MAGIC
Date: Fri, 28 Oct 2022 16:44:40 +0300
Message-ID: <Y1vcyJKhZDA2/xlR@kadam>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <e12d4648a757b613a2ecf09886116900fba1c154.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <4e7726a2-a631-642f-e8f5-c97ff3fc689f@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=RQqcyoE/SAVprigXGWr01L3rDFRoZ/ZocOD+zw6+8/4=;
 b=f2S2rzkT+zWDZ5zGfvkeuHq4RwlIN1JqvRFzbiM6DZnW8PnYLthF3Q3mImWT0gyj5e6R
 v47hb9WoL83ZQ751GF+6wGda/sjhkK3FeLuf5miVoKBGQmssvo0TOWNe1CRU0ztyNLWI
 ht7J/Hce07gxAVTCDrhGeF/vGV5OpLR54kfUX3eE9kjUYkZsRUih9JoOLdQf/WBXWZAi
 nLnyxI2uUEybtUPZqx3wWkdI+qI9t96Xh+hr783HfyxxFIRrBI3xcueVYcQgLn69JGGY
 pEzXr/ynQ/HuvWHqMgLFUTYBGdYPSbXI5xg7NrbXLi8vbrvWptpK3jO1Ig7YVqT9OQ1F EA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQqcyoE/SAVprigXGWr01L3rDFRoZ/ZocOD+zw6+8/4=;
 b=orLUjPNcAxCJKaetsw02n5SjdBMavyixBwc2fXx1dbXgeXQlPXEk5LPeSS67Bqp1mew/XScwNykVT0GHm4eWjbSSeTvEKAF0BHMkq7q06osDwX/6d2m3ZIKuZnsOR8SaUqohPyVIu2dT7t91Smec8vxKMLEEr6V2PGW1uDo01nM=
Content-Disposition: inline
In-Reply-To: <4e7726a2-a631-642f-e8f5-c97ff3fc689f@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Jean-Paul Roubelat <jpr@f6fbb.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub =?utf-8?B?S2ljacWEc2tp?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Fri, Oct 28, 2022 at 08:19:51PM +0700, Bagas Sanjaya wrote:
> On 10/27/22 05:42, наб wrote:
> > This is cruft, and we have better debugging tooling nowadays: kill it
> > 
> 
> That "mature phrase" again? Same reply as [1]. Thanks.
> 
> [1]: https://lore.kernel.org/linux-doc/47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com/

This is just a link to your previous email which we just recieved...  :/

regards,
dan carpenter

