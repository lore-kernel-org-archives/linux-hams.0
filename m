From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 19:50:37 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020729185037.GA684@columbia.g7iii.bogus>
References: <20020728224348.GG10796@eye-net.com.au> <Pine.HPX.4.10.10207291502190.25868-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.HPX.4.10.10207291502190.25868-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Jul 29, 2002 at 03:16:32PM +0300, Tomi Manninen OH2BNS wrote:

> Oh, by the way. Has anyone done anything with the NEW-AX.25 patch lately?
> I think it has some potential but unfortunately seems it's now completely
> unmaintained.

I haven't, but I do have a request if anyone decides to 'Take Up The 
Challenge".

Currently (IIRC), the patch routes all IP traffic destined for radio
links (44/8) down the ipax0 device, and then decides the best layer 2
(AX25) interface to throw it out.

I _personally_ believe that this is not the way it should be, I don't
actually like this, but unfortunatley the ipax0 device actually
encapsulates the IP packet, and puts the AX25 header on etc..

Before the patch became unmaintained, I was thinking of modifying
the ipax code, so that:

a) It was a module in its own right.
b) It would only speak to one named AX25 interface (eg ipax0==ax0,
ipax1==ax1 etc)

Of course, being a module, you would be able to load one per interface.
and route different parts of net 44 to different interfaces. This way
'we' can run layer 3 routing protocols.  (Yeah, Im a sick puppy)

Alternatively, you could still do the current NEW-AX25 behaviour of
everything going down ipax0...


I never did the needed mods, as the whole patch became unmaintained,
but if someone takes up the challenge (I dont have the time, or really
the skills to be a 'full-time' maintainer), I would be prepared to
have another look.

Until it's actually maintained, I personally can't see the point in
creating the patch (Im not using it, and the last kernel it was ported to,
was quite a while ago)

(Note that I haven't looked closely, but from thr last time I looked,
it shouldn't be all that hard to do what I want - certainly making it
a module shouldn't be hard at all)


All the Best

Iain

