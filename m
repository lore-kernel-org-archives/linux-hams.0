From: Dave Platt <dplatt@radagast.org>
Subject: Re: Updates & MKISS on USB serial?
Date: Wed, 23 Jun 2004 10:45:08 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040623174508.30714.qmail@radagast.org>
References: <20040623114001.GA15244@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040623114001.GA15244@linux-mips.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: raj@jrw.co.uk

> Can anyone tell me if USB serial adaptors will work OK with the standard
> AX25 serial port stuff - Kissattach / MKISS??
> For KISS TNC connection.)
>  
> If so, any advice on make or type?

In principal, they should work fine - the TNC should not see any
difference.

In practice, the success rate may depend on the specific model,
and on how well the Linux driver for the device is written.

I've been using one of the little KISS-only "TNC-X" TNCs,
which I purchased with the USB option - a DLP-USB232M module
which plugs into the TNC board.  Under Linux 2.4.22 (and, I
think, 2.4.24 as well), the results were a bit like the old
doggerel:

   "There once was a pretty little girl
    with curls down over her forehead.
    When she was good, she was very very good,
    and when she was bad, she was horrid."

The Linux driver for this particular USB dongle/adapter,
and/or the Linux USB-serial and USB stack in general, seems
to have some significant problems with hot unplugging.  If
the device is in use (e.g. kissattach is attached to it),
and the device or its hub is unplugged, there's a pretty
high likelyhood of a single-thread kernel panic which leaves
the USB stack in a boggle-brained state.  The device won't
be "seen" again properly until the USB stack is restarted...
and because it boggled out in a semi-busy state, there seems
to be no way to unload and reload the modules without actually
rebooting the system.

As long as I was careful not to unplug, it worked fine, but
unplugging even once by accident would necessitate rebooting
the system, and that's just not acceptable.  So, I unplugged
the module from the TNC-X board, and switched it back to
RS-232 serial mode, which works just fine.

There may have been improvements in the Linux kernel's
handling of hot unplugging of serial USB devices in more
recent kernels, and it's possible that other serial dongles
don't exhibit this problme.  I haven't been motivated to try 
to find out, as the serial mode on this TNC works reliably and as
I have plenty of spare serial ports on the system in question.

