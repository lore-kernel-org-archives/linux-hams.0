From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: AX25 to Telnet to CONV
Date: Wed, 14 Dec 2005 10:17:16 -0600 (CST)
Message-ID: <Pine.LNX.4.44.0512141015390.17763-100000@srv01.compumont.com>
References: <Pine.LNX.4.44.0512121457300.13676-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0512121457300.13676-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 12 Dec 2005, Bill Vodall wrote:

> Right.  That launches the dxcluster locally.   I'm looking for the magic
> incantation to connect from packet on the local machine to a remote dxcluser
> by telnet.  It'll be something like:
> 
> [NWPDX at *]
>  default         * *  * *  *   * - root telnet w7xy:7373 %u

Is "axwrapper" the magic ingredient I'm missing?   The examples
show it being used with a "finger" implementation.

Hmmm.  I bet something like:

  axwrapper lynx --dump cool.web.site

would work.

73,
Bill


