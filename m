From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: nrattach "Cannot find free NET/ROM device" error!
Date: Wed, 2 Oct 2002 23:54:17 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210022353020.10853-100000@oh2bns.ampr.org>
References: <3D9B579E.A91FC4A3@kj6eo.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D9B579E.A91FC4A3@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Wed, 2 Oct 2002, Bill Walton wrote:

> Sounds easy but it doesn't work.  Here is what I get when I enter in the
> "nrattach netrom" command:
> 
> nrattach: SIOCGIFFLAGS: no such device
> nrattach: cannot find free NET/ROM device

Is netrom compiled as a module? Have you loaded the module?
(modprobe netrom)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

