From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Amateur Radio -> MacOS?
Date: Thu, 31 Jan 2008 22:35:04 +0200
Message-ID: <47A230F8.5030403@sral.fi>
References: <1201798150.47a1fc062d0bc@mgtmail.com> <20080131184108.GR2537@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080131184108.GR2537@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Matti Aarnio wrote:

> Several applications exist for HF data modulations, and EME work with
> Joe Taylor's softwares.   Those need in essence some way to listen using
> line mode (or even microphone) input, and transmit with line out (or
> headphones) plus some way to key the transmitter.

FWIW, I once took a quick look at how audio is implemented in OSX.
My understanding was that the native interface only supports
callback based audio.

My gMFSK, and I believe most other linux soundcard programs use
blocking or polling for audio data and thus need non-trivial
modifications to be ported to OSX.

The changes needed shouldn't be rocket science, but lacking
hardware to experiment on, I soon lost interest...

/Tomi
