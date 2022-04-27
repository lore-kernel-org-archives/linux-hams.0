From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH net-next 6/6] net: hamradio: remove support for DMA SCC devices
Date: Wed, 27 Apr 2022 15:27:46 +0200
Message-ID: <CAK8P3a3ym6uGLWxX55bc_JDWziDO0hq7K0UksMLC7_b5=aFfcQ@mail.gmail.com>
References: <20220426175436.417283-1-kuba@kernel.org> <20220426175436.417283-7-kuba@kernel.org>
 <YmhACVaakjATNFl4@x-berg.in-berlin.de> <20220426123941.5c6643ee@kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220426123941.5c6643ee@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org, jreuter@yaina.de, Arnd Bergmann <arnd@arndb.de>

On Tue, Apr 26, 2022 at 9:39 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 26 Apr 2022 20:55:05 +0200 Thomas Osterried wrote:
> > Jakub informed, that the dmascc driver will be removed from kernel.
> >
> > I think, Jakub's descision should be discussed here on the list, by the users.
>
> Thanks a lot for the forward!
>
> > DMASCC is the "high speed DMA" driver.
> > SCC driver (also with Z8530) will be left in the kernel.
> >
> > Hmm, I cannot really understand the decision of kickoff for DMASCC, and
> > why the code "older" SCC ISA-bus cards will be kept.
>
> We are infamously bad at deciding when to retire code in the kernel,
> the arbitrary rule I used now was "does it depend on VIRT_TO_BUS".
> I figured the non-DMA SCC will go when ISA goes.

Looking at how this driver uses virt_to_bus, I think it can trivially get
converted to isa_virt_to_bus(), which only operates on the low 16MB.

What hardware is ax25 actually used on normally? the drivers I can see
are based on

6pack: serial (through tty layer)
bpqether: ethernet
dmascc: isa (with DMA)
scc: isa (without DMA)
baycom: serial (bypassing tty layer) or parport
yam: serial (bypassing tty layer)

The ISA drivers are clearly the most obsolete, as they require a 32-bit PC
or 1990s RISC workstation with ISA slots.

The baycom and yam drivers in turn look like they could work on any
serial port but are written to assume an ISA-style onboard serial port
on a PC. You can technically still buy new machines that have those,
but the drivers should really be changed to go through the tty layer
if someone wants to use them with a USB-serial adapter or similar.

       Arnd
