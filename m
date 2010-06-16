From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 11:19:32 +1000
Message-ID: <4C1826A4.7000605@exemail.com.au>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

Jim,

If I may comment on the YAM. I have one of these and it works quite well 
at 9k6 under Debian 4.0.

Today, however, there is no support for the YAM and purchasing the PCB 
may be an impossible task.

My general preference is for TNC's running a KISS only EPROM although my 
Baycom USCC>4 card (1x0k3, 2x1k2 and 1x9k6 modem) works very well. It's 
the original ISA version. A PCI version was also produced.

Ray vk2tv

Jim Kusznir wrote:
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
>
> I know one solution is to get modern TNCs (such as the PK-96, etc),
> and either put them in kiss mode or replace the rom with a KISS-only
> rom.  I know that linux can do sound card packet as well.  However,
> I'm wondering if there's something inbetween.  I'm not entirely
> against the sound card TNC option, but have some questions as to the
> robustness and performance of such a system.  Also, its likely in my
> implementation that I'd be using usb audio adapters to provide the
> sound card.  And I want to do 9600 baud with them.  Of course, there's
> also the how-to-key-the-transmitter problem as well.
>
> I see in the linux kernel support for YAM and some others; are any of
> these viable solutions?  Anything else to recommend?
>
> Thanks!
> --Jim, K7LL
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

