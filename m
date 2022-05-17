From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH net-next] ax25: merge repeat codes in
 ax25_dev_device_down()
Date: Wed, 18 May 2022 00:38:37 +0200
Message-ID: <YoQj7eND7/2KSBFs@x-berg.in-berlin.de>
References: <20220516062804.254742-1-luwei32@huawei.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220516062804.254742-1-luwei32@huawei.com>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Wei <luwei32@huawei.com>
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

three comments.


1. We need time for questions and discussions

In the past, we had several problems with patches that went upstream which
obviously not have been tested.
We have several requests by our community at linux-hams, that we need
to have a chance to read a patch proposal, and have time to test it,
before things become worse.


2. Due to some patches that went in the current torwalds-tree, ax25 became
unusable in a production environment (!).

I'll come to this in another mail, with description and proposal for a fix.
We are currently testing it and like to send it on linux-hams with request
to comment and test.


3. About this patch for ax25_dev_device_down() which reached netdev-next:

Looks good regarding the changes.

But when looking at it, it raises a question due to an older patch, that introduced
dev_put_track().
It's just a question of comprehension:
  If the position of the device that has to be removed is
    - at the head of the device list: do dev_put_track()
    - in the the device list or at the end: dev_put_track()
    - not in the device list: do _not_ dev_put_track().
      Why? - Not obviously clear. I think, because an interface could exist,
      but is set to down and thus is not part of the list (-> then you can't see
      it as /proc/sys/net/ax25/<name>).


-> Personally, I'd consider

- this better readable:

	int found = 0;

	if (ax25_dev_list == ax25_dev) {
		ax25_dev_list = s->next;
		found = 1;
	} else {
		for (s = ax25_dev_list; s != NULL && s->next != NULL; s = s->next) {
			if (s->next == ax25_dev) {
				s->next = s->next->next;
				found = 1;
				break;
			}
		}
	}

	spin_unlock_bh(&ax25_dev_lock);
	ax25_dev_put(ax25_dev);
	dev->ax25_ptr = NULL;
	if (found)
		dev_put_track(dev, &ax25_dev->dev_tracker);
	ax25_dev_put(ax25_dev);


- ..or with goto:

	int found = 1;

	if (ax25_dev_list == ax25_dev) {
		ax25_dev_list = s->next;
		goto out;
	}
	for (s = ax25_dev_list; s != NULL && s->next != NULL; s = s->next) {
		if (s->next == ax25_dev) {
			s->next = s->next->next;
			goto out;
		}
	}
	found = 0;

out:
	spin_unlock_bh(&ax25_dev_lock);
	ax25_dev_put(ax25_dev);
	dev->ax25_ptr = NULL;
	if (found)
		dev_put_track(dev, &ax25_dev->dev_tracker);
	ax25_dev_put(ax25_dev);



- ..than this:

	if ((s = ax25_dev_list) == ax25_dev) {
		ax25_dev_list = s->next;
		goto unlock_put;
	}

	while (s != NULL && s->next != NULL) {
		if (s->next == ax25_dev) {
			s->next = ax25_dev->next;
			goto unlock_put;
		}

		s = s->next;
	}
	spin_unlock_bh(&ax25_dev_lock);
	dev->ax25_ptr = NULL;
	ax25_dev_put(ax25_dev);
	return;

unlock_put:
	spin_unlock_bh(&ax25_dev_lock);
	ax25_dev_put(ax25_dev);
	dev->ax25_ptr = NULL;
	dev_put_track(dev, &ax25_dev->dev_tracker);
	ax25_dev_put(ax25_dev);



vy 73,
	- Thomas  dl9sau


On Mon, May 16, 2022 at 02:28:04PM +0800, Lu Wei wrote:
> Merge repeat codes to reduce the duplication.
> 
> Signed-off-by: Lu Wei <luwei32@huawei.com>
> ---
>  net/ax25/ax25_dev.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c260..b80fccbac62a 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -115,23 +115,13 @@ void ax25_dev_device_down(struct net_device *dev)
>  
>  	if ((s = ax25_dev_list) == ax25_dev) {
>  		ax25_dev_list = s->next;
> -		spin_unlock_bh(&ax25_dev_lock);
> -		ax25_dev_put(ax25_dev);
> -		dev->ax25_ptr = NULL;
> -		dev_put_track(dev, &ax25_dev->dev_tracker);
> -		ax25_dev_put(ax25_dev);
> -		return;
> +		goto unlock_put;
>  	}
>  
>  	while (s != NULL && s->next != NULL) {
>  		if (s->next == ax25_dev) {
>  			s->next = ax25_dev->next;
> -			spin_unlock_bh(&ax25_dev_lock);
> -			ax25_dev_put(ax25_dev);
> -			dev->ax25_ptr = NULL;
> -			dev_put_track(dev, &ax25_dev->dev_tracker);
> -			ax25_dev_put(ax25_dev);
> -			return;
> +			goto unlock_put;
>  		}
>  
>  		s = s->next;
> @@ -139,6 +129,14 @@ void ax25_dev_device_down(struct net_device *dev)
>  	spin_unlock_bh(&ax25_dev_lock);
>  	dev->ax25_ptr = NULL;
>  	ax25_dev_put(ax25_dev);
> +	return;
> +
> +unlock_put:
> +	spin_unlock_bh(&ax25_dev_lock);
> +	ax25_dev_put(ax25_dev);
> +	dev->ax25_ptr = NULL;
> +	dev_put_track(dev, &ax25_dev->dev_tracker);
> +	ax25_dev_put(ax25_dev);
>  }
>  
>  int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
> -- 
> 2.17.1
> 
> 
