From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Tue, 7 Jun 2022 07:58:41 +0300
Message-ID: <20220607045841.GY2146@kadam>
References: <20220606174012.10262-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/CKX54wy41YbY6KOWtKCSBjnGCrwg0sC0UiyRt+dN/M=;
 b=V+qFjMv5JaSPDTOTnQhUQ/UEXs1g5DTVN8Qw7cEtqYa5zl0XI/ycctbtSH1iQRGub3or
 k9PAEub+3wgistdYZcezqkl4jhgwLB9pCRPI5zEiVKsxGJUMpoCxOFyFzgGm1E62Kvuz
 FmitLcQtuVrM0iIqfZRleMCESJUMXpKlIqMbpuXIL5L700zpuPCul1EhQAvx4Rzi72zK
 sOCbGiYwmqsl2sOqmBLKd7p/iqcgGzRLef6Uc35h2M3aT4DKwH5IvOX6ZVuQ1bKG3Gj6
 eLO2ytec4Y+M8oNG6JfGjYmdykFnwEUu4wzPGq8c86ODxmc+nFwiNJ9euMZMQpHrDV01 lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CKX54wy41YbY6KOWtKCSBjnGCrwg0sC0UiyRt+dN/M=;
 b=ykhTj25kt+F/UtPBYcwAAlhni+u7erho9VRMAKq4KKl/gbABokQ81b2l/GkgmaQoQsLV73nOgU8C2Emag20p0QSACDpUVFrJMc3pTonqLvBGm8iZE5scNPgYPgFhPImofubMQYjcuRSn7+pMsha3IBW9zPaKp2hziFJOiuFi71A=
Content-Disposition: inline
In-Reply-To: <20220606174012.10262-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Lafreniere <pjlafren@mtu.edu>
Cc: linux-hams@vger.kernel.org, kernel test robot <lkp@intel.com>

On Mon, Jun 06, 2022 at 01:40:12PM -0400, Peter Lafreniere wrote:
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

I don't know if you really want to add Reported-by tags.  That stuff is
just in the kbuild-bot template and it's an automated thing.  Some people
add it and some don't.

It doesn't really matter either way.

> v1 -> v2:
>  - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
>    (Is that okay?)

No problem.

>  - Removed invalid changes to ax25_rt_add()
> 
> This isn't related to the patch itself, but thanks are owed to everyone
> who had to handle my mistakes in submitting this patch the first time.
> First the posting during the merge window, which I know better to do,
> then me making the stupidest error of missing a lock directly next to the
> relevant code.

It's all part of learning.  No stress.  There was no danger because we
caught it in review and automatically with static analysis.

regards,
dan carpenter

