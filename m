From: csmall@enc.com.au (Craig Small)
Subject: Re: libax25 0.0.11
Date: Tue, 18 Mar 2003 22:28:39 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030318112839.GB13725@enc.com.au>
References: <200303171755.47880.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200303171755.47880.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Mon, Mar 17, 2003 at 05:55:47PM +0200, Jarmo wrote:
> 
> Hate to make this announce...But vers 0.0.11 brakes my wavelan system..
> 0.0.10 works fine...
> 
> Mar 17 17:28:06 oh1mrr kernel: NETDEV WATCHDOG: eth1: transmit timed out
> Mar 17 17:28:06 oh1mrr kernel: eth1: Tx timeout! ALLOCFID=01f7, 
> TXCOMPLFID=0000, EVSTAT=8000
> Mar 17 17:28:06 oh1mrr kernel: eth1: orinoco_reset: Error -19 re-initializing 
> firmware
> Mar 17 17:28:07 oh1mrr kernel: NETDEV WATCHDOG: eth1: transmit timed out
> Mar 17 17:28:07 oh1mrr kernel: eth1: Tx timeout! ALLOCFID=01f7, 
> TXCOMPLFID=0000, EVSTAT=8000
> Mar 17 17:28:07 oh1mrr kernel: eth1: orinoco_reset: Error -19 re-initializing 
> firmware

The only difference in the two is that patch which fixed the io
blocking.  My guess is that this problem either has nothing to do with
the library or the relinking has introduced something.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
