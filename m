From: David Miller <davem@davemloft.net>
Subject: Re: [AX.25 3/7] Fix unchecked ax25_listen_register uses
Date: Thu, 14 Dec 2006 15:52:51 -0800 (PST)
Message-ID: <20061214.155251.66057322.davem@davemloft.net>
References: <11661361331883-git-send-email-ralf@linux-mips.org>
	<11661361342916-git-send-email-ralf@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <11661361342916-git-send-email-ralf@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Thu, 14 Dec 2006 23:42:09 +0100

> Fix ax25_listen_register to return something that's a sane error code,
> then all callers to use it.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Applied.
