From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: The Sudden Death XFBB "Unknown return value 127" Error!
Date: Sat, 5 Oct 2002 23:47:32 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210052320130.16344-100000@oh2bns.ampr.org>
References: <3D9F494D.4003D9E6@kj6eo.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D9F494D.4003D9E6@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Sat, 5 Oct 2002, Bill Walton wrote:

> with.  I am getting the sudden death XFBB error from hell "Unknown
> return value 127"!.  I have edited all the files that I consider to be
> important...especially:

I'm not sure but I think the return value 127 is not really a return value
from the xfbbd binary (indicating an error in xfbbd configuration) but a
"pseudo return value" from the shell script that is trying to execute the
binary. This would mean that it's a problem in starting xfbbd, not in
running xfbbd.

Have you tried running the xfbbd binary directly? I think by default it's 
/usr/sbin/xfbbd. Does that give any errors? And what if you try
'ldd /usr/sbin/xfbbd' ? Does that give any "not found" errors?

How did you install FBB? Did you compile from source or did you install a 
pre-compiled package?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org


