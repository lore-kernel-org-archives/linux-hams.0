From: Aaron May <linux-hams@amayzing.co.nz>
Subject: soundmodem/ax25 newbie questions.
Date: Sun, 30 Mar 2003 21:18:50 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303302118.50687.linux-hams@amayzing.co.nz>
Reply-To: linux-hams@amayzing.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

I have just finished trying to install the soundmodem kernel drivers, only to 
find it doesn't like my sound card. The sound card is an on-board VIA 
chipset, and in the BIOS it has an option to enable the legacy sound-blaster 
on 0x220, irq5 dma 1, however when I try to ifconfig it up, the system log 
reports no sb at that location. So my sound card will not work? (further 
details at www.amayzing.co.nz/aaron/?page=045 if you are interested.)

So I moved on to the soundmodem usermode (?) version. I have happily got it 
working to the point that text scrolls down the screen in kiss mode, proving 
that my cables work.

When I try it in mkiss mode, it results in an error: 

sm[1187]: ioctl: TIOCSETD: Invalid argument (22).

I'm unsure if it means anything, but the line written as I come out of 
soundmodemconfig says:  "selection: cfg: - chan: -"

I more suspect that ax25 needs some more configuration? I haven't found any 
doco/howto that makes sense to me about mkiss (I really am a newbie).

Also If someone could point me at a simple packet terminal program? 

Any help would be appreciated. 
Cheers, Aaron ZL3UAR.
