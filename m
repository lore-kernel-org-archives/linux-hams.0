From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Simple BBS, again, sorry for asking twice.
Date: Tue, 24 Dec 2002 19:54:19 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212241945580.2791-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.44.0212240010320.10548-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212240010320.10548-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

On Tue, 24 Dec 2002 mvw@mvw.net wrote:

> ports and not on the ethernet port? I.e. telnet (unencrypted) only from 
> the ax25 ports.

Use the 'route' command. Make the radio port the default interface. 
All IP traffic will, from then on, use that port.

> 
> b) I use tcp/ip for mail etc. But apart from that I would like to set up a 
> simple messaging system/bbs, to use when someone goes to this system using 
> ax25. I do not need "do it all" systems, just a simple bbs (and it's a 

Consider using 'ax25d' to start up the 'mail' program, allowing people 
to send and receive local E-mail.

HTH...

Wilbert, ZL2BSJ



