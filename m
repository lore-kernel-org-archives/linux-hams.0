From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: New to the list...
Date: Wed, 25 Jun 2003 08:45:47 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030624224547.GA7915@cloud.net.au>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAu+l99CL0ZkWOoxTNvpJsHwEAAAAA@bh90210.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAu+l99CL0ZkWOoxTNvpJsHwEAAAAA@bh90210.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Jun 24, 2003 at 07:28:28AM -0700, IT3 Stuart B. Tener, USNR wrote:
> 	The first thing I would like to accomplish is making the PC act as
> an AX.25 TNC using the soundcard. Once this works (for basic packet
> operation) then I would like to configure the system to:
> 
> 	(a) Run TCP/IP, using the soundcard as the modem
> 	(b) Run TCP/IP, using an external TNC in KISS mode (on /dev/ttyS0)
> 
> 	I did the modprobe of soundmodem, and then tried to issue the
> sethdlc command, but after doing so I got "no such address or device" when I
> did an "ifconfig sm0 up".
> 
> 	How can I verify what the IO, DMA and IRQ of the sound card is, if
> it is built into the motherboard, and the BIOS offers now way to set those
> for the card?

You may be able to get this information from /proc/pci.

> 	Other than the soundcard not being set right by sethdlc, I am lost
> as to what is wrong. Any assistance you can offer would be well appreciated.

As well as the sound card parameters, you use sethdlc to configure how
you will key the radio - serial port, parallel port or MIDI port. I
think an error with those settings can also result in an error at 'up'
time.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
