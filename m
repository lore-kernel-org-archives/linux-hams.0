From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Apr 23 (ax.25 sysctl)
Date: Mon, 23 Apr 2012 09:25:46 -0700
Message-ID: <4F95828A.8050403@xenotime.net>
References: <20120423170701.c96e402234b1387dece11dda@canb.auug.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xenotime.net; s=default;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=YZEdeBxfNyydFOBPdfeIo1d8uSSn4TjFJlDYfeSAlpY=;
	b=hIEpmxKqNdpJk6vkyHbeKFiAZVW2YGh0m4gIQNN5SzVRdeTtTq2/3HDHWyufkyhy3vk9pPMi2ebkssahfA6U/CuxSOBj+vy/16J+Rjr2VDNToh4BdluIiEqx1moD2O72;
In-Reply-To: <20120423170701.c96e402234b1387dece11dda@canb.auug.org.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, linux-hams@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

On 04/23/2012 12:07 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120420:



include/net/ax25.h:447:75: error: expected ';' before '}' token


static inline int ax25_register_dev_sysctl(ax25_dev *ax25_dev) { return 0 };
static inline void ax25_unregister_dev_sysctl(ax25_dev *ax25_dev) {};

Is this from Eric B.'s sysctl patches?

First function:  move ';' inside braces.
Second function:  drop the ';'.


-- 
~Randy
