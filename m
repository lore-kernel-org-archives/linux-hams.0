From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: tcp.ip over ax25, when sent?
Date: Mon, 30 Dec 2002 18:28:35 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212301815320.6319-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org


On Sun, 29 Dec 2002 mvw@mvw.net wrote:

> Hello all,
> 
> When I use tcp/ip over ax25, I notice that packets are sent very
> frequently when I am on the keyboard. For some applications (e.g.  using a
> BBS, which is almost character-oriented) that is suitable, but for some,
> like telnet, it is inappropriate: my telnet sessions are 'de facto'
> almost line-oriented, so it would be best if packets were sent after a CR
> *or* after a delay of, say, 500 ms. That would prevent a LOT of unwanted
> radio traffic. Right now, a 10-letter word can generate 5-10 packets, when 
> one would be enough.
> 

> I am sure I am overlooking this, but can I set this? How? 

Once your telnet client connects, hit the escape sequence (typically
Control-] ). At the prompt, type 'mode line' to put your client in
line mode.


> 
> I have of course read the HOWTO etc but no doubt skipped over this. Many
> thanks for pointing me in the right direction.

I don't think it's mentioned anywhere. Perhaps a useful addition to 
the HOWTO?

Incidentally, I had a play with the telnetd server and line mode, some
time ago, but found that the line mode option wasn't compiled in. (a
pre-compiled binary...) I never got round to getting the sources, but
I reckon it would be worth a try to get the daemon to default to line
mode as well, for the reasons you mentioned. Anyway, have a look at
'man telnetd' and look for the -k option (from memory).

Hope this helps...


Wilbert, ZL2BSJ



