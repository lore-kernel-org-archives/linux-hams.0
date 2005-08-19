From: "Patrick A. Ouellette" <pat@flying-gecko.net>
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Fri, 19 Aug 2005 15:45:58 -0400
Message-ID: <20050819194558.GA17715@flying-gecko.net>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

On Fri, Aug 19, 2005 at 02:55:42PM -0400, Scott Weis wrote:
> 
> I have been working for weeks to try and get AX-25 working with the mkiss 
> module.  Best I can figure is that there is no working AX25 for SMP kernels 
> and core 4.  The ax25-utils package has not kept up with the updates made 
> in the kernel. This is all I can manage to get when I try to start an 
> interface..
> 
> + /sbin/modprobe mkiss
> + sleep 5
> + /usr/local/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptya1 /dev/ptya2
> + /usr/local/sbin/kissattach /dev/ttya1 ax0 172.16.198.1

Is your device really /dev/ttya1 and not /dev/ttyS1 ???
I don't use Fedora (I'm a Debian user) but I don't expect there to be
that big of difference.

Kernel 2.4.x should be fine - I've even used 2.6.x.

73,

Pat KB8PYM
-- 

Patrick Ouellette                 pat@flying-gecko.net
kb8pym@arrl.net                   Amateur Radio: KB8PYM 
Living life to a Jimmy Buffett soundtrack
"Crank the amp to 11, this needs more cowbell - and a llama wouldn't hurt either"
