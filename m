From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 09:36:53 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0508100933290.1839@eskimo.com>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com> 
 <Pine.SUN.4.58.0508100852220.1839@eskimo.com> <8ea83f4050810092139d7034c@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8ea83f4050810092139d7034c@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Laughlin <jeff.laughlin@gmail.com>
Cc: Linux-Hams@vger.kernel.org

On Wed, 10 Aug 2005, Jeff Laughlin wrote:

> Thanks for the suggestion. I wasn't aware that it existed.

I had an _extremely_ minor part in it I think:  I remember pointing
Ian towards Perl with a bit of example code to snag/parse packets
and he went crazy with it from that point!


> After thwarting a few broken links I did manage to find a copy. It
> targets perl 4, it's not a module, and it outputs formatted text
> instead of a data structure, so it doesn't exactly acheive the same
> goals that I have. However it is GPL'ed which is good, so I may be
> able to re-use some of it's parsing code without tainting my code. I
> still have quite a bit left to implement to have a complete
> implementation. And it will certainly be nice to have another GPL code
> base to reference other than XASTIR.

That was the idea.  I didn't think it'd be directly usable, but
examples are always good.

Also look at the OpenTrac parsing code in Scott's "listen" patches
or in Xastir (Xastir code is directly derived from Scott's code).
Might as well do that too!  It's much easier to parse than APRS
anyway, something about being designed for parsing from the get-go I
suppose...

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
