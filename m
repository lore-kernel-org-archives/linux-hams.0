From: David Miller <davem@davemloft.net>
Subject: Re: [AX.25 2/7] Fix unchecked ax25_protocol_register uses.
Date: Thu, 14 Dec 2006 15:52:44 -0800 (PST)
Message-ID: <20061214.155244.131915970.davem@davemloft.net>
References: <11661361331883-git-send-email-ralf@linux-mips.org>
	<11661361342093-git-send-email-ralf@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <11661361342093-git-send-email-ralf@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Thu, 14 Dec 2006 23:42:08 +0100

> Replace ax25_protocol_register by ax25_register_pid which assumes the
> caller has done the memory allocation.  This allows replacing the
> kmalloc allocations entirely by static allocations.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Applied.
