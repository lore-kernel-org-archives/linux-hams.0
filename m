From: oz6bl@amsat.dk
Subject: Re: soundmodem and fedora c3
Date: Tue, 8 Mar 2005 18:55:46 -0000 (UTC)
Message-ID: <32927.83.73.68.20.1110308146.squirrel@www.amsat.dk>
References: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
In-Reply-To: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ron- VE3DTT <ve3dtt@hotmail.com>
Cc: linux-hams@vger.kernel.org

Hi Ron

I think that some of your problems arise out of a slight misconception
which I also made when I started:

>
> I have this sample of an 'axport' file which addresses 'sm0':
>
> sm0 KA1FSB-8 1200 255 2 145.630 Mhz "Wellesley, MA" 1200
> bps soundmodem

The 'sm0' in the line above does *not* reference an interface, it's just a
name you give this particular port. The binding between an ax.25 port
defined in axports and an interface is made based on the callsign you use.
Since you assign port sm0 to "KA1FSB-8" you must also use "KA1FSB-8" when
you create your sound interface (hwaddr="KA1FSB-8")

I hope this is of help.

Best 73 de Bent/OZ6BL




