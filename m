From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: soundmodem/ax25 newbie questions.
Date: Mon, 31 Mar 2003 19:57:49 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <03033119574904.04308@unix.pa3gcu>
References: <200303302118.50687.linux-hams@amayzing.co.nz>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200303302118.50687.linux-hams@amayzing.co.nz>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aaron May <linux-hams@amayzing.co.nz>, Linux Hams <linux-hams@vger.kernel.org>

On Sunday 30 March 2003 09:18, Aaron May wrote:
> I have just finished trying to install the soundmodem kernel drivers, only
> to find it doesn't like my sound card. The sound card is an on-board VIA
> chipset, and in the BIOS it has an option to enable the legacy
> sound-blaster on 0x220, irq5 dma 1, however when I try to ifconfig it up,
> the system log reports no sb at that location. So my sound card will not
> work? (further details at www.amayzing.co.nz/aaron/?page=045 if you are
> interested.)
>
> So I moved on to the soundmodem usermode (?) version. I have happily got it
> working to the point that text scrolls down the screen in kiss mode,
> proving that my cables work.
>
> When I try it in mkiss mode, it results in an error:
>
> sm[1187]: ioctl: TIOCSETD: Invalid argument (22).

I did not reply to this one because i dont use a soundcard at all for packet, 
however considering i've seen no replys i will tell you what,
"ioctl: TIOCSETD" normally means, it means that at the time you gave the 
command no mkiss was found in your kernel or no mkiss module was loaded.
I hope i am correct here as i dont know what "Invalid argument (22)" is, i 
did a quick search in the kernel source but it showed nothing.

If your mkiss support is in module form then you need to have the following 
in your /etc/modules.conf file.

alias tty-ldisc-5 mkiss 

If i am completely wrong please accept my humble appols...

> I'm unsure if it means anything, but the line written as I come out of
> soundmodemconfig says:  "selection: cfg: - chan: -"
>
> I more suspect that ax25 needs some more configuration? I haven't found any
> doco/howto that makes sense to me about mkiss (I really am a newbie).
>
> Also If someone could point me at a simple packet terminal program?
>
> Any help would be appreciated.
> Cheers, Aaron ZL3UAR.

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

