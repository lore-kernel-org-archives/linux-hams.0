From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: soundmodem and fedora c3
Date: Tue, 8 Mar 2005 09:42:04 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0503080937200.6489@eskimo.com>
References: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
In-Reply-To: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron- VE3DTT <ve3dtt@hotmail.com>
Cc: linux-hams@vger.kernel.org

On Tue, 8 Mar 2005, Ron- VE3DTT wrote:

> I am aware that 'soundmodem' is usermode software but I tried loading the
> modules anyway, out of desperation.
>
> 'make menuconfig' suggests that ax.25 is hard coded in my kernel.
>
> I have this sample of an 'axport' file which addresses 'sm0':
>
> "sm0 KA1FSB-8 1200 255 2 145.630 Mhz "Wellesley, MA" 1200
> bps soundmodem"
>
> but it doesn't help.  I've tried many variations on sample configurations
> with negative results.
>
> 'xastir' will allow me to bring up a 'kiss' device on any port I choose but
> none communicate with soundmodem. The xastir manual tells me to use ax25.
>
> 'Listen' informs me that my ax25 ports aren't active.

It just so happens that I configured soundmodem last night on SuSE
9.1, and hooked Xastir to it.  I chose to configure it as a KISS
interface instead of as an AX.25 kernel interface.  Used the
user-mode soundmodem.  Worked great.  You don't need AX.25 in your
kernel this way.  You don't need modules.

In that case, set the soundmodemconfig program to KISS, and you'll
end up using /dev/soundmodem0 as the interface name.

In Xastir, create a new Serial KISS interface and type in
/dev/soundmodem0 as the interface name.

I also had to start the soundmodem interface.  Is SuSE it was
"/etc/init.d/soundmodem start"

I had to have the interface stopped in order to run the diagnostics
in soundmodemconfig and adjust my mixer settings with a separate
mixer program.  Once I had it configured I killed soundmodemconfig,
restarted soundmodem, and connected Xastir to it.  I'm running in
receive-only mode that way right now at home.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
