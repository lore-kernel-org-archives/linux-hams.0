From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Just network stuff
Date: Sun, 21 Nov 2004 11:04:04 -0800
Message-ID: <20041121190404.GA8185@office.n7xy.net>
References: <620c90570411201917aeb79e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c90570411201917aeb79e@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, Nov 20, 2004 at 07:17:08PM -0800, Chuck Hast wrote:
> I took all of my collection of Debian CD's and attempted to set up a machine
> to do just network, and particularly IP/AX25/FPAC/ROSE/NetRom/other
> networking goodies, seems that even good old debian decided to add a
> lot of stuff that I do not think I need for such a machine.
> 
> I was thinking that there was a set of special install or small install scripts
> that you could select from at boot time, but I only found the "compact"
> entry, but when I ran dselect, it proceeded to install a boatload of stuff that
> I do not think i need (BIFF?!?!) I am not interested in this thing doing e-mail
> or web stuff (it installed apache and I do not recall selecting that one at
> any time)
> 
> Beyond the ax25-howto is there a good guide as to what all to allow the
> installer to install and not install?
> 

When you get to the point where it wants to run dselect, stop there!

You will at this point have a pretty minimal system and can install any 
wanted packages with apt-get.

73,
Bob, N7XY
