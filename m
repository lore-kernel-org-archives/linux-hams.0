From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Tue, 29 Sep 2015 17:31:29 +0200
Message-ID: <20150929153129.GA31429@linux-mips.org>
References: <5605828E.5010104@eclis.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5605828E.5010104@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Christian de Rivaz <jc@eclis.ch>
Cc: linux-hams@vger.kernel.org

On Fri, Sep 25, 2015 at 07:21:18PM +0200, Jean-Christian de Rivaz wrote:

> On a embedded system we use AX25 over an USB serial port with the kissattach
> command. For some hardware reason the microcontroller that act as a TNC and
> USB CDC device can be rested while the system is running, causing a USB
> disconnect of the USN CDC device and the removal of the corresponding serial
> port in the kernel. But the ax0 interface is not removed in this case and
> after a few seconds the kernel panic with the crash below:
> 
> [<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
> [<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf4
> [ax25])
> [<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>]
> (ax_header+0x38/0x40 [mkiss])
> [<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>]
> (neigh_compat_output+0x8c/0xd8)
> [<c041b584>] (neigh_compat_output) from [<c043e7a8>]
> (ip_finish_output+0x2a0/0x914)
> [<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0xf0)
> [<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x48)

skb_push is invoked via a code path that was conceptually completly broken
and has been rewritten recently.  So it would be great if you could retest
with a recent release version preferably 4.2.  I suspect this is not the
cause but I'd like to exclude the possibility.

Thanks,

  Ralf
