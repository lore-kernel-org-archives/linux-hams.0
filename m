From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: ANNOUNCE: gMFSK v0.4.1
Date: Wed, 24 Apr 2002 22:11:06 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204242047010.11663-100000@oh2bns.ampr.org>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I just uploaded gMFSK v0.4.1 to hes.iki.fi. For those who don't know,
gMFSK is a MFSK16, RTTY and THROB soundcard terminal program for Linux
(using the Gnome libraries).

This is primarily a bugfix release but there are a few new features as 
well.

A short list of changes:

 - keyboard input with any modifiers was ignored making it impossible
   enter uppercase letters for example, fixed

 - fixtexts could not be saved, fixed

 - implemented command substitution macros, so something like
   "My OS is $(cat /etc/redhat-release) with kernel $(uname -r)."
   in your brag-file should work

 - the list of bands in the QSO data combovox is now configurable
   (but remember that you can always type whatever you want to the
    entry field as well)

 - time and date macro format strings are now fully configurable

 - with the two new features listed above I removed the "short" time/date
   macros. The command substitution macros should give you enough
   flexibility

 - waterfall draws the frequencies a bit differently now

So there. The source code and rpms can be found at

  http://hes.iki.fi/pub/ham/unix/linux/hfmodems/

Have fun!

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org


