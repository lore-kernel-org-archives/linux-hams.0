From: Firo Yang <firogm@gmail.com>
Subject: Re: [PATCH] hdlcdrv: fix divide error bug if bitrate is 0
Date: Wed, 17 May 2017 21:42:46 +0800
Message-ID: <20170517134246.GA24874@snow>
References: <20170517123549.22659-1-firogm@gmail.com>
 <591C493B.6060908@bfs.de>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9CJehhRuZ04a5vMU8uoIrLkQpuXot371nMGmX7dfy3w=;
        b=rvLZRlZaMVptM+qkQ4XD4fXuhmbfvmno6yv6tWRZ/YiKD/CivFfE/yIT2KaRIQEzXU
         xSYK/08yPMwe9s6roM2YxOH01vKuCgIb8RiqOWk9utnlwQC50KAljv09XAkTOtRKJYn0
         vmpZf8xoZjPXsbJC/8m2WjHJTz03G6f6KnzM3oXEYCKOR35E1/ka+to4BABJvP1gXqAj
         qxjFtZ3Fzdotzgv4fcNLPTcWUcrGJZr6f0UJcHmFXIXheLIO6ZMG5qWJTyncMydgo1j6
         bXAcdXO0u22DDgp/UyEGKwu0R/+zko3OtYVIP/46N4VUeMKP38ye9YOSin74wkDsN1nd
         hjhg==
Content-Disposition: inline
In-Reply-To: <591C493B.6060908@bfs.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: t.sailer@alumni.ethz.ch, davem@davemloft.net, gregkh@linuxfoundation.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, dvyukov@google.com, syzkaller@googlegroups.com

On Wed, May 17, 2017 at 02:59:39PM +0200, walter harms wrote:
>
>
>Am 17.05.2017 14:35, schrieb Firo Yang:
>> The divisor s->par.bitrate will always be 0 until initialized by
>> ndo_open() and hdlcdrv_open().
>> 
>> In order to fix this divide zero error, check whether the netdevice
>> was opened by ndo_open() before performing divide.
>> 
>> Reported-by: Dmitry Vyukov <dvyukov@google.com>
>> Signed-off-by: Firo Yang <firogm@gmail.com>
>> ---
>>  drivers/net/hamradio/hdlcdrv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
>> index 8c3633c..3c783fd 100644
>> --- a/drivers/net/hamradio/hdlcdrv.c
>> +++ b/drivers/net/hamradio/hdlcdrv.c
>> @@ -574,7 +574,7 @@ static int hdlcdrv_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
>>  		break;		
>>  
>>  	case HDLCDRVCTL_CALIBRATE:
>> -		if(!capable(CAP_SYS_RAWIO))
>> +		if (!capable(CAP_SYS_RAWIO) || !netif_running(dev))
>>  			return -EPERM;
>>  		if (bi.data.calibrate > INT_MAX / s->par.bitrate)
>>  			return -EINVAL;
>
>I would still check for s->par.bitrate > 0 later changes may affect the setting of it
>and it is much more obvious.

I think 0 is not valid value for bitrate, so we should check it in
other places, like what ser12_open() did:
429         if (bc->baud < 300 || bc->baud > 4800) {
430                 printk(KERN_INFO "baycom_ser_fdx: invalid baudrate "
431                                 "(300...4800)\n");
432                 return -EINVAL;
433         }
...
440         bc->hdrv.par.bitrate = bc->baud;

>
>Also perhaps !netif_running(dev) should better return ENODEV.

However, the 'dev' truly exists in this circumstance.

Thanks,
Firo

>
>
>just my 2 cents,
>re,
> wh
>
