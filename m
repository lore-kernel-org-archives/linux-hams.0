From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: XFBB Nightmares!
Date: Wed, 19 Mar 2003 16:08:48 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10303191601250.7151-100000@saturn.trs.ntc.nokia.com>
References: <E18vW68-00048x-00@yagi.h-net.msu.edu>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E18vW68-00048x-00@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 19 Mar 2003, Dennis Boone wrote:

> It sounds like the package you obtained is broken somehow.  The
> package file name you mentioned does not seem to be a source package,
> and the installation instructions sound like a binary package of some
> sort.  My (Debian) package doesn't include a binary called xfbb; I do
> have xfbbd and xfbbC.

It's probably not broken. It's just so old that the binary is linked
against a very old version of libc (libc5). Not having this lib installed
causes a somewhat misleading error message when one tries to execute the
binary. Some of the modern distributions might still have a compatibility
package for libc5 but it's probably not installed by default.

Anyway, I would recommend installing a newer version of xfbb. There are
binary packages available as people have already pointed out.

This is becoming a FAQ. I think Jean-Paul should do himself a favor and
remove the old binary packages from his web site... :)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

