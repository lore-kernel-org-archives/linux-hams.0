From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Date: Mon, 23 May 2022 16:52:14 +0300
Message-ID: <20220523135214.GE4009@kadam>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XU6EWtQvx4X2CHADKoH5Cv47UCW1J3WsLcmQ2JXKfjU=;
 b=SZ1xjSlQhBmlLppTldDeI67hA+O7HWNVayUTul8FdyDKNhA/GAYcO3rvChGud5RzkMky
 wi1W2T3EB0F8+C9GE1PNw3RbDOFWEIVzDZiaWGkyqm62t/kV2KrQLV2XM1uYt7eV9gE/
 1SeccaA0lDpZ3T5cjIGErC77b/Ku+bzGOEkwFlrZ+FCy+KZdeC575Crrg2VChssZn2wC
 ey1YlmdKexIfHucrRaSYNPAF0yR0y9Guji0ONumhQCUrA9w/+l0/WfyCVP6GZJAIRBU+
 jD8NwzThoXlwGSrQUU2Xg9uW7f+g2TZiHonSZwCkNwH5A0hwQSU5IheLs9KugftYOKaZ 9Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6EWtQvx4X2CHADKoH5Cv47UCW1J3WsLcmQ2JXKfjU=;
 b=i9O65XcBrIPNHnSb2UGs0bhZdro4nbj7I4Wc/183WvkuBRglOLzTckGOcv4a4CElPqUM8r/IxoE3RQ1p2NDM9uWM9WjS/L1S/ilSA80abCO5KaRP/inL1tSSYeZwLLDvq6zstNyybPatf9x4E4jge9I6KFeIIQ13ag37VAiLDyM=
Content-Disposition: inline
In-Reply-To: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>

On Mon, May 23, 2022 at 07:46:57AM +0200, Thomas Osterried wrote:
> 
> Regression due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0 "ax25: Fix UAF bugs in ax25 timers",
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/af_ax25.c?id=82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
> and discussion about necessarity of
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/ax25_subr.c?id=fc6d01ff9ef03b66d4a3a23b46fc3c3d8cf92009
> (because it addresses the same problem).
> 
> 
> Due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc, any ax25 session is cleaned up anymore on disconnect.
> -> netstat --ax25 shows the ex-connected session it in state "LISTEN". Makes ax25 unusable in a production environment.
> => Regression.

Please line wrap your emails at 75 characters.

I tried to apply your patch but the format is wrong...  :/

Hopefully Duoming will read this message but the sad truth is that no
one likes to read RFC patches so you'd be better off sending this as
a real patch instead.

regards,
dan carpenter

