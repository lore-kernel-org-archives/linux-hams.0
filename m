From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Success! TWO questions remain
Date: Tue, 17 Dec 2002 18:37:29 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021217173729.GA13904@osterried.de>
References: <Pine.LNX.4.44.0212111645150.1297-100000@jeeves.mvw.net> <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

> In any case, another question. I want to be able to telnet into one
> machine from another using radio. Encryption is forbidden for amateur use
> so this means clear passwords. Not good. (Even though I will not use root, 
> of course).

the cleartext passwort for becoming root may be ommited with this
littel tool, on
http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/root/
(downloading the tarball (link on the bottom of the page is suggested)).

it does md5-password challenge in the standard way as bbs password
protection wroks.
this is some kind of one-way-password mechanism, and it does not matter
that anyone reads your answer string.

be aware that your ax25 connections with your PID=text session or
your ax25.ip.tcp telnet session _may_ be "overtaken" by someone else.

73,
	- thomas  dl9sau

