From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: Re: KPC 9612+ and kissattach
Date: Tue, 3 Sep 2002 06:07:01 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0209030600080.943-100000@gb7lgs.ampr.org>
References: <001201c252f6$b12639a0$fe5d34d1@platinum.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001201c252f6$b12639a0$fe5d34d1@platinum.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


On Mon, 2 Sep 2002, Ian McLaughlin wrote:

> Thanks for the quick response.  I did consult the HOWTO, and my commands are
> based on the ones you listed.  I'm only using the 9600 baud port, so I only
> have a kissattach line for the second port.  This is not working, however.
> What I wanted to confirm is that I'm correctly putting the 9612+ into kiss
> mode.  I'm using a factory default config, with MYCALL set, and then INTFACE
> KISS.  Is this correct?  All of my configs work just fine connecting to the
> TNC in a Kenwood D7A handheld, but not the KPC9612.

I seem to recall that I had to set 'ABAUD 9600' to force the TNC to use 
9600 Baud for the serial port instead of it's default auto-detect method. 

Are you sure 'INTFACE KISS' was accepted ? (The TNC may not let you go
from NEWUSER mode to KISS directly, you might have to do 'INTFACE 
TERMINAL' first).

-- 
Stewart (G0LGS)
g0lgs@gb7lgs.co.uk

