From: Ralf Baechle <ralf@uni-koblenz.de>
Subject: Status of AX.25 in 2.5 / 2.6
Date: Fri, 26 Jul 2002 13:42:16 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020726134216.A4126@dea.linux-mips.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Forgive if I'm missing any developments on this list; I've been (again ...)
unsubscribed by one of Mati's scripts ...

No substancial changes have been done to the AX.25 kernel stack in a extended
period of time.  As the result it is still doing crude stuff like globally
enabling and disabling interrupts, has no understanding of shared skb, isn't
fully multithreaded and probably plenty more problems I haven't spotted yet.
Now that we're about to remove global cli() / sti() from the kernel this
means the AX.25 stack will soon break entirely.

Is there any ongoing development I'm not aware of?  Just in case I've
started doing some cleanup last night ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
