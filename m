From: Curt Mills <archer@eskimo.com>
Subject: Re: gmfsk compile
Date: Sat, 7 Jan 2006 11:11:56 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0601071108450.16143@wapiti.we7u.net>
References: <43BFCBEA.7090009@blueyonder.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43BFCBEA.7090009@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard <richard.bown@blueyonder.co.uk>
Cc: linux-hams@vger.kernel.org

On Sat, 7 Jan 2006, richard wrote:

> Hi guys
> can anyone throw some light on this compile failure.
> gcc-4.0.1, kernel-2.6.12-14mdk, mandriva 2006CE, FFTW 2.1.5 and fftw3( needed
> for other apps)
> gmsk-0.6,hamlibs 1.2.4 + devel

It's GCC-4 that's doing it to you.  It enforces stricter compliance
with the C specs.

You'd need to go back to the developers and have them change the
code so that it was in compliance with what GCC-4 expects.  We had
to do that for the Xastir project because defining functions inside
functions isn't allowed in GCC-4.x.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
