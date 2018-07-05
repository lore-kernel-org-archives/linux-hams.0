From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/hamradio/6pack: remove redundant variable channel
Date: Thu, 05 Jul 2018 19:35:07 +0900 (KST)
Message-ID: <20180705.193507.897674096555432344.davem@davemloft.net>
References: <20180705101107.22897-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705101107.22897-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: colin.king@canonical.com
Cc: ajk@comnets.uni-bremen.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 11:11:07 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable channel is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up two clang warnings:
> warning: variable 'channel' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
