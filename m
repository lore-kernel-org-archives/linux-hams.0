From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] rose_node_list_lock was not released before returning
 to user space
Date: Sat, 19 Apr 2008 18:38:34 -0700 (PDT)
Message-ID: <20080419.183834.238901544.davem@davemloft.net>
References: <480A6034.1080806@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <480A6034.1080806@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: pidoux@ccr.jussieu.fr
Cc: ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org

From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Date: Sat, 19 Apr 2008 23:12:20 +0200

> I have already submited this patch on January 11, 2008.
> As the bug is still present, I resend it.

I'll apply this fix, thanks a lot Bernard.
