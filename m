From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ANN: gMFSK v0.4
Date: Mon, 8 Apr 2002 13:57:23 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204081351140.31031-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.33.0204081242250.29550-100000@oh2bns.ampr.org>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0204081242250.29550-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Ilic <ailic@gmx.net>
Cc: linux-hams@vger.kernel.org

On Mon, 8 Apr 2002, Tomi Manninen wrote:

> On Mon, 8 Apr 2002, Aleksandar Ilic wrote:
> 
> > If I start gMFSK from KDE, it is working - except I can not type from 
> > keyboard in the transmit window. I can copy and paste text in it, but 
> > keyboard is dead.
> > From GNOME, all is OK.
> 
> Ok, thanks for the report. It is indeed interesting and bit strange too. 
> I'll need to try and see if I can reproduce it here.

I could not reproduce this with KDE but I found another possible cause for
it. Can you check if you have NumLock (or CapsLock or ScrollLock) on when
this happens.

It seems that shortly before releasing 0.4 I added a bug that makes the TX
window ignore keyboard input when any modifiers are on. In fact you can't
even type in CAPITAL letters...

Oh well, I will release 0.4.1 soon with this and another small bug fixed.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

