From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom on kernel version 3.9.6-200
Date: Fri, 05 Jul 2013 22:33:53 -0700
Message-ID: <51D7AC41.6060606@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51D7A082.1000500@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

On 7/5/2013 9:43 PM, Cathryn Mataga wrote:
> On 7/5/2013 9:19 PM, Cathryn Mataga wrote:
>> Hmm, is netrom known to work?  I'm on 3.9.6-200, and I'm getting 
>> weird results with netrom.
>>

Wait, wait, this is definitely a Fedora issue and not a kernel issue.  
Because I copied in nrattach that I compiled myself and it started 
correctly.   (I don't think it's a 'old versions of libax25 lying around 
issue'  but I haven't completely ruled that out yet.)

>
>  Jul  6 00:37:31 hamradio kernel: [   50.626653] NET: Registered 
> protocol family 6
> Jul  6 00:37:31 hamradio NetworkManager[599]: <warn> 
> /sys/devices/virtual/net/nr0: couldn't determine device driver; 
> ignoring...
> Jul  6 00:37:31 hamradio NetworkManager[599]: <warn> 
> /sys/devices/virtual/net/nr1: couldn't determine device driver; 
> ignoring...
> Jul  6 00:37:31 hamradio NetworkManager[599]: <warn> 
> /sys/devices/virtual/net/nr3: couldn't determine device driver; 
> ignoring...
> Jul  6 00:37:31 hamradio rc.local[987]: Logging in as gateways ... 
> NET/ROM port netrom bound to device nr0
> Jul  6 00:37:31 hamradio NetworkManager[599]: <warn> 
> /sys/devices/virtual/net/nr2: couldn't determine device driver; 
> ignoring...
> Jul  6 00:37:31 hamradio rc.local[987]: NET/ROM port netrom2 bound to 
> device nr0
> Jul  6 00:37:31 hamradio rc.local[987]: netromd: no NET/ROM ports defined
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

