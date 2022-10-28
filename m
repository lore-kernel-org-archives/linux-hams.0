From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Fri, 28 Oct 2022 20:50:59 +0700
Message-ID: <61febb47-28a4-3343-081c-4c06b87ba870@gmail.com>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com> <Y1vccrsHSnF1QOIb@kadam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVR7uLVEIb14+gIUsjABrQEQi2BsRftXIio3cVFwFYQ=;
        b=mXLZFNyNtymeMlvxGAoMhzfwbQyjIXXXM12ojwNCUV47agltlck9ZxdWTShPILGCsY
         Ok4eyCLHrcgI7cYTvova61YIGnDsbhuX/RJE6FBKRTDBBl8v6UVyt7ffZapDkrrYeVoK
         TQZz/dTXzN70mxdy81R03x6s/+TuFsXGg5KnmIdPnnt6JL7/eS0kST4ARj8HfFSvrFGe
         FGyoANksj/IVaF8tYRYBXPusInU6OA1MmCr645RD0636ynWrmZAZPtAmkHkENzJrX4sS
         WLITgHitn4SIUWIlxGaZRuuSVM2kZptNwenCN4S6DufjZg7Jc33vFjoqRhOeFZeQkWCI
         jnjA==
Content-Language: en-US
In-Reply-To: <Y1vccrsHSnF1QOIb@kadam>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Jakub_Kici=c5=84ski?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On 10/28/22 20:43, Dan Carpenter wrote:
>>
>> Also, s/Kill it/Remove BAYCOM_MAGIC from magic numbers table/ (your
>> wording is kinda mature).
>>
> 
> The kernel has almost 13 thousand kills...
> 
> $ git grep -i kill | wc -l
> 12975
> $
> 
> It's fine.
> 

The word meaning depends on context. In this case, the author means
removing SOME_MAGIC magic number from the table, one by one until
the magic number documentation is removed (due to historical cruft).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

