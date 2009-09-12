From: Dave Platt <dplatt@radagast.org>
Subject: Re: Problem with soundmodem on Eee PC
Date: Sat, 12 Sep 2009 16:12:33 -0700
Message-ID: <4AAC2AE1.9090609@radagast.org>
References: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com> <4AA85757.8010105@lightningflash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AA85757.8010105@lightningflash.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Lance Cotton" <joe@lightningflash.net>
Cc: Julian Moss <julian.g4ilo@gmail.com>, linux-hams@vger.kernel.org


> 2) Use the ALSA sound system instead of the OSS system, which I think is 
> now standard on Ubuntu and most other 2.6 Linuxes. I had been sticking 
> with OSS for a while because I found the commercial (paid) OSS system to 
> be very stable on the old SuSE distro I was running. I now use Ubuntu 
> and the ALSA system will re-sample whatever audio comes in from whatever 
> soundcard to give the software what it asked for.

That's true, *if* you specify the "plughw:" ALSA device as the one
to use.  This utilizes a library plugin which will perform sample-rate
and sample-depth conversion on the fly, so that the application will
get the rate it expects.

If you use the direct "hw:" device specification, the application
is restricted to only those exact sample rates / widths / formats
that the hardware supports.  If the app tries to request an unsupported
configuration, the attempt to open the device will fail and the
app won't get any audio in/out over the channel.

The current version of the soundmodem configurator has "plughw:"
available in the menu of device choices for ALSA.  It also has
some fixes to audio-channel management that are needed with some
ALSA devices (e.g. some USB audio converters).  Older versions
of the soundmodem app may not work well with some devices when
using ALSA.

I have a feeling that some of the soundmodem utility code
(e.g. the scope) may need some of the same "restart cleanly
after an error" fixes that the main modem code required, in
order to work properly with ALSA.

