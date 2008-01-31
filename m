From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Amateur Radio -> MacOS?
Date: Thu, 31 Jan 2008 23:53:59 +0200
Message-ID: <47A24377.8020905@sral.fi>
References: <1201798150.47a1fc062d0bc@mgtmail.com>	 <20080131184108.GR2537@mea-ext.zmailer.org> <47A230F8.5030403@sral.fi> <fc22d18f0801311255q570b490ay4f0e50b0a602c288@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <fc22d18f0801311255q570b490ay4f0e50b0a602c288@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Frank Brickle wrote:

> Applications that use JACK move smoothly between Linux and OSX. They can 
> also take good advantage of FireWire sound systems like the Edirol 
> FA-66.  Please see http://dttsp.org/wiki for an example of an SDR 
> application that runs on Linux and OSX without pain.

Yes, but IIRC, Jack is also callback based *) and that is the key in my
argument. Doable but non-trivial changes are needed. That requires
someone with the motivation and hardware to do it.

This is not meant to be an excuse why ham radio software is lacking
from OSX (and I don't even know if it really is), just a possible
explanation why at least some soundcard based Linux ham radio programs
are not trivial to port to OSX.


*) I might be mistaking here as well. I remember taking a look at
Jack as well, exactly because it was portable between Linux and OSX.
But IIRC, it too would have required the same architecture change.

/Tomi
