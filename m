From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: PROBLEM: gMFSK v0.5 locks up.
Date: 12 Jul 2003 19:30:47 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1058027447.1273.58.camel@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org>
	<20030420023708.GA22988@silly.cloud.net.au>
	<3F0F1E43.9030500@pi8zaa.ampr.org> <200307112325.24591.ailic@gmx.net>
	<3F0F3126.8030403@pi8zaa.ampr.org>  <3F0FC0FD.5060307@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F0FC0FD.5060307@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Cc: linux-hams@vger.kernel.org

On Sat, 2003-07-12 at 11:04, Arno Verhoeven wrote:

> Until now I didn't get it to produce any sound yet. (sound works on that 
> system. Other applications can use the sound card)

Are you getting any sound input? I mean does the waterfall show any 
noise?

> 1. click the "Abort transmission immediately" button.
> 2. click the "Mode" pull-down menu and try to select another mode.

This would indicate that the current RX thread is stuck somewhere
(and the rest of the program is waiting for it to complete). It could
be a blocked open() or read(). Are you sure no-one else is having the
sound card open?

Edson's idea is also good. Knowing where exactly it is stuck is
valuable information.

Oh, does the CPU load increase when gmfsk is locked up?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

