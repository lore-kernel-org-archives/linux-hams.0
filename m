From: "AE5PL Lists" <HamLists@ametx.com>
Subject: RE: ax25 Questions
Date: Fri, 4 Jun 2004 13:12:12 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <478F6623898BBC4DBD692A223D28298A05A630@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Well, I have got the answers, sort of.

> -----Original Message-----
> From: AE5PL Lists
> Posted At: Thursday, June 03, 2004 10:40 PM
> Subject: ax25 Questions
> 
> recvfrom may be returning the size of the longest packet 
> received instead of the current packet length.  I suspect 
> this problem is in the javax25 native code, but I figured I 
> would throw it out anyway.

As I suspected, this was in the javax25 native C code and has been
corrected.

> sendto seems to wait for the socket to become free if a 
> recvfrom is pending.  The idea is to be able to have one 
> thread wait for an incoming packet while another thread can 
> send a packet(s) based on a timer.

This seems to be due to the fact that the socket is opened in blocking
mode.  I was able to circumvent this problem by opening a socket for
receive and another socket to the same port for transmit.  Works fine.

I have added jaAPRSIGate as an adjunct to javAPRSSrvr over the last two
weeks.  It is a full featured IGate which works in conjunction with
javAPRSSrvr.  javAPRSSrvr and javAPRSIGate run on virtually any machine
with a 1.1.4 JVM or higher.  There are TNC interfaces for javAPRSIGate
for KipSS (Windows), AGWPE (Windows), KISS TNC's (Windows and Linux),
and now ax25 (Linux).

For those Java developers out there, javax25 (on sourceforge.net) is a
nice tool for ax25 socket work.

73,

Pete Loveall AE5PL
mailto:pete@ae5pl.net
