From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 2/2] mkiss: Fix use after free in sixpack_close().
Date: Thu, 17 Dec 2015 22:35:31 +0100
Message-ID: <20151217213531.GB15130@linux-mips.org>
References: <20151217.160549.1465333502952441538.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151217.160549.1465333502952441538.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: gnomes@lxorguk.ukuu.org.uk, dvyukov@google.com, ajk@comnets.uni-bremen.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com, syzkaller@googlegroups.com, kcc@google.com, glider@google.com, sasha.levin@oracle.com, edumazet@google.com

On Thu, Dec 17, 2015 at 04:05:49PM -0500, David Miller wrote:

> Subject: [PATCH 2/2] mkiss: Fix use after free in sixpack_close().

Make that subject "... mkiss_close()."

  Ralf
