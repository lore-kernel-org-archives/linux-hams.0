From: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 15:12:50 +0200
Message-ID: <1149081171.3361.10.camel@playstation2.hb9jnx.ampr.org>
References: <200605310927.56706.vk3heg@iinet.net.au>
	 <20060531130203.GH27502@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060531130203.GH27502@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: stephen <vk3heg@iinet.net.au>, linux-hams@vger.kernel.org

On Wed, 2006-05-31 at 16:02 +0300, Matti Aarnio wrote:

> FM radio transmitter/limittered receiver, but with slight 2 dB backoff
> things do improve a lot..)

2dB backoff is kinda hard to achieve with an ALC in the signal path. And
it doesn't help when transceivers "forget" to disconnect the internal
microphone when you connect an external modulation signal.

I still think it would be good to have some form of MAC layer ARQ
capability...

73s,
Tom


