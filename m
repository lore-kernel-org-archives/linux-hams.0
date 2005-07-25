From: "Dave Platt" <dplatt@radagast.org>
Subject: Re: Serial hub firmware and Debian 3.1
Date: 25 Jul 2005 03:56:42 -0000
Message-ID: <20050725035642.8055.qmail@radagast.org>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: w.knol@niwa.co.nz, linux-hams@vger.kernel.org

> The keyspan driver loads, but syslog complains that 'the firmware is 
> unavailable'. 
> 
> I have brewed up my own 2.6.8 kernel *(using Debian supplied 2.6.8 
> kernel sources) but there does not seem to be a way to build firmware 
> images.

Hmmm.  In the 2.4 kernel series, the kernel configuration for USB
serial devices allows you to specify the Keyspan USA-xxx driver, and
then specify which versions of the firmware you want to build.

I suppose it's possible that this capability was removed from 2.6 (not
sure why) or is not present in the Debian-provided kernel sources.
The Keyspan firmware code is provided in the form of a .h file which
contains binary data - it's not the original Keyspan source code,
which Keyspan declines to release.  I suppose it's possible that this
inclusion of binary-only firmware may have conflicted with Debian's
quite stern open-source-licensing rules, even though it contains a
license grant to use in Linux by Keyspan.

First thing I'd do is check your kernel sources (look in
drivers/usb/serial/).  See if the "keyspan_usa49wlc_fw.h" file is
present, and if the Config.in file in that directory provides an
option to enable the building of the firmware.

Another possibility is that you need to include the Debian "hotplug"
package, in order to enable hot-plugging with firmware loading.
This might not have been provided by default.
