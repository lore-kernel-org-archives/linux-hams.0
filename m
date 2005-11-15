From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: last kernel version 2.6.15-rc1
Date: Tue, 15 Nov 2005 11:07:10 +0000
Message-ID: <20051115110710.GA2731@linux-mips.org>
References: <Pine.LNX.4.44.0511142129390.4380-100000@cwoux2.cerise.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0511142129390.4380-100000@cwoux2.cerise.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacques Chion <Jacques.Chion@wanadoo.fr>
Cc: linux-hams@vger.kernel.org

On Mon, Nov 14, 2005 at 09:40:08PM +0100, Jacques Chion wrote:

> Good eveneing or morning,
> 
> has somebody tried the last version of the kernel (rc1 of 2.6.15) ?
> 
> I know it's only a release candidate, but i like experimentation.

Calling it release candidate it a Linus idea.  In fact it's almost the
definition of instable.

> I use soundmodem and mkiss and i have no problems to receive packets with this kernel.
> But when i use the program 'call' from ax25-apps, my system freezes
> and i have the message :
> 
> 
> Nov 12 08:59:14 cwoux3 kernel: mkiss: sm0: Trying crc-smack
> Nov 12 08:59:14 cwoux3 kernel: scheduling while atomic: call/0x00000100/3093
> Nov 12 08:59:14 cwoux3 kernel:  [<c03679e2>] schedule+0x4f2/0x5a6

Is this a preemptable kernel?

  Ralf
