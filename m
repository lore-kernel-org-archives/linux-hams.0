From: Dave Platt <dplatt@radagast.org>
Subject: Re: Serial hub firmware and Debian 3.1
Date: Tue, 26 Jul 2005 10:24:05 -0700 (PDT)
Message-ID: <20050726172405.17252.qmail@radagast.org>
References: <d5d4185b0507252146514598d8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <d5d4185b0507252146514598d8@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerutley@gmail.com
Cc: linux-hams@vger.kernel.org

> A little off topic for the list, I know, but why can you understand a
> manufacturer not releasing driver sources?
> 
> a)  The driver sources are no good unless you already have the hardware
> b)  A manufacturer *SHOULD* want to allow people to use their hardware
> 
> Therefore, it's in *EVERY* manufacturer's best interests to release
> driver source.  Keep in mind we're not talking about the ARCHITECTURE
> of the device - I can easily see why someone would want to protect
> that...but the protocols used in communicating with that device,
> there's absolutely ZERO reason to keep those closed - because of a)
> above.

I can suggest at least four reasons, all of which I know to apply to
at least some of the "We won't release the firmware source code"
situations which have arisen.

Reason 1:  the hardware used in the system may in fact be fairly
generic.  It's possible to implement quite a bit of interesting
product technology by using some very generic peripheral hardware...
for example, there are some generic "8051 microprocessor with a
USB interface" chips on the market, which different manufacturers
have used as the basis of their USB peripheral devices.  In these
cases, the company which implements the firmware is the manufacturer
of the final device, not the manufacturer of the chip, and the
device manufacturer's "value add" is the firmware, packaging,
marketing, and support, and not the underlying hardware..  These
manufacturers may be more concerned about the risk of having their
firmware duplicated, and used by companies which make "knockoff"
copies of their hardware based on the same generic chips, then they
are about the possible loss of a small incremental market segment
which insists on open-source.

Reason 2: same scenario as Reason 1, but the device manufacturer
licenses the firmware from a third party.  The device manufacturer
may not have the legal right to distribute the firmware in source form,
if they've purchased a binary-only license from the party who
originally wrote it - and this party (not being a hardware
manufacturer) has no incentive to allow open-source distribution
and re-use of their firmware.

Reason 3: the firmware incorporates some very significant intellectual
property (e.g. customized DSP code), which the manufacturer feels gives
them a market advantage over their competition and which they may plan
to use in future products.  They don't want to give their algorithmic
secrets away to any Tom, Dick, and Harry.  This appears to be the
scenario for the products made by at least one major wireless-networking
company - their drivers and firmware have a lot of their in-house IP
and they are unwilling to give it away to their competitors.

Reason 4: regulatory.  Some wireless devices (e.g. Atheros 802.11 network
chips) qualify as "software-defined radios" under FCC rules, because
much of their behavior (e.g. frequency channels, power levels) are managed
by the driver software or firmware.  The radio hardware is capable of
transmitting on bands, and with power levels which are outside the limits
of various national rules... only the integrity of the software prevents
this from happening.  The FCC permits such software-defined radios to be
marketed and used, but only on the condition that they incorporate
safety measures which deter people from tampering with the settings and
using them outside the relevant limits.  Atheros releases a binary-only
HAL module which controls the hardware and enforces the limits, and enables
people to wrap this module in an OS-specific driver.  I believe they feel
that they cannot release the low-level HAL source code, without being
at risk of having the FCC forbid the sale of their chips and products
for violation of the SDR rules.

Unfortunately, it seems to be a fact of life that one or more of these
reasons-to-restrict-source-code will probably continue to arise in
various devices in the future.  Those who feel very strongly about
"completely open-source" can decline to buy or use such products, while
those who are willing to bend a bit in these cases do have that option.
