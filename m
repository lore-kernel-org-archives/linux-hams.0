From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Regarding XFBB Nightmares!
Date: Thu, 20 Mar 2003 19:28:09 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0303201922410.1307-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.21.0303202204540.2250-100000@zl2bsj.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0303202204540.2250-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Thu, 20 Mar 2003, Wilbert Knol wrote:

> > What would be the easiest way to get around this dependency problem?
> 
> Toss those RPMs && compile from sources, against libc.so.6

RPMs, if made properly, are _very_ handy things. Unfortunately the FBB RPM
doesn't seem to be very well made. It seems to contain stuff that should
not be there (not part of the FBB distribution), some of it is linked
against libc5, some against glibc. Also there is at least one script that
clashes with LPRng on my RH8 box.

Does anyone have a pointer to a good .spec file or *source* RPM for FBB ?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

