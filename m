From: Jean-Luc <jean-luc.coulon@wanadoo.fr>
Subject: Re: Kernel 2.4.23 + Woody very Unstable
Date: Tue, 9 Dec 2003 11:13:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031209101350.GA6312@coulon.evette>
References: <200312082028.50918.eb5esx@eb5esx.ampr.org> <20031209001055.A211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20031209001055.A211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I experienced random unstabilites with 2.4.23 and Debian sid too.
This does not occured with 2.4.22.
The system freezes with the keyboard led blinking.
Without ax25 running, everything is fine.

--
Regards and  73
			- f5ibh - Jean-Luc

On Tue, Dec 09, 2003 at 12:10:55AM +0100, Jeroen Vreeken wrote:
> On 2003.12.08 20:28:50 +0100 Ruben Navarro Huedo wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hello friends:
> > We are using Kernel 2.4.23 + Debian Woody + backports.
> > Our system is very unstable and i think that the problem is
> > ax25..(stopping it 
> > we have not problems)
> > 
> > linux:/usr/src/linux# dpkg -l | grep ax25
> > ii  ax25-apps      0.0.6-1        Applications for AX25
> > ii  ax25-tools     0.0.8-2        AX-25 Tools
> > ii  libax25        0.0.10-1       ax25 libraries for hamradio
> > applications
> > linux:/usr/src/linux#
> > 
> > 
> > Please....Are you having some problems like this?
> 
> Yup, everyboddy is......
> ax.25 in 2.4 is buggy.
> 2.6 is almost fixed (I think I solved the last bug I got yesterday, a
> little testing and another patch is ready...)
> 
> Jeroen
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-------------------------------------------------------------------
                              ____         __     _             
Jean-Luc Coulon (f5ibh)      / __ \ ___   / /_   (_)____ _ ____ 
28 rue d'Evette             / / / // _ \ / __ \ / // __ `// __ \
90350 Evette-Salbert       / /_/ //  __// /_/ // // /_/ // / / /
France                    /_____/ \___//_.___//_/ \__,_//_/ /_/ 
                                                                               
