From: Dave Platt <dplatt@radagast.org>
Subject: Re: Debian-Cart I/O-modem Baycom - PROBLEM
Date: Tue, 05 Feb 2013 10:53:39 -0800
Message-ID: <51115533.7040401@radagast.org>
References: <5110C476.4060807@mail.sp1lop.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5110C476.4060807@mail.sp1lop.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: SP1LOP <SP1LOP.Janusz@mail.sp1lop.ampr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>


> ENG: I need help. I have a computer with two modems Baycom
>      Debian Linux 6.0.6, Kernel 2.6.35, driver: baycom_ser-fdx

> ENG: I use Baycom modems, connected to the I/O PCI
>      Modems receive (Rx) channels correctly but are not suitable (not Tx)

> ENG: And this is the configuration I/O card with the command lspci-vvv

> 15:06.0 Serial controller: NetMos Technology PCI 9845 Multi-I/O
> Controller (rev 01) (prog-if 02 [16550])
>         Subsystem: LSI Logic / Symbios Logic 0P6S (6 port 16550a serial
> card)
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 132
>         Region 0: I/O ports at 8cf8 [size=8]
>         Region 1: I/O ports at 8ce8 [size=8]
>         Region 2: I/O ports at 8cd8 [size=8]
>         Region 3: I/O ports at 8cc8 [size=8]
>         Region 4: I/O ports at 8cb8 [size=8]
>         Region 5: I/O ports at 8ca0 [size=16]
>         Kernel driver in use: serial


> ENG: and data from /var/log/dmesg

> 15:06.0 Serial controller: NetMos Technology PCI 9845 Multi-I/O
> Controller (rev 01)
> 
> [    1.574194] Linux agpgart interface v0.103
> [    1.574477] Serial: 8250/16550 driver, 8 ports, IRQ sharing enabled
> [    1.576605] serial 00:06: activated
> [    1.576953] 00:06: ttyS4 at I/O 0x108 (irq = 12) is a 16550A
> [    1.577147] serial 0000:15:06.0: PCI INT A -> GSI 132 (level, low) ->
> IRQ 132
> [    1.577352] 0000:15:06.0: ttyS5 at I/O 0x8cf8 (irq = 132) is a 16550A
> [    1.577590] 0000:15:06.0: ttyS6 at I/O 0x8ce8 (irq = 132) is a 16550A
> [    1.577822] 0000:15:06.0: ttyS7 at I/O 0x8cd8 (irq = 132) is a 16550A
> [    1.578054] 0000:15:06.0: ttyS0 at I/O 0x8cc8 (irq = 132) is a 16550A
> [    1.578288] 0000:15:06.0: ttyS1 at I/O 0x8cb8 (irq = 132) is a 16550A
> [    1.578522] 0000:15:06.0: ttyS2 at I/O 0x8ca0 (irq = 132) is a 16550A

> Please help, how to configure the modem connected to the I / O card suit
> (Tx)

There may be any one of several things happening here which could cause
the transmit to not work correctly.  I think you have not given us
enough information for anyone to know for sure which problem you have.

It would help if you could tell us:

(1) When you try to TX, does your radio actually transmit at all, or
    does it stay in RX?

(2) If it transmits something - does it "sound like" a normal packet
    transmission, if you listen on another radio?  Is it a single
    tone?  Is it silence?

(3) What options are you specifying when you load the baycom_ser-fdx
    driver?

I can make several suggestions about things which might be wrong.

The documentation for the baycom_ser-fdx driver says that you
should use the "setserial" command to tell the standard serial driver
not to try to control the ports that you are trying to use with the
baycom_ser-fdx driver.  It is not allowed to have two drivers
trying to "own" the same I/O ports.

Before you load the baycom_ser-fdx driver with "insmod" or
"modprobe" you should use commands like

   setserial /dev/ttyS0 uart none

for the two ports you are going to use with baycom_ser-fdx.

It is possible that your system is not transmitting, because
the baycom_ser-fdx driver "thinks" that the radio is always
receiving packets.  This could happen if you are using the
"hardware carrier detect" configuration in this driver, and
if your serial port UART is reporting that DCD is "on" for
some reason.  If you use "hardware carrier detect" you should
operate your radio with the squelch "closed" (silent when no
signal is being received).  You can try operating with the
squelch open, and with the baycom_ser-fdx configured for
"software carrier detect".

Another possibility is that the PCI serial card you are using,
is not physically able to drive a Baycom serial modem properly.
The Baycom modem and driver were designed to work with a "real"
8250, 16450, or 16550A UART and with an RS-232 electrical
interface.  Some PCI serial cards do not accurately emulate
these UARTS, and many of them do not have true RS-232
electrical interfaces but only a lower-voltage version.

There are several reasons why you might be having problems:

-  The serial card must drive the TXD line to a "0" state
   (high voltage) and must provide enough current on the TXD
   pin to operate the Baycom modem.  It is possible that your
   card's TXD line cannot provide enough current (or has too
   low a voltage) for TX operation.

-  The serial card RTS pin is used to drive the PTT signal to
   the radio.  It is possible that RTS is not driving strongly
   enough (too little voltage or current) to operate PTT.

-  The baycom_ser-fdx driver actually transmits the HDLC
   data by toggling the serial card's DTR pin on and off
   rapidly.  It is possible that your PCI card's UART is
   not toggling DTR on and off rapidly enough, and that this
   is corrupting the HDLC data.

You may need to look at the electrical signals between the
serial port and the Baycom modem with an oscilloscope, to
see if the DTR and RTS and TXD pins are being driven
properly by your PCI serial card.



