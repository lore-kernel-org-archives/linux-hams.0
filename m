From: "Ron- VE3DTT" <ve3dtt@hotmail.com>
Subject: soundmodem and fedora c3
Date: Tue, 08 Mar 2005 17:35:57 +0000
Message-ID: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Mime-Version: 1.0
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thanks to all who responded to my query.

I am aware that 'soundmodem' is usermode software but I tried loading the 
modules anyway, out of desperation.

'make menuconfig' suggests that ax.25 is hard coded in my kernel.

I have this sample of an 'axport' file which addresses 'sm0':

"sm0 KA1FSB-8 1200 255 2 145.630 Mhz "Wellesley, MA" 1200
bps soundmodem"

but it doesn't help.  I've tried many variations on sample configurations 
with negative results.

'xastir' will allow me to bring up a 'kiss' device on any port I choose but 
none communicate with soundmodem. The xastir manual tells me to use ax25.

'Listen' informs me that my ax25 ports aren't active.

--
"Windows:  Microsoft's tax on computer illiterates." -- WE7U

I, reluctantly, must include myself among the computer illiterate and when I 
discovered that 'soundmodem' is available for windows  I downloaded 
'soundmodem', 'flexnet32' and 'paxon' and was decoding packets within 15 
minutes start to finish. In view of the time it takes to get anything up and 
running with Linux, I'm inclined to counter that, perhaps,

Linux is Life's tax on those of us who don't have one.

It has to be it's own reward. I'll keep trying things until something works.

Thanks again,
Ron
73 VE3DTT


