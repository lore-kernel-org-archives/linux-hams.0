From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: newbie question - hamlib and gMFSK
Date: Sat, 01 May 2004 17:26:45 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4093C1B5.8080308@cs.unibo.it>
References: <1083420366.4194.8.camel@dhcppc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1083420366.4194.8.camel@dhcppc3>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

N5NW Marty wrote:


> I have finally successfully installed gMFSK and hamlib, but gMFSK 
> doesn't seem to recognize that hamlib exists.  No options for 
> configuration under preferences.

hamlib support can be enabled/disabled from the preferences panel only
if gMFSK has been built with hamlib option turned on. Quoting from
memory, the ./configure script in gMFSK sources automatically detects
hamlib's presence during build, but you might always add --enable-hamlib
to be on the safe side.


> Any thoughts?  I'm trying to move completely away from the Microsoft 
> environment in the shack, and this seems like a critical step.  I am

My ham radio activity is supported entirely by Linux: hamlib, xlog (with
hamlib support), gMFSK (with hamlib support) plus cwdaemon for fun and
occasionally the soundmodem to test the ax25 connection to my club's
cluster node. I have installed qsstv also, but it didn't interest me 
enough to bother to really test it.


> very much the newbie with linux - not much beyond the 
> ./configure|make|make install stage.  I'm using Mandrake 9.2 in a
> triple boot environment (DOS/Win98/Linux).

Nothing bad with being a newbie, but you're past that stage if you're 
already comfortable with building from sources 8-)


> If there is a more appropriate forum for the question, please advise.

I think this list is appropriate enough, but just in case you want
something a bit more focused you should try xlog-discussion and
hamlib-developers (see websites for links).


B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

