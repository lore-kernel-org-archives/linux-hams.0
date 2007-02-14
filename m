From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: multiple kiss ports
Date: Wed, 14 Feb 2007 20:14:00 +0000
Message-ID: <20070214201400.GA2366@linux-mips.org>
References: <1171459986.3039.12.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1171459986.3039.12.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stef Daniels VK5HSX <vk5hsx@wia.org.au>
Cc: Debian Hams List <debian-hams@lists.debian.org>, linux-hams@vger.kernel.org

On Thu, Feb 15, 2007 at 12:03:06AM +1030, Stef Daniels VK5HSX wrote:

> P4 1.2Ghz Celeron
> MSI Motherboard
> 512MB RAM
> 40GB ATA Drive
> ttyS0 ->  9600bd -MFJ 1270b (1200bd TNC) axport '2'
> ttyS1 ->  4800bd - AEA PK232 (4800bd TNC) axport '3'
> Debian GNU\linux 3.1  (2.4.27 kernel)
> using: libax25-0.0.11, ax25-apps-0.0.6, aax25-tools-0.0.8, node-0.3.2,
> fbb7.04j
> 
> The problem is after we run our ax25 script to call up modules, tnc into
> kiss and kissattach devices (which all work fine), upon connect using
> port '2' the tnc "sta" LED comes on and tnc hangs.
> 
> We have tried the following:
> 
> Different- Computers, Cables, TNC's, O\S's, kernel's, hardrive, P\Supply
> and Serial ports (PCI Serial Cards), to NO avail.
> 
> Any ideas, help, comments greatfully and most appreciatedly received!!

Did you try a 2.6 kernel also?  The 2.4 mkiss driver usually works just
fine but it's a fairly suspect piece of code anyway,  so I've turned the
KISS driver upside down for Linux 2.6.

A no-no at the current state of the code are SMP or preemptible kernels.

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU
