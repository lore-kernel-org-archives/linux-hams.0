From: Dennis Boone <drb@msu.edu>
Subject: Loss of connection state?
Date: Tue, 15 Mar 2022 17:32:44 -0400
Message-ID: <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
Reply-To: drb@msu.edu
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-ID: <14067.1647379964.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Folks,

Here's an axlisten dump of an incoming ax25 session.  The path between
my station (KB8ZQZ) and the other end (W8TCC) is a little marginal, and
some packets are occasionally lost.

Once my end received the RR1+ at 21:02:20, should it not have resent the
I01 packet?  Is this bug in my understanding, or in the linux kernel?

nino: fm W8TCC to KB8ZQZ ctl SABM+ 21:01:33.281614 
nino: fm KB8ZQZ to W8TCC ctl UA- 21:01:33.306663 
nino: fm KB8ZQZ to W8TCC ctl I00^ pid=F0(Text) len 70 21:01:33.320522 
0000  P2P only; note that if I can't reach you direct, I cannot respon
0040  d P2PM
nino: fm KB8ZQZ to W8TCC ctl I01+ pid=F0(Text) len 55 21:01:33.341994 
0000  ;FW: KB8ZQZM[Pat-0.12.1-B2FHMG$]M; W8TCC DE KB8ZQZ ()>M
nino: fm W8TCC to KB8ZQZ ctl RR1v 21:01:38.125616 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:01:48.296217 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:08.775673 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:02:20.726051 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:02:20.734985 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:39.495671 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:05.669523 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:05.678565 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:12.782127 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:12.791099 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:17.868836 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:17.879992 
nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:03:20.454989 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:25.586093 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:25.599152 
nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:30.669941 
nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:30.679536 
nino: fm W8TCC to KB8ZQZ ctl DMv 21:03:38.636458 

(Scattered stray M characters were reverse video in the color original,
representing carriage returns.  Don't think that's relevant here.)

De
