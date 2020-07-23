From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] AX.25: Prevent integer overflows in connect and
 sendmsg
Date: Thu, 23 Jul 2020 12:10:37 -0700 (PDT)
Message-ID: <20200723.121037.1733642913138811577.davem@davemloft.net>
References: <20200722.175714.1713497446730685740.davem@davemloft.net>
        <20200723144957.GA293102@mwanda>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20200723144957.GA293102@mwanda>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: dan.carpenter@oracle.com
Cc: jreuter@yaina.de, yepeilin.cs@gmail.com, ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Jul 2020 17:49:57 +0300

> We recently added some bounds checking in ax25_connect() and
> ax25_sendmsg() and we so we removed the AX25_MAX_DIGIS checks because
> they were no longer required.
> 
> Unfortunately, I believe they are required to prevent integer overflows
> so I have added them back.
> 
> Fixes: 8885bb0621f0 ("AX.25: Prevent out-of-bounds read in ax25_sendmsg()")
> Fixes: 2f2a7ffad5c6 ("AX.25: Fix out-of-bounds read in ax25_connect()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
