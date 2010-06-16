From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 04:24:52 +0300
Message-ID: <20100616012452.GN898@mea-ext.zmailer.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

On Tue, Jun 15, 2010 at 04:43:45PM -0700, Jim Kusznir wrote:
> 
> Hi all:
> 
> I'm in the process of designing some kinda-embedded applications that
> will need to employ packet "compatibility layers" to allow access of
> packet radios.
> 
> In one application, I'm proposing relacing a node stack with a linux
> box, some interface (subject of this e-mail), and the existing radios
> with their audio (discriminator if appropriate), tx line, squelch
> line, etc.  Other applications may not be as demanding as the nodes,
> but similar.  In essence, I'm looking for a device to connect to the
> equivalent of the 6-pin mini-din connector used for "data" on most
> modern radios and linux.
> 
> I'm familiar with the state of the art back in the late '90's.  I also
> realize that not a lot has necessarily changed since then....
> However, I suspect something may have.
> 
> the solution should be capable of running several different packet
> interfaces, and at 9600 or 1200 baud.  These interfaces should turn
> into linux axX interfaces.

I would suggest making it an USB device with "BPQether" type of interface.
At USB level it would look like a _generic_ ( = no extra drivers )
ethernet, but it would understand only BPQether type of packets, and
therefore would not get to transmit just anything that system happens
to send on its way.

There would be need for unique serial numbers ( = "mac address" ) for
the devices.  Anything would be good as long as first byte of MAC
address has its lowest bit clear (the multicast indicator)
(Even prefix "BPQ" = 0x42, 0x50, 0x51 )

See  "man bpqparams" for the control interface.

To implement a control command channel, like to set ptt delays, etc.
that could be an AX.25 frame with destination call of 'NOCALL' (the
classical misconfiguration token) and an UI frame with control data.
Speed would be fixed, but nothing prevents having multiple virtual
ethernet interfaces in same USB device, each with their own speeds.

As a bonus, this same hardware could be plugged on Windows as well
without any special drivers.  If the settings are correct, then on
windows a BPQ32 suite will be able to drive it too - and you get
even more people interested in that device.

> Thanks!
> --Jim, K7LL

73 de Matti, OH2MQK
