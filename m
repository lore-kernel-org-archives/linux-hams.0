From: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Sat, 14 Aug 2021 00:32:00 +0300
Message-ID: <dfe66a37-e152-8eb7-58f5-1a76b468188d@gmail.com>
References: <20210813145834.GC1931@kadam>
 <20210813151433.22493-1-paskripkin@gmail.com> <20210813210922.GD1931@kadam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZroxT+1zrcdLvkSmpj3NhUUaHoy8N2LACzKCDfGFUis=;
        b=gpL0cZMuWVgE9dHkvVJLTs6Jp0EWLgRzxijbpo5n4SBeyBl1b5YC3D+zMLlgRCv0pd
         6xJ2yW912DE5Aao3QEByetim+FBja+79WeCq5txY+cy5SocBiu9YZYS9rEKuP03JNH+E
         F55UONr7x/ONSdTa0pu+bT22mIRMDIGlcuJ71Mxv4YI9y3gJj2Hfo+B1S8bzi/zpMHze
         400l0M5eBbH1l8KESWs9GNbWTQ6eR7v2IdC8AAdShFM197ixgL0RsKCaUvy6aHg7lG24
         SL74aPMKCX+WsdVHvH3ENJw4EvdUsFdXs/dUMOG/qMXGaOBbeNJqU5SVV6DqvTRpY/3U
         NKEw==
In-Reply-To: <20210813210922.GD1931@kadam>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On 8/14/21 12:09 AM, Dan Carpenter wrote:
> Great!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Thank you, Dan!


With regards,
Pavel Skripkin
