From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Kernel 2.4.23 + Woody very Unstable
Date: Tue, 9 Dec 2003 00:10:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031209001055.A211@jeroen.pe1rxq.ampr.org>
References: <200312082028.50918.eb5esx@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200312082028.50918.eb5esx@eb5esx.ampr.org>; from eb5esx@eb5esx.ampr.org on Mon, Dec 08, 2003 at 20:28:50 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Cc: linux-hams@vger.kernel.org

On 2003.12.08 20:28:50 +0100 Ruben Navarro Huedo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello friends:
> We are using Kernel 2.4.23 + Debian Woody + backports.
> Our system is very unstable and i think that the problem is
> ax25..(stopping it 
> we have not problems)
> 
> linux:/usr/src/linux# dpkg -l | grep ax25
> ii  ax25-apps      0.0.6-1        Applications for AX25
> ii  ax25-tools     0.0.8-2        AX-25 Tools
> ii  libax25        0.0.10-1       ax25 libraries for hamradio
> applications
> linux:/usr/src/linux#
> 
> 
> Please....Are you having some problems like this?

Yup, everyboddy is......
ax.25 in 2.4 is buggy.
2.6 is almost fixed (I think I solved the last bug I got yesterday, a
little testing and another patch is ready...)

Jeroen

