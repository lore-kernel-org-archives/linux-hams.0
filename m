From: mvw@mvw.net
Subject: tcp.ip over ax25, when sent?
Date: Sun, 29 Dec 2002 22:18:51 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
References: <Pine.LNX.4.44.0212272203520.1392-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212272203520.1392-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello all,

When I use tcp/ip over ax25, I notice that packets are sent very
frequently when I am on the keyboard. For some applications (e.g.  using a
BBS, which is almost character-oriented) that is suitable, but for some,
like telnet, it is inappropriate: my telnet sessions are 'de facto'
almost line-oriented, so it would be best if packets were sent after a CR
*or* after a delay of, say, 500 ms. That would prevent a LOT of unwanted
radio traffic. Right now, a 10-letter word can generate 5-10 packets, when 
one would be enough.

I am sure I am overlooking this, but can I set this? How? 

I have of course read the HOWTO etc but no doubt skipped over this. Many
thanks for pointing me in the right direction.

Michael va3mvw



