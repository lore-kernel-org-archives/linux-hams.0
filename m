From: Aleksandar Ilic <ailic@gmx.net>
Subject: Re: Square One!
Date: Fri, 11 Apr 2003 13:44:02 +0200
Sender: linux-hams-owner@localhost
Message-ID: <200304111344.02353.ailic@gmx.net>
References: <Pine.LNX.4.33.0304110739040.10175-100000@zoef.pe1icq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0304110739040.10175-100000@zoef.pe1icq.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Friday 11 April 2003 07:40, Arno Verhoeven wrote:
> Did you try the pre-compiled soundmodem package that is included with
> Slackware 9.0? (it's in /extra/ham/packet)

alek@bcat:~$ ldd `which soundmodemconfig` |grep found
        libxml.so.1 => not found

Also, I've found gmfsk package there:

alek@bcat:~$ ldd `which gmfsk` |grep found
        libgnomeui.so.32 => not found
        libart_lgpl.so.2 => not found
        libgdk_imlib.so.1 => not found
        libgnome.so.32 => not found
        libgnomesupport.so.0 => not found

No luck. Nothing isn't compiled on slack 9 itself. libgnomeui.so.32 is now 
replaced with libgnomeui-2.so.0, and so on... I tried to change "libxml" to 
"libxml2" in soundmodem's configure script, but there was different 
structures in tree.h.
OK, obviously we all need a little more patience.

Regards,
Alek
--
  73 de YU1IS


