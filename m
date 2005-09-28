From: IZ4EFN Alessio <iz4efn@libero.it>
Subject: PATH matter with SCC card and aprsd
Date: Thu, 29 Sep 2005 01:32:41 +0200
Message-ID: <433B2819.8030202@libero.it>
References: <20050927222532.GD25047@mipter.zuzino.mipt.ru> <20050927.154537.29000845.davem@davemloft.net> <20050928112849.GB2821@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050928112849.GB2821@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hello,

I'm running a couple of SCC cards on our club Packet Server.

These cards are configurated through Z8530DRV drivers, and are working fine.

I also have APRSD on a port.

I have to say to my "TNC" (scc0 port) that every packet must follow the 
TRACE,WIDE7-7 path, in order to see internet packets gated by radio 
digipeaters.

This would not be a problem with a TNC (using the path command) but how 
can I apply this to the scc0 port?

Aprsd can't handle that by itself.

Thanks!!

Alessio IZ4EFN.
