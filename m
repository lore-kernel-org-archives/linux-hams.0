From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: gcc-3.2.2 / libc-2.3.1 / gnome 2
Date: Fri, 11 Apr 2003 15:04:00 +0300 (EETDST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.HPX.4.10.10304111457420.17492-100000@saturn.trs.ntc.nokia.com>
References: <200304110027.32425.ailic@gmx.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304110027.32425.ailic@gmx.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Ilic <ailic@gmx.net>
Cc: linux-hams@vger.kernel.org

On Fri, 11 Apr 2003, Aleksandar Ilic wrote:

> There was a variety of reasons. gMFSK needs gnome-config, which no more 
> exists.

Actually gMFSK (0.4.1) needs GTK+ 1.2.x and Gnome 1.x. It won't work with
Gnome2/GTK2. In practice of course lack of gnome-config might be the first
thing you notice if you try to compile it without having GTK1/Gnome1 devel
stuff installed.

Anyway, I will be releasing gMFSK 0.5 soon. It's written for GTK2/Gnome2
so should work for you. Now I just need to stop adding new modes and
features to it and make a release...

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

