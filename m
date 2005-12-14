From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: AX25 to Telnet to CONV
Date: Wed, 14 Dec 2005 11:24:28 -0600 (CST)
Message-ID: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com>
References: <200512141644.jBEGi5Fo000342@yagi.h-net.msu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200512141644.jBEGi5Fo000342@yagi.h-net.msu.edu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 14 Dec 2005, Dennis Boone wrote:

>  >  > [NWPDX at *]
>  >  > default         * *  * *  *   * - root telnet w7xy:7373 %u
>  > 
> 
> Skip telnet, use axconv:
> 
> 	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz
> 

Thanks Dennis...

It's working right now.   I didn't realize that axconv had a [services]
option that allowed using different ports.


[NWPDX at *]
default         * *  * *  *   * - root /usr/local/bin/axconv axconv w7xy.net 7300

Now to add this to the five boxes I'm supporting...

73,
Bill - WA7NWP


