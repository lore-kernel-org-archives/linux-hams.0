From: David Ranch <linux-hams@trinnet.net>
Subject: soundmodem and fsk 9600 baud
Date: Sun, 30 Aug 2009 19:35:40 -0700
Message-ID: <4A9B36FC.4090409@trinnet.net>
References: <S1753962AbZH3VbK/20090830213110Z+828@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <S1753962AbZH3VbK/20090830213110Z+828@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello Everyone,

I'm new to the list and I'm curious if many people have had much luck
with Tom Sailer's excellent Linux soundmodem 0.14 found in the URL below:

   http://www.baycom.org/~tom/ham/soundmodem/


This is using:
  - Centos 5.3 (modified kernel) and full up to date AX25 stack
  - Dell Insperion 600 with a intel8x0 based AC97 soundcard

All of this is working well for me at afsk:1200 with a Kenwood TH-F6A.
The F6A has a 9600 TNC mode but I haven't had any luck at 9600.  I
imagine much of my problems are due to volume levels but I'm not even
getting decodes.

Thoughts?


Ps.  I was also curious if other people notice that when running
soundmodemconfig in "scope" mode, the display works for say 3-8 seconds
and then hangs up.  I can eventually close the window but it won't work
again until I restart soundmodemconfig.

--David
