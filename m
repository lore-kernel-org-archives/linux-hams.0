From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Linux-2.6.0
Date: Fri, 19 Dec 2003 14:03:26 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031219140326.A15028@pull.privacy.nb.ca>
References: <200312191035.13227.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200312191035.13227.oh1mrr@nic.fi>; from oh1mrr@nic.fi on Fri, Dec 19, 2003 at 10:35:13AM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Fri, Dec 19, 2003 at 10:35:13AM +0200, Jarmo wrote:
> Hi
> 
> Seems promising...BUT...Where are 6PACK and MKISS
> drivers...
> 
> Tried to compile 2.6.0,but didn't find those from kernel?
> Or do I have buy stronger diopters?;-)

The config utils have changed, and the layout is slightly different
but AX.25 support is still there, and so is KISS, 6PACK, BPQ, SCC, BAYCOM, 
and YAM.

Under Device Drivers -> Networking support -> Amateur Radio support ->
this is where AX.25, NET/ROM and Rose support is, and the specific
drivers are under "AX.25 network device drivers" submenu.

-ve3tix (ex. ve1mct)
