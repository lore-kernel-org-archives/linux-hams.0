From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Square One!
Date: Sat, 12 Apr 2003 00:57:40 +0300 (EEST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.44.0304120051130.1511-100000@oh2bns.ampr.org>
References: <200304111344.02353.ailic@gmx.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304111344.02353.ailic@gmx.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Ilic <ailic@gmx.net>
Cc: linux-hams@vger.kernel.org

On Fri, 11 Apr 2003, Aleksandar Ilic wrote:

> alek@bcat:~$ ldd `which gmfsk` |grep found
>         libgnomeui.so.32 => not found
>         libart_lgpl.so.2 => not found
>         libgdk_imlib.so.1 => not found
>         libgnome.so.32 => not found
>         libgnomesupport.so.0 => not found
> 
> No luck. Nothing isn't compiled on slack 9 itself. libgnomeui.so.32 is now 
> replaced with libgnomeui-2.so.0, and so on... I tried to change "libxml" to 
> "libxml2" in soundmodem's configure script, but there was different 
> structures in tree.h.

Are you sure slackware 9 doesn't have compatibility libs for earlier 
versions? I'd be surprised if it doesn't. After all GTK1 and GTK2 are API 
incompatible so a _lot_ of programs break there. My RH8 has both versions 
installed and everything runs pretty smoothly...

Anyway a new gmfsk is on it's way, I'm currently writing (updating)
README's and stuff like that... :)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

