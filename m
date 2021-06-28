From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/3] Remove dead linux-mips.org references
Date: Mon, 28 Jun 2021 09:28:46 +0800
Message-ID: <3fd473be-011b-7cb2-8356-045e5265ea0a@flygoat.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2106251722470.37803@angie.orcam.me.uk>
 <4c3900ab7d9493e3ce516d3f03ed1de17c1fcb10.camel@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=T
        F6xgqJW9aa0I1y93nwwqu4DjE6A5nIJGCY4aXMnpwQ=; b=YGNi3DTZucJpPAtQa
        zTb9SO+9sxW96s3gX3Zl1ppZRkMtjjTnxUeJVeTJ2JOY60qqo8top4oDQKmGzrbC
        SvkTM5UhAuHcIvuPQIft1Gx2RTkwWst/xBrDrvXsZbXT7krAdIJz4k3vvl6qOWYP
        CC4Ur3bzwA2LVj51u4OO/CLukSEFq7+vvsqYbzfl9PnqJ1H4/5bo5an2UI+ssdww
        LOXQtaPCgPIcCEcklesbvxTi9miFgAL6DUVSG2lVX/LVb57T8UyR72J99wsDsC8d
        elJvdHPdFyeJZGym7wUEP3CffuuUcbRFbtXDjK9MHB2/0iN/mpwIMdU28fEtSWq+
        heWPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=TF6xgqJW9aa0I1y93nwwqu4DjE6A5nIJGCY4aXMnp
        wQ=; b=KkKxBqEH3LtQR9HDiC5ayysitWoP9I4E9HPg6LFUI06F06/hBO5T0Xayp
        ZcduWXL3sqtW/oM8GmRM5x5yILpQAa/6U4+4kuYk/zw4kAEhCbSI99iisSQJF6iu
        9nRmjNpUBFc67/dmo3lJ/cyuUtyhXXEnWEiKMG6WI+uMkrxIJ4+PdBD8AMjNNu/V
        A3QLXgcE2KxuMI5QEQJ1DxQJFIPfdd9QSX0Dw7bs0h/6e8uApq6oKnZOKwxcDNv7
        YdehWcuuypmHESkF+Wzot1/z2OJrNKGq61GfFp7M1UijbXs+pxTMUJNukfp4j5um
        +AU5Qpalc3r/RoU193Og1ebclNUqg==
In-Reply-To: <4c3900ab7d9493e3ce516d3f03ed1de17c1fcb10.camel@perches.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Joe Perches <joe@perches.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kurt Martin <kmartin@wavecomp.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


在 2021/6/27 上午7:45, Joe Perches 写道:
> On Fri, 2021-06-25 at 17:49 +0200, Maciej W. Rozycki wrote:
>> [Adding Ralf and Kurt to the list of recipients.]
>>
>> On Fri, 25 Jun 2021, Lukas Bulwahn wrote:
>>
>>> The domain lookup for linux-mips.org fails for quite some time now. Hence,
>>> webpages, the patchwork instance and Ralf Baechle's email there is not
>>> reachable anymore.
>>   Well, mail forwarding has now been set up for my old LMO address, and so
>> I believe for Ralf's.  Any other resources remain unavailable.
>>
>>> In the discussion of that patch series, Kurt Martin promised to get
>>> linux-mips.org back online. Four months have now passed and the webpage is
>>> still not back online. So, I suggest to remove these dead references.
>>> Probably, we do not lose much if the linux-mips.org webpage never comes back.
>>   While most resources have been migrated I think the wiki was unique and
>> valuable.  Perhaps we could preserve read-only references to archive.org
>> dumps?  It's not clear to me what our policy is here though, if any.
> Perhaps better to wholesale copy the content and keep it
> around somewhere else like lore.kernel.org.

I made a request to kernel.org infrastructure team to create a wiki site 
for linux-mips project

to restore contents from old linux-mips.org back in April. I think that 
would be another approach

as I saw PA-RISC migrated their wiki site to kernel.org as well.


Thanks.


- Jiaxun


>
>
