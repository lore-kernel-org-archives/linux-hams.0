From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: BUGs into libax25
Date: Mon, 2 Jun 2008 09:49:38 +0100
Message-ID: <20080602084938.GB997@linux-mips.org>
References: <4843220B.20703@upmc.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4843220B.20703@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>, Ray Wells <vk2tv@exemail.com.au>, Charlie k4gbb <k4gbb1@earthlink.net>, Jerry DeLong <KD4YAL@tampabay.rr.com>, F1TE <f1te@f1te.org>, f8arr <f8arr@f8arr.org>

On Mon, Jun 02, 2008 at 12:26:19AM +0200, Bernard Pidoux wrote:

> I found a number of BUGs into libax25 that may affect nearly ALL AX25 
> applications for it is in ax25_aton_entry() function that is used to 
> translate a callsign into AX25 format.
> Programs like kissattach, listen, ax25ipd, FPAC, xfbbd are concerned.
>
> The code would return an error with 6 letters callsigns.
>
>
> The second set of errors is in /proc/ax25/ timers format description.
> since timers are now in millisec, they require a larger storage size.
> This results in using unsigned long integers rather than unsigned short 
> integers.
>
> Ax25-tools and ax25-apps must be recompiled after recompilation and 
> installation of this new libax25 version.
> FPAC and LinuxFBB also.

I guess that means we need to introduce symbol versions like glibc and a
few others.  Oh pleassure, oh fun.

  Ralf
