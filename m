From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/rose: remove redundant assignment to variable
 failed
Date: Tue, 07 Jan 2020 13:52:49 -0800 (PST)
Message-ID: <20200107.135249.2010540602729806790.davem@davemloft.net>
References: <20200107152415.106353-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200107152415.106353-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: colin.king@canonical.com
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  7 Jan 2020 15:24:15 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable failed is being assigned a value that is never read, the
> following goto statement jumps to the end of the function and variable
> failed is not referenced at all.  Remove the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
