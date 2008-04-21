From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] Remove unneeded and deprecated cli()/sti() calls.
Date: Mon, 21 Apr 2008 14:44:28 -0700 (PDT)
Message-ID: <20080421.144428.146049729.davem@davemloft.net>
References: <1208807350-10618-1-git-send-email-mark.asselstine@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1208807350-10618-1-git-send-email-mark.asselstine@windriver.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mark.asselstine@windriver.com
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, asselsm@gmail.com, klaus.kudielka@ieee.org, linux-hams@vger.kernel.org

From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 21 Apr 2008 15:49:10 -0400

> These cli()/sti() calls are made in start_timer() and are therefor
> redundant since the register_lock is now used to protect register
> io from within scc_isr() and write_scc() (where all calls to
> start_timer() originate).
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

This looks good, applied, thanks Mark.
