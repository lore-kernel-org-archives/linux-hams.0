From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: ld - RH8 - config - Help!
Date: Wed, 9 Apr 2003 19:45:31 +0300 (EETDST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.HPX.4.10.10304091941360.2329-100000@saturn.trs.ntc.nokia.com>
References: <200304090833.24832.KB7NO@worldnet.att.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304090833.24832.KB7NO@worldnet.att.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 9 Apr 2003, Jack Heller wrote:

>         I installed two log programs, TWLog and TLF, with their
> required libraries.  I find neither able to boot due to "error while
> loading shared libraries."

Partly guessing here (more detailed error messages, if available, always
help), but possibly the libraries are installed in /usr/local/lib and that
is not in the library search path.

Check /etc/ld.so.conf and add /usr/local/lib in there if it's missing.
Then run 'ldconfig' and you should be all set.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

