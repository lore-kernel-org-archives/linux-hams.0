From: Tapio Sokura <oh2kku@iki.fi>
Subject: Re: AX25 Coding Questions
Date: Fri, 12 Jul 2002 12:23:02 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0207121206500.15761-100000@mail.webbs.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

TIMOTHY POWELL wrote Thu, 11 Jul 2002 17:59:47 -0700 (PDT):
> C++. Where can I find documentation on receiving the
> ax25 packet frames from the kernel and some C or C++
> coding examples?

Have you checked out the sources of listen, the ncurses based ax25 packet
monitor? It's distributed as a part of ax25-apps. I haven't checked out
other pieces of code as ax25 reference so I can't compare the quality of
coding, but it was enough for me (relatively inexperienced) to
make a simple dx cluster monitoring program in C.

