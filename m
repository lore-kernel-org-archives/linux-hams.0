From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Soundmodem
Date: Fri, 29 Oct 2004 19:59:22 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1099069161.1288.8.camel@oh2bns.ampr.org>
References: <200410291617.26097.anespo1@virgilio.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200410291617.26097.anespo1@virgilio.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Fri, 2004-10-29 at 17:17, iw2esa wrote:

> Running gmfsk
> ===============
>  gmfsk
> audio_alsa: no cards found!

Something wrong with the ALSA config. You said that playing music
works but maybe the OSS emulation layer is not working properly.
Your music player might be using ALSA directly. gMFSK uses the
OSS sound API and thus needs the ALSA OSS emulation layer to
work.

> ** (gmfsk:6084): WARNING **: FIXME: guard from double entry

Hmm.. I guess this is from the threading libs, I don't think
gMFSK has this error message. :)

Anyway it's probably a result from the audio not working and
as such not serious (?)

-- 
Tomi Manninen / OH2BNS / KP20ME04

