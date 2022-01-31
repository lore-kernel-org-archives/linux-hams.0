From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] ax25: add refcount in ax25_dev to avoid UAF bugs
Date: Mon, 31 Jan 2022 20:37:29 +0300
Message-ID: <20220131173729.GN1951@kadam>
References: <cover.1643343397.git.duoming@zju.edu.cn>
 <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=iqVY+LqOqw9FLPL140wR8K/FJe7A4UCXMQVUTTDmRiA=;
 b=qkd0+a8yOpATc4IaAda0uJfZ3vl6F7Jwk7fXltxokxEW230EJ+npCnR8UGughO0WGQcb
 EsjImPXonz0h7KS96KEIYdFDaGfA3rJIBmBZksZhEVH+0NUC3iTrNXq9lsfYUNNvjEMB
 dlz8ydfUB3HrbkTfT/OsYGimYtrsCB6N6eomySDcK1GeEQT7pG5ShyO5tjYAKD4XZXEd
 4Gb+yYqogiUPKOQEaPDGjlJBg8cXynV1I0ADxPyJCOEoPYq3SkfLxbzm98FOb3rV9Cd0
 HjMqChHdUGtKveQfyeykT6e6rUJlrGwZ0S8peijZfQqaYMdMeR4Gq9ofl2gAZZ2HjqYF mA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqVY+LqOqw9FLPL140wR8K/FJe7A4UCXMQVUTTDmRiA=;
 b=idHubIz+An6ZFKAgMlYSIeNaOvRQlPOGlLN491nG7ISrSOcqnkm22qvCqA9Npz37I7VUmisLz/pmLOC1dgeiQhCqKUyQbb4hcOJeKARWtEyJh/gGuN/0plOkWFGt++6PppEkmO/LvofLFBpx9zmRvlZt9y9QJ54SwrJsdrc12Lk=
Content-Disposition: inline
In-Reply-To: <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 28, 2022 at 12:47:16PM +0800, Duoming Zhou wrote:
> If we dereference ax25_dev after we call kfree(ax25_dev) in
> ax25_dev_device_down(), it will lead to concurrency UAF bugs.
> There are eight syscall functions suffer from UAF bugs, include
> ax25_bind(), ax25_release(), ax25_connect(), ax25_ioctl(),
> ax25_getname(), ax25_sendmsg(), ax25_getsockopt() and
> ax25_info_show().
> 
> One of the concurrency UAF can be shown as below:
> 
>   (USE)                       |    (FREE)
>                               |  ax25_device_event
>                               |    ax25_dev_device_down
> ax25_bind                     |    ...
>   ...                         |      kfree(ax25_dev)
>   ax25_fillin_cb()            |    ...
>     ax25_fillin_cb_from_dev() |
>   ...                         |
> 
> The root cause of UAF bugs is that kfree(ax25_dev) in
> ax25_dev_device_down() is not protected by any locks.
> When ax25_dev, which there are still pointers point to,
> is released, the concurrency UAF bug will happen.
> 
> This patch introduces refcount into ax25_dev in order to
> guarantee that there are no pointers point to it when ax25_dev
> is released.
> 
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

I pointed out a few bugs in my previous email.  I've had more time to
look at it now.

Basically you just want to audit all the calls sites which call
ax25_dev_ax25dev() and make sure all the error paths decrement.  Most
of them are buggy.  I'm testing a new Smatch check which is supposed to
detect these sorts of bugs.

I think the refcount in ax25_bind() needs a matching decrement.  Where
is that?  I don't know networking well enough to know the answer to
this...

> @@ -112,20 +115,22 @@ void ax25_dev_device_down(struct net_device *dev)
>  
>  	if ((s = ax25_dev_list) == ax25_dev) {
>  		ax25_dev_list = s->next;
> +		ax25_dev_put(ax25_dev);

It would be more readable to do ax25_dev_put(ax25_dev_list).  It's weird
to put ax25_dev here and then a couple lines later

>  		spin_unlock_bh(&ax25_dev_lock);
>  		dev->ax25_ptr = NULL;
>  		dev_put_track(dev, &ax25_dev->dev_tracker);
> -		kfree(ax25_dev);
> +		ax25_dev_put(ax25_dev);

Here

>  		return;
>  	}
>  
>  	while (s != NULL && s->next != NULL) {
>  		if (s->next == ax25_dev) {
>  			s->next = ax25_dev->next;
> +			ax25_dev_put(ax25_dev);

Same.

>  			spin_unlock_bh(&ax25_dev_lock);
>  			dev->ax25_ptr = NULL;
>  			dev_put_track(dev, &ax25_dev->dev_tracker);
> -			kfree(ax25_dev);
> +			ax25_dev_put(ax25_dev);
>  			return;
>  		}
>  

regards,
dan carpenter
