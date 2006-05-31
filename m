From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 17:02:15 +0300
Message-ID: <20060531140215.GI27502@mea-ext.zmailer.org>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531130203.GH27502@mea-ext.zmailer.org> <1149081171.3361.10.camel@playstation2.hb9jnx.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1149081171.3361.10.camel@playstation2.hb9jnx.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Cc: linux-hams@vger.kernel.org

Hello Thomas,

On Wed, May 31, 2006 at 03:12:50PM +0200, Thomas Sailer wrote:
> On Wed, 2006-05-31 at 16:02 +0300, Matti Aarnio wrote:
> 
> > FM radio transmitter/limittered receiver, but with slight 2 dB backoff
> > things do improve a lot..)
> 
> 2dB backoff is kinda hard to achieve with an ALC in the signal path. And
> it doesn't help when transceivers "forget" to disconnect the internal
> microphone when you connect an external modulation signal.

Of course I would not use normal built-in modulator at all.
One can perhaps use some components out of surplus NBFM radios,
but not original modulator, nor (of course) FM demodulator.

I spotted recently also TI's  CC1100 (et.al.) chips.
Nice sets of features for a data radio in a very cheap package - but
it does not look very sensitive in itself... (about 15 dB of "deafness"
in our (oh2mqk, oh3bk, oh3nwq, oh2bns) opinnion about it..)

On the other hand - adding narrowband low-noise preamp for Rx, and
some real PA for Tx should make it  quite interesting thing all in
its own right.

> I still think it would be good to have some form of MAC layer ARQ
> capability...

The ARQ makes sense when your transmission is very slow.
(E.g. HF AMTOR).   TCP retry timers are somewhat ARQ incompatible...

Having a 9600 bps TCP running at 99% packet transmit reliability 
gives you so good a result, that you don't want extra ARQ there
to spoil things.

Now ALE (Automatic Link Establishment), and ways to self-organize
the network, those would be neat....


> 73s,
> Tom

73 de Matti, OH2MQK

PS: "73s" is plural of plural
