From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Band dropdown missing in GMFSK
Date: Tue, 07 Mar 2006 16:23:07 +0200
Message-ID: <1141741387.4175.11.camel@oh2bns.ampr.org>
References: <440CF9FE.7050206@sktc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <440CF9FE.7050206@sktc.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David D. Hagood" <wowbagger@sktc.net>
Cc: linux-hams@vger.kernel.org

On Mon, 2006-03-06 at 21:11 -0600, David D. Hagood wrote:

> I'm seeing a strange thing with GMFSK V0.71 - the band dropdown is 
> missing. I'd not noticed it until I got my Icom tied into Hamlib, and 
> noticed that I couldn't change the band from the program. Sure, I can 
> spin the knob, but...

Check Settings->Preferences->Hamlib->Features->Set QSO data frequency.
Note that gMFSK won't actually set the band. If the above is checked,
the frequency from the rig is written to the band entry and the
dropdown menu is disabled.

> Also, when I then create a log entry to XLog, the band is not set. 
> Again, I could set the band manually, but ....

Hmm.. This seems to work for me, although the behaviour depends on
how xlog is set up. If remote data is set to go directly to the log
(Settings->Preferences->Other), everything works fine. If it's set to
go to the qso frame, then bands (and modes) need to be set to use an 
editbox (Settings->Preferences->General).

-- 
Tomi Manninen / OH2BNS / KP20JF74

