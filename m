From: Mike Markowski <mm@UDel.Edu>
Subject: Re: soundmodem and fedora c3
Date: Tue, 08 Mar 2005 12:44:34 -0500
Message-ID: <422DE482.6030800@udel.edu>
References: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Just as a sanity check, did you remember to run soundmodemconfig so that 
it creates interface sm0?  And similarly, remember to actually run 
soundmodem before starting xastir.  :-)  I know you probably did, but 
just making sure all bases are covered!  After running soundmodem, make 
sure an "ifconfig" shows that sm0 is up before starting xastir.

Mike  AB3AP

Ron- VE3DTT wrote on 03/08/05 12:35 ET:
> Thanks to all who responded to my query.
> 
> I am aware that 'soundmodem' is usermode software but I tried loading 
> the modules anyway, out of desperation.
> 
> 'make menuconfig' suggests that ax.25 is hard coded in my kernel.
> 
> I have this sample of an 'axport' file which addresses 'sm0':
> 
> "sm0 KA1FSB-8 1200 255 2 145.630 Mhz "Wellesley, MA" 1200
> bps soundmodem"
> 
> but it doesn't help.  I've tried many variations on sample 
> configurations with negative results.
> 
> 'xastir' will allow me to bring up a 'kiss' device on any port I choose 
> but none communicate with soundmodem. The xastir manual tells me to use 
> ax25.
> 
> 'Listen' informs me that my ax25 ports aren't active.
> 
> -- 
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> 
> I, reluctantly, must include myself among the computer illiterate and 
> when I discovered that 'soundmodem' is available for windows  I 
> downloaded 'soundmodem', 'flexnet32' and 'paxon' and was decoding 
> packets within 15 minutes start to finish. In view of the time it takes 
> to get anything up and running with Linux, I'm inclined to counter that, 
> perhaps,
> 
> Linux is Life's tax on those of us who don't have one.
> 
> It has to be it's own reward. I'll keep trying things until something 
> works.
> 
> Thanks again,
> Ron
> 73 VE3DTT
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

