From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: Square One!
Date: Sat, 12 Apr 2003 15:58:54 +0200
Sender: linux-hams-owner@localhost
Message-ID: <3E981B9E.2070708@pi8zaa.ampr.org>
References: <Pine.LNX.4.44.0304120051130.1511-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0304120051130.1511-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: Aleksandar Ilic <ailic@gmx.net>

Tomi Manninen wrote:
> Are you sure slackware 9 doesn't have compatibility libs for earlier 
> versions? I'd be surprised if it doesn't. After all GTK1 and GTK2 are API 
> incompatible so a _lot_ of programs break there. My RH8 has both versions 
> installed and everything runs pretty smoothly...

Slackware 9.0 does not have libxml included in the distribution anymore.
However, you can simply install libxml-1.8.17-i386-1.tgz which was included in 
Slackware 8.1. There are no conflicts. I just tried and soundmodemconfig runs 
just fine on Slackware 9.0 if the libxml package from Slackware 8.1 is installed.

Your missing libs to be able to runs gmfsk are in the Slackware 8.1 package 
gnome-libs-1.4.1.7-i386-1.tgz
This package is a bit bigger than the previous one so I didn't check if it 
overwrites critical files which are already in an Slackware 9.0 package. But you 
could try...

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org

