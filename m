From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: hamradio: remove unused hweight*() defines
Date: Mon, 18 Feb 2019 12:10:26 -0800 (PST)
Message-ID: <20190218.121026.1539031523062218783.davem@davemloft.net>
References: <1550471725-5575-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550471725-5575-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: yamada.masahiro@socionext.com
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, t.sailer@alumni.ethz.ch, linux-kernel@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Feb 2019 15:35:25 +0900

> This file does not use hweight*() at all, and the definition is
> surrounded by #if 0 ... #endif.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to net-next, thanks.
