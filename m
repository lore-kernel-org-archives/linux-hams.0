From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: [PATCH] ax25, netrom and rose fixes for 2.6.0
Date: Fri, 19 Dec 2003 23:52:39 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031219225239.GD18789@linux-mips.org>
References: <20031219234435.C211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20031219234435.C211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, davem@redhat.com

On Fri, Dec 19, 2003 at 11:44:35PM +0100, Jeroen Vreeken wrote:

> These are a few fixes for bugs I encountered over the last few weeks:
> 
> - Fix some socket locking in ax25
> - Fix a waitqueue bug in ax25
> - Use sock_orphan in ax25
> - Fix a waitqueue bug in netrom
> - Fix a waitqueue bug in rose
> - Fix raw socket behaviour in ax25
> 
> Ralf, can you give your stamp of approval so Dave can apply them?

Stamp, stamp ...  David, can you apply his patch?


73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
