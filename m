From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: wxGTK-2.4.0 (2)
Date: Wed, 15 Jan 2003 12:05:06 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10301151155040.6214-100000@saturn.trs.ntc.nokia.com>
References: <Pine.LNX.4.44.0301151950170.7507-100000@zl2bsj.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301151950170.7507-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: linux-hams@vger.kernel.org

On Wed, 15 Jan 2003, Wilbert Knol wrote:

> Hmmm...looks OK.

Yes, it does. Except maybe the --libs part which seems to point to a beta
version 1.3 of most of the libs...

> The config.log error message was, that it couldn't find gtk/gtk.h :
> 
> configure:12357: checking for GTK+ - version >= 2.0.0
> configure:12511: gcc -o conftest    -D_FILE_OFFSET_BITS=64 
> -D_LARGE_FILES  conftest.c   1>&5
> configure:12503:21: gtk/gtk.h: No such file or directory

Yeah. The real problem seems to be that the "configure" test compile
doesn't include the necessary flags so it's bound to fail. My guess was
that pkg-config wouldn't give the correct flags but it seems it does. So I
don't understand what is going on here...

> Shouldn't the gcc statement have included something like:
>    -I/usr/include/gtk-2.0

Yes. And pkg-config was supposed to supply it.

> I upgraded pkg-config to 0.14 as suggested, which didn't help (but is 
> worth having for the bug fixes:-).

The way I have understood it, it's the GTK2 installation that is
responsible for putting a file "gtk+-2.0.pc" or something like that in a
place where pkg-config finds it. That file has the knowledge about where
the headers and libs are located. So it's not pkg-config's fault if this
data is incorrect.

But like I said, I don't understand what happened as the pkg-config
output looks ok.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org


