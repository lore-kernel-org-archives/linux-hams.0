From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: PATH matter with SCC card and aprsd
Date: Thu, 29 Sep 2005 11:24:55 +1000
Message-ID: <20050929012455.GA10952@cloud.net.au>
References: <20050927222532.GD25047@mipter.zuzino.mipt.ru> <20050927.154537.29000845.davem@davemloft.net> <20050928112849.GB2821@linux-mips.org> <433B2819.8030202@libero.it>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <433B2819.8030202@libero.it>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Sep 29, 2005 at 01:32:41AM +0200, IZ4EFN Alessio wrote:
> I also have APRSD on a port.
> 
> I have to say to my "TNC" (scc0 port) that every packet must follow the 
> TRACE,WIDE7-7 path, in order to see internet packets gated by radio 
> digipeaters.
> 
> This would not be a problem with a TNC (using the path command) but how 
> can I apply this to the scc0 port?
> 
> Aprsd can't handle that by itself.

Perhaps I misunderstand, but you can set the path like this in aprsd.
You need:

aprspath APRS v TRACE WIDE7-7

73,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
