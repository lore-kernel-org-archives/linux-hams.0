From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Help, not rudeness, requested
Date: Wed, 5 Nov 2003 00:02:27 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311042302.27093.pa3gcu@zeelandnet.nl>
References: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com> <20031104140305.GE1477@tangerine.coulon.evette> <Pine.LNX.4.58.0311041419190.22150@debian.ehrlichtronics.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0311041419190.22150@debian.ehrlichtronics.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Ehrlich <scott@ehrlichtronics.com>
Cc: linux-hams@vger.kernel.org

On Tuesday 04 November 2003 20:20, Scott Ehrlich wrote:
> Greetings:
>
> Well aware of the dev drivers :-)
>
> I neglected to say I had enabled them during make menuconfig, but still
> saw no sign of soundmodem support in Amateur Radio support.  I'll check
> out the baycom stuff when I get back home.

You have quite possably missed

CONFIG_PARPORT

I said before in my last mail i do not use a sound modem, however i did look 
to see where you are going wrong. I made the comment that you need to read 
the documentation, if you took that to be rude then you have a limited sense 
of feeling, anyway, why do you need "CONFIG_PARPORT",? answer, i have no idea 
BUT, in /usr/src/linux-2.4.22/drivers/net/hamradio/Config.in the line;

dep_tristate 'Soundcard modem driver' CONFIG_SOUNDMODEM \
$CONFIG_PARPORT $CONFIG_AX25

Tells me that if one does not select CONFIG_PARPORT or CONFIG_AX25 then you 
will NEVER see CONFIG_SOUNDMODEM in make config, make menuconfig or make 
xconfig period.

Now without even trying to be rude i hope this helps.
O yes, i did take a look at your request and answers, one can see them in the 
archives at; http://he.fi/archive/linux-hams/
I saw no rude mail at all, if you meant i was rude by pointing you towards 
documentation you are totaly wrong.

-- 
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



