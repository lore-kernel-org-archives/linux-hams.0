From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next] ax25: Fix deadlock caused by skb_recv_datagram
 in ax25_recvmsg
Date: Fri, 10 Jun 2022 11:10:43 +0300
Message-ID: <20220610081043.GB2146@kadam>
References: <20220606162138.81505-1-duoming@zju.edu.cn>
 <CANn89i+HbdWS4JU0odCbRApuCTGFAt9_NSUoCSFo-b4-z0uWCQ@mail.gmail.com>
 <E5F82D12-56D3-4040-A92B-C658772FD8DD@osterried.de>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=AMsjRJcrLyPsDc31mIm9J00joV6EQz9iYY3opP4QBXs=;
 b=NkL2RJUX4NsEwMA7YAO/2eyao/gG3RO8Gs1UXHpBAWVCgdbWJ/CTcWzMk1SXruh8vPeF
 yCBEb9K2Hejpg8JRBhQRdOcnWzKKxjPAFVJJccxPBX7HDBvjvx0Iq6diQzGqJgNt5xiY
 OkxtiaoVpYmKXRIQ2D6gCJUpjlx7hSmAkMBdwHPSL0OP4a+2xwI4a6TUhcff8HyuTCjF
 g9F4sjPpNbGbyU56TJOpM3c3TC3Hrv41KTRASIERE/kcUrhhOVSeGtzrECwM64muwC+O
 jNFJk8GiWhktM6wDXabaueNF/Z3EZOW4UdiNak/WzczKr0kN/9qztcob96o3nZk4JwiU DQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMsjRJcrLyPsDc31mIm9J00joV6EQz9iYY3opP4QBXs=;
 b=vP2Yizf3DZe3BGxDrD+pnoezJ3iCzEVMJruPkS82Fob2l9g1EOJXz0s4XpfJZVZEKYXFQCvDo7YQLxsTMP5fkxsYjmWHNmtU8lINL/ST842f2r3iVeNnmWm5y+CgAgwNkK45DGy3hZZfwaNkCbkQm2IrJ6VpPVyOlmwjY6PQ9VE=
Content-Disposition: inline
In-Reply-To: <E5F82D12-56D3-4040-A92B-C658772FD8DD@osterried.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>
Cc: Eric Dumazet <edumazet@google.com>, Duoming Zhou <duoming@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, jreuter@yaina.de, Ralf =?iso-8859-1?Q?B=E4chle?= DL5RB <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, linux-hams@vger.kernel.org

On Tue, Jun 07, 2022 at 11:14:34AM +0200, Thomas Osterried wrote:
> > Why is this targeting net-next tree ?
> 
> Off-topic question for better understanding: when patches go to netdev,
> when to net-next tree? Ah, found explanation it here (mentioning it
> for our readers at linux-hams@):
>   https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt
> 
> > 1) A fix should target net tree
> > 2) It should include a Fixes: tag
> 
> tnx for info. "Fix" in subject is not enough?
> 

A Fixes tag says when the bug was introduced.

regards,
dan carpenter

