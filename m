From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ax25: fix reference count leaks of ax25_dev
Date: Thu, 3 Feb 2022 20:14:11 +0300
Message-ID: <20220203171411.GH1978@kadam>
References: <20220203150811.42256-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=sYRSApGCeocH1y/kOKYU8MRcPNLAYqzO/pUpPpzk+uo=;
 b=hO+7tnNZCrcth2KHsTvj7R67aa40IYXyE4buGu5seykZ9/n2YSNTJzgQkpHc+Ck2MrQ0
 0mX9GZ06HDch7rnfDC/TxRlblaBfCZEsSDz8Zvy4vfF0CPWCrOPyYwW07exH65Nu4wyt
 HVi/savceMKRLphWPX9Wcbc4YPXymp5lykt7jsGEshbEFFvhJ3Yy9dy0ynVrc6E93iQP
 YBIO+pcwEeKD19G5O0h3PEYC28hcN0MsgASm6BK0twiiaGy1OR130+zPQ8aMkrDP7gBg
 Jc5T5frq1z8ToYP9PRvOzOxW6oAt03ewpmeN3WWHUjm5xoYhWyQxZKJbXOyP27+UCP4w GA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYRSApGCeocH1y/kOKYU8MRcPNLAYqzO/pUpPpzk+uo=;
 b=IeajfuG5ATQJil4+0axinTynTJh4zvHpbAU3xTKip3deGGdv2jFmce3E9wCNVKQO9Y+5VwUY4aw5ho7kVt4OG6KczpP6LMBGSbsJ2BaoGtv+XbWZVBXssLcscKcu6/chDv12fIwe0XCsazExGiY/5U1XfqIGeDzDx2cBFoNr0PY=
Content-Disposition: inline
In-Reply-To: <20220203150811.42256-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, thomas@osteried.de, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 03, 2022 at 11:08:11PM +0800, Duoming Zhou wrote:
> The previous commit d01ffb9eee4a ("ax25: add refcount in ax25_dev
> to avoid UAF bugs") introduces refcount into ax25_dev, but there
> are reference leak paths in ax25_ctl_ioctl(), ax25_fwd_ioctl(),
> ax25_rt_add(), ax25_rt_del() and ax25_rt_opt().
> 
> This patch uses ax25_dev_put() and adjusts the position of
> ax25_addr_ax25dev() to fix reference cout leaks of ax25_dev.
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---

Much better, thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

