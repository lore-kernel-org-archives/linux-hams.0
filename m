From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] netrom: fix invalid use of sizeof in nr_recvmsg()
Date: Tue, 9 Apr 2013 11:05:20 +0800
Message-ID: <CAPgLHd_Xty8giagdEBQDa6rUvG4jVTut8P9vYv0ywyVYF6=9NQ@mail.gmail.com>
References: <CAPgLHd-yEmt_BJ52uZNsCA_-w85VhnN_HbfjG1QLVvR5kp7Xvw@mail.gmail.com>
	<20130408.224905.1206528635530811269.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=OdvWNbRHQ51jYqHbmSKGrnNoi/2+SjQxdYrQs+ymMnY=;
        b=z9cbUcRHUgcsnYi9GQfPNR9Qtx/ldDzlKs+7eYaTH0q2JeWo2zUH+AMziSNkqcCZsp
         a/TDBkiPzIJDwTtUXiI9QzMvMxtT/oq2AZQP8ppV8t17orubGu6GG1X9R4VK0dQtfC8H
         ZUi99z4RZogRErteCfJNDBIjCXqZzKm5dMbCYs54Pn7ZJSchn2+OhqQJKivK4YtlpQ0T
         jH+PZLUNR8FsOQ/VFY2xHl1caEmHcbr708VglIl13ZykiRa9Xy/DHKuYkp+znH6i0g+7
         UeVzh5Zb2ajICY8m1znWg2E8Ow21dPRP8e9CeGpKeUxni2yztz6o+ZTNJ0RSN/aX+sT7
         BZCw==
In-Reply-To: <20130408.224905.1206528635530811269.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: ralf@linux-mips.org, minipli@googlemail.com, yongjun_wei@trendmicro.com.cn, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On 04/09/2013 10:49 AM, David Miller wrote:
> From: Wei Yongjun <weiyj.lk@gmail.com>
> Date: Tue, 9 Apr 2013 10:07:19 +0800
>
>> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>>
>> sizeof() when applied to a pointer typed expression gives the size of the
>> pointer, not that of the pointed data.
>> Introduced by commit 3ce5ef(netrom: fix info leak via msg_name in nr_recvmsg)
>>
>> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> Any particular reason you're:
>
> 1) Targetting the wrong tree.  This was a bug fix that went into
>    'net', therefore targetting -next is not correct.  This fix
>    need to go into 'net'.


I found this from the linux-next.git tree, but this commit is not exists
at linux.git tree, and I forgot to check net.git, sorry for that.
I will pay more attention next time.


>
> 2) Not even bothering to CC: the person whose change you are
>    correcting?
>
> Anyways, applied to 'net', thanks.
>
>
>

