From: Dave Platt <dplatt@radagast.org>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Fri, 11 Mar 2011 13:36:46 -0800
Message-ID: <4D7A95EE.9060206@radagast.org>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net> <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net> <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 03/09/2011 07:07 PM, Curt, WE7U wrote:
> On Wed, 9 Mar 2011, Curt, WE7U wrote:
> 
>> What I found out:  The 16550 interface that I was trying to get
>> running... ain't.  It's a 16550-compatible multi-port card, NOT a card
>> with 16550A's.
> 
>> Worse, I examined the 2-port cards I have:  They're also
>> 16550-compatibles (SYBA 2-port PCI cards).
> 
>> In my spare parts I found one PCI card with a real 16550A, a
>> single-port card.

I wonder... how much of the compatibility problems you're seeing,
have anything to do with the chip itself (16550 vs. "compatible")
and how much have to do with the external analog interfaces used
by the board vendors?

A lot of serial ports these days are only "barely RS-232",
and some don't even comply with the RS-232 spec.  RS-232 requires
both positive and negative voltage swings (minimum of +/-
3 volts if I recall correctly, with +/- 12 having been the
old "nominal" swing).  Modern serial ports may only swing
+5 and 0 (no negative swing at all), or may swing only
just past the +/- 3 volt limits.  The receiver thresholds on
such devices are often set at around 1.5 volts or so.

Furthermore, the amount of power which can be "robbed" from
the handshaking lines is often quite miniscule... just a
few milliamperes.

Since the YAM is intended to be port-powered, I suspect it
is going to be very prone to not work correctly when used
from these wimpy, under-voltaged-and-under-powered ports.
If the handshaking lines can't pull well above +5 while
providing enough juice to run the FPGA, the device probably
will not initialize properly.

Here's my guess:

-  If you have a serial port with a 1488 quad-line driver
   IC, it's likely to work, as these drivers are powered from
   +12/-12 rails and have plenty of current drive capacity.

-  If you have a serial port with a MAX232 or similar
   voltage-doubling driver, it may work, depending on the
   actual output voltage generated on the handshaking pins and
   the amount of current which can be drawn.  Voltage-doubler
   chips which have small on-chip capacitors may be less likely
   to have the necessary current-sourcing capacity, than those which
   use larger (e.g. 1-to-10 uF) off-chip caps.

-  If you have a serial port which simply provides "pseudo-RS-232"
   driver (inverts the TTL/CMOS logic, with no negative voltage
   swing) I suspect it's unlikely to work.

As I see just now that Ray has suggested, you may be able to
overcome the RS-232 voltage issues by using a separate (outboard)
power supply to run the YAM circuitry.  This might provide better
compatibility with a broad range of modern serial ports, which
are usually very register-compatible with 16550A UARTs but which
differ at the electrical level.


