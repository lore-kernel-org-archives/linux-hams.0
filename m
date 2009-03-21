From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: PCB design.  W7DMR DE G3FHL =
Date: Sat, 21 Mar 2009 22:37:34 +0200
Message-ID: <20090321203734.GP28512@mea-ext.zmailer.org>
References: <49C4A0ED.4080304@btinternet.com> <20090321165809.GA9631@reid1.localdomain> <49C54337.4050402@btinternet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49C54337.4050402@btinternet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Bagley <geoff.bagley@btinternet.com>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>

On Sat, Mar 21, 2009 at 07:42:47PM +0000, Geoff Bagley wrote:
> Hi Don,
>
> Many thanks for your information.
> Can you please tell me just how difficult it is to overcome the  
> "complex"  part of  the  pcb  package.

You will need about 20 completed designs.

That is time you will need with _any_ decent software to become sufficiently
proficient to be able to enter design as schematics, and then to layout bits
on PCB.   Or to be able to tell what is wrong with the thing.

> I much prefer to use the Debian package -  I have an aversion to  
> proprietary software even using wine.
>
> I wonder which  GNU/Linux distro you use ?
>
> I started off with SuSE way back  about 1999,  but switched to Debian  
> when  "Woody" became stable.
> I now use "Lenny".
>
> Please can you give me a "steer" to get started with pcb ?
> If I can get started, I can build upon a modest start.

Personally I do like the CADSoft's Eagle.  Its free version has limitations
of:

  - single schematic design sheet (albeit a very large one!)
  - 100x80 mm PCB, 2 layers
  - no autorouter

Its pre-existing component library is quite sufficient for your needs,
and adding new ones is fairly easy -- again the magic "20 attempts help
you to master the thing"

Lack of autorouter is no hindrance.  I have seen nowhere an autorouter which
I would really like (at _any_ price), but certain versions of interactive
push & shove editing systems would be dandy (except that they are patented
ideas...)

Indeed I have Eagle's full commercial version, and I do not use autorouter
at all.

I have used the large PCB layout area to combine multiple small designs from
6 designers to single large combined one for manufacturing.  Resulting board
was something like 250 x 380 mm and contained a dozen boads.
(File pre-processing cost was 25 euros per file, doing self-combine cut that
cost down considerably...)

> I am not attempting an ambitious PCB -  I guess it ought to be possible  
> to get pcb working.
>
> I think I only need  8DIL  sockets and a few resistors/capacitors  to  
> lay out a high gain LF amplifier  using OP07  chips.

The freeware Eagle will do it for you, then.
Do the tutorial excercises at first to get a feel of the thing, and then
you should be able to do the real designs.

> Thanks to everyone for allowing me to hijack the list !
>
> 73 to all
>
> Geoff Bagley
> G3FHL

73 de Matti, OH2MQK
