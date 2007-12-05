From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH][ROSE] Trivial compilation CONFIG_INET=n case
Date: Wed, 05 Dec 2007 02:17:41 -0800 (PST)
Message-ID: <20071205.021741.176966054.davem@davemloft.net>
References: <47556E09.1050007@openvz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <47556E09.1050007@openvz.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: xemul@openvz.org
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, devel@openvz.org

From: Pavel Emelyanov <xemul@openvz.org>
Date: Tue, 04 Dec 2007 18:11:05 +0300

> The rose_rebuild_header() consists only of some variables in
> case INET=n, and gcc will warn us about it.
> 
> Fits both net-2.6 and net-2.6.25.
> 
> Signed-off-by: Pavel Emelyanov <xemul@openvz.org>

Applied to net-2.6, thanks.
