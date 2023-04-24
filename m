From: David Ranch <linux-hams@trinnet.net>
Subject: Re: 6PACK Crash
Date: Mon, 24 Apr 2023 11:26:16 -0700
Message-ID: <74f065e4-e25c-00b0-5cde-7d1a8e404d43@trinnet.net>
References: <CANnsUME6LaYohriVo6zMq7SuEB1pbu2EsVVci2jow+gcp1aCog@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CANnsUME6LaYohriVo6zMq7SuEB1pbu2EsVVci2jow+gcp1aCog@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Chris,

To help you narrow the issue down, the group would need to give the 
group various details:

    - clear steps to reproduce the failure.  I know you outlined a bit 
of the steps in your original post but did the connection to KQ6UP-5 
succeed?  Details like this matters

    - a picture or copy/paste of the kernel panic / stack trace / oops / 
etc screen

    - which version of the libax25 / ax25apps / ax25tools are you using


I have seen on many modern Linux machines running Xwindows / Wayland 
that when the machine panics, the GUI just freezes and there isn't any 
technical details given.  To see the technical details, you'll need to 
drop to the CLI display by typing say Control-ALT-F3 on Ubuntu 20.04, 
logging in, and then try your packet connection there.  if the kernel 
freaks out, you should see it there and then you can take a picture, etc.

Ps.  I can confirm on Ubuntu 20.04 running 5.15.0-69-generic with the 
VE7FET libax25 1.1.3 / ax25apps 2.0.1 / ax25tools 1.0.5 that if I start 
up the AX25 system with Linpac running and then a remote packet station 
makes connection to the listening SSID for LInpac, my machine will 
kernel panic.  This will look like a complete system freeze within 
Gnome/Xfree but if in the VTY/CLI view, I see the panic details.   
Interestingly enough, I discovered a workaround that if I start up the 
ax25+linpac systems, then shut the ax25+linpac stuff back down (not 
rebooting here), and then re-start them.. packet operastions are then 
stable and reliable.  I had reported this some time ago but there wasn't 
any movement so I just deal with this via this workaround.  Maybe this 
is what you're experiencing as well so give it a try to reproduce and 
then try the workaround to see if it works for you.

--David
KI6ZHD


On 04/20/2023 01:14 PM, Chris Maness wrote:
> I am playing with a 6pack EPROM in a TAPR TNC2 Clone, and I can easily
> crash the latest stable kernel in Arch Linux:
>
> This same HW configuration works fine under WindowsXP and The flexnet
> kermel + 6PACK driver.
>
> Linux positron 6.2.11-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 13 Apr 2023
> 16:59:24 +0000 x86_64 GNU/Linux
>
> spattach /dev/ttyS0 vhf
> where vhf is defined as:
> vhf [tab] KQ6UP-2 [tab] 9600 [tab] 2 [tab] Info
>
> I used:
>
> call vhf KQ6UP-5 and after a little bit of playing around the machine
> locked hard. I have no issues with this box other than messing with
> AX.25 stuff.
>
> 73 de Chris KQ6UP
>
>

