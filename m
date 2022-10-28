From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Fri, 28 Oct 2022 16:43:14 +0300
Message-ID: <Y1vccrsHSnF1QOIb@kadam>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=eXv9YJ5eXRP8/vI4rh7TXd1Y+o6j0LOlhfNS4Ph0eck=;
 b=OiFl9tq54dThlOm9j4tJA56hlzj8ztJ5Z7mMRlwU2LYjHWuPA8iA1M2+NIqQHeBR7Dp4
 RQvghTkgtZZ1S+onFkF7bNytp4Q12OoP/IbA7zwKCIv79tgISL8wj2CDDqjm4c87EW6/
 H3+I4czhWL/P50YqoMHvBUd1UCWDrxBqqh5nxGLkuQC978ja6muAuzdbEHt1V+Qp/HxM
 Oy+2s7NAtqOy+DIq1cvYaSjULHKbIJxK8NGdG7ynSaOEtUFgCfuYvUnoP0ZdSjiJ0luF
 6ELG0oip2GLIpGiElZc6QLvsWpUyAqmCQpTUpxIlivQcyRDTQmBF16WNvFmEmuAd6YBn gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXv9YJ5eXRP8/vI4rh7TXd1Y+o6j0LOlhfNS4Ph0eck=;
 b=ZvvHVjBCfb8XSDgHF9QrpNsgCo8HHuY4U213da0haTd8bhlkT9qR2hIXyGCF6irECCCQj1jfYrtzT5Pd1T2LQPgpggry0wMyQZOp0tIEfFjzclp+fs6xLXIwbptXDx/xyVF8NBvi6HLR6YKKDdSqat0Kl+9fRYVGIutTkjz9Ddw=
Content-Disposition: inline
In-Reply-To: <47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub =?utf-8?B?S2ljacWEc2tp?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Fri, Oct 28, 2022 at 08:13:49PM +0700, Bagas Sanjaya wrote:
> On 10/27/22 05:42, наб wrote:
> > Since defanging in v2.6.12-rc1 it's set exactly once per port on probe
> > and checked exactly once per port on unload: it's useless. Kill it.
> > 
> 
> What do you mean by defanging in that release?

I was also curious about this, but I accidentally sent my question
privately instead of to the list.

> 
> Also, s/Kill it/Remove BAYCOM_MAGIC from magic numbers table/ (your
> wording is kinda mature).
> 

The kernel has almost 13 thousand kills...

$ git grep -i kill | wc -l
12975
$

It's fine.

regards,
dan carpenter

