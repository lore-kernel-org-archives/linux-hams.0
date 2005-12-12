From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: AX25 to Telnet to CONV
Date: Mon, 12 Dec 2005 15:00:56 -0600 (CST)
Message-ID: <Pine.LNX.4.44.0512121457300.13676-100000@srv01.compumont.com>
References: <10490.80.126.37.112.1134374126.squirrel@webmail.xs4all.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <10490.80.126.37.112.1134374126.squirrel@webmail.xs4all.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 12 Dec 2005, ronnie wrote:

> Hi Bill,
> 
> This is what we have in the ax25d.conf for incoming requests.
> We have the spider dx cluster however.
> 
> default         4 100  * *  *   * - sysop /spider/src/client client %s ax25

Right.  That launches the dxcluster locally.   I'm looking for the magic
incantation to connect from packet on the local machine to a remote dxcluser
by telnet.  It'll be something like:

[NWPDX at *]
 default         * *  * *  *   * - root telnet w7xy:7373 %u


I'll figure it out shortly if nobody has it handy in their notes.


Thanks,
Bill - WA7NWP


