From: "David S. Miller" <davem@davemloft.net>
Subject: Re: [2.6 patch] /net/ax25/: some cleanups
Date: Mon, 27 Dec 2004 18:51:51 -0800
Message-ID: <20041227185151.2a7ceb71.davem@davemloft.net>
References: <20041212211339.GX22324@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-bounce@oss.sgi.com>
In-Reply-To: <20041212211339.GX22324@stusta.de>
Sender: netdev-bounce@oss.sgi.com
Errors-to: netdev-bounce@oss.sgi.com
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@stusta.de>
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@oss.sgi.com, linux-kernel@vger.kernel.org

On Sun, 12 Dec 2004 22:13:39 +0100
Adrian Bunk <bunk@stusta.de> wrote:

> The patch below contains the following cleanups:
> - make two needlessly global functions static
> - net/ax25/ax25_addr.c: remove the unused global function ax25digicmp

Applied, thanks Adrian.

