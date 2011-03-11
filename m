From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Sat, 12 Mar 2011 08:28:26 +1100
Message-ID: <4D7A93FA.8060306@exemail.com.au>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net> <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net> <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net> <alpine.LNX.2.00.1103110815240.4745@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103110815240.4745@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

On 12/03/11 03:26, Curt, WE7U wrote:
>
> I'm about done WRT further progress on the YAM driver, at least for now.
> I'm getting ancy to get something on the air, so have a 220 MHz mobile
> rig in to work with me today to redo the
> coax taps, then will hook it to one of: YAM / PK-232 / DSP-232. I can
> get one YAM going reliably on the motherboard serial port, then with the
> 4-port board talking to various TNC's I
> can do the other 1200 and 9600-baud links I want to do for now.
>
> As of last night I can get one of the YAM's configured every time on the
> motherboard's serial port, but never using the 9835/9845 cards. The
> second YAM board is being finicky in all cases but I don't know if it's
> the driver or the board.
>
> I tweaked the driver yesterday to better supply power to the board.
> During programming the PWR LED stays lit now instead of flashing, and
> that LED is always on nice and strong. Power is supplied via two
> handshake lines that need to be at opposite states to keep +12V/-12V
> supplied. One of those is used during programming and also controls PTT.
> Weird, but some people do anything to save a buck. I've seen worse!
>
> I may add a function to the driver for controlling the two handshakes so
> that they are always kept at opposite states. Right now it's all done
> with bit-twiddling of both lines on the spot, and you have to keep the
> opposite-states thing in mind while tweaking any of those spots.
>
> Also: I was wrong about the driver using UART loopback mode during
> operation. It only uses loopback mode to decide what sort of UART is out
> there, then switches back to normal operation. The trick they're doing
> in order to accomplish synchronous programming of the Xilinx: They set
> the data line (RTS in this case), then throw $0xFC into the transmit
> buffer which causes this bit pattern to be sent out on the CLOCK line:
>
> 1 1111 1100 0
>
> That first 1 is a start bit, then 8 bits of data, then a stop bit. This
> produces a nice clock pulse to program the data bit into the Xilinx
> with. Not a bad trick to use an asynchronous port to do synchronous
> programming of a part.
>
> Another thing I found out yesterday is that there's a v1.7 YAM and a
> v1.10 YAM. I have two v1.10b boards. They require different MCS firmware
> loads because Xilinx pins have been moved and the board layout has been
> changed. I don't know which firmware is in the Linux driver now. It
> would be nice to have that documented and the firmware added to the
> kernel so people would
> know to choose the proper one for their board. The driver appears to
> have the capability to use an alternate file, but there aren't any
> alternate files to be had in the kernel. I just found an MCS file for
> the v1.10 board, but it's just a single one, so they might have combined
> the 1200 and the 9600 baud circuits into one now. How they are chosen
> via software is something I have yet to figure out.
>
> Any pointers as to who to submit the patches to? Probably the
> kernel-hackers list? How to submit them? It might be a few more days or
> weeks before I get around to it though. I've tested the driver on 64-bit
> and 32-bit, but will do so again before I send any patches upstream.
>

Curt,

Have sent you some YAM files I've collected over the years. Have other 
documentation
in hard copy format including connections to various parts of the FPGA. 
I'm still
looking for an article on a modification to the YAM to help it cope with 
varying
DC voltage that might be applied to the input from the radio 
discriminator with DC
coupling. Another modification was to use a separate power supply to 
overcome some
comports supplying insufficient voltage - I had one that provides only 3.5V.

Ray vk2tv

