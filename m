From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Soundmodem && SBLive!
Date: Tue, 15 Apr 2003 20:24:39 -0300
Sender: linux-hams-owner@localhost
Message-ID: <3E9C6A87.22232.37320@localhost>
References: <3E9A1E49.14409.BE2D@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <200304140816.37438.rdmartinml@infinito.it>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rdmartinml@infinito.it
Cc: linux-hams@vger.kernel.org

---
On 14 Apr 2003 at 8:16, Giuseppe Martino wrote:

> Il Monday 14 April 2003 07:34, Rodolfo Brasnarof ha scritto:
> > So, try the user-space one, which should work with ANY
> > soundcard supported by OSS. Is your card working with OSS?
> 
> Yes,  It is.
> 
> > Then it should work with the user-space soundmodem.
> 
> But Is soundmodem kernel-space no longer mantained?

I don't know, but the user-space soundmodem is easier to 
configure, more flexible, and works with virtually any 
soundcard supported by the kernel.

The kernel soundmodem only works with soundblaster or 
windows sound system compatible cards. Those include 
SoundBlaster, SBPro, SB16, AWE32, AWE64, and many 
compatibles, for example those with Crystal chipsets (I have 
one with this chip and made it work with the kernel module, 
in both SB and WSS mode). Those are mainly isa cards. Sound 
Blaster PCI cards (like mine PCI128) don't work with this, 
and perhaps no pci card would work. This is a restriction 
the other soundmodem doesn't have (and an important one if 
your card is not supported).

Other thing is flexibility. When you configure the user 
soundmodem, for example in afsk modulation, you can choose 
the tones you want to use. This is not posible with the 
kernes soundmodem. A friend and I are using 2400bps afsk 
with custom tones (we choosed the tones which worked best).

Other thing is that when I tried the kernel soundmodem, I 
had problems unloading the module (the module gives a 
segmentation fault).

And finaly, there's the mixer. You can use the usual mixer 
to change audio levels. I use aumix in command line mode 
from within a script, but you can use what you like.

One bad thing is that if you want to use the configuration 
utility you need X. But you can take a sample configuration 
file and edit it yourself.

