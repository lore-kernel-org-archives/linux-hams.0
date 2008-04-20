From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] rose_node_list_lock was not released before returning
 to user space
Date: Sat, 19 Apr 2008 18:40:10 -0700 (PDT)
Message-ID: <20080419.184010.113401925.davem@davemloft.net>
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

> Subject: [PATCH] rose_node_list_lock was not released before returning to user space

BTW, I had to fix the commit message because it's not the
rose_node_list_lock that isn't being released, it's the socket lock.
