From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Thu, 16 Jun 2022 13:19:42 +0200
Message-ID: <648a6e70fdfaa94ee678abda210860287ad09bc3.camel@redhat.com>
References: <20220615220947.3767-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655378387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GJSHiXGnbIKwEFbP5SDVLebTcXv1rK1oD5ajGiN6VGI=;
        b=P/k3uAZuOzBL2oTx9r2BPPS+pRg8aSU74YeYnfaJTQ05kOPd1SvgjVLXCVVXhfS5z9wcuZ
        0TWANTk5x2L9u415DJnfmpg91+Sq4WV5txG26p+Q7XSQsyShPYg/LucX7mLvx5acL/8VQy
        PYXobtEUCHWESkulqzcd/SrfqOj29SA=
In-Reply-To: <20220615220947.3767-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <pjlafren@mtu.edu>, linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

Hello,

On Wed, 2022-06-15 at 18:09 -0400, Peter Lafreniere wrote:
> ax25_dev_device_up() is only called during device setup, which is
> done in user context. In addition, ax25_dev_device_up()
> unconditionally calls ax25_register_dev_sysctl(), which already
> allocates with GFP_KERNEL.
> 
> Since it is allowed to sleep in this function, here we change
> ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
> out-of-memory errors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>
> ---
> v2 -> v3:
>  - Rebased for clean application to net-next
> 
> v1 -> v2:
>  - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
>    (Is that okay?)
>  - Removed invalid changes to ax25_rt_add()
> 
>  net/ax25/ax25_dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index ab88b6ac5401..2093f94f6852 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -52,7 +52,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>  
> -	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
> +	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL)) == NULL) {
>  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
>  		return;
>  	}

Since you are touching this line, please move the assignment in a
separate statement:

	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
	if (!ax25_dev) {

so that we get rid of this obsolete codying style.

Thanks!

Paolo

