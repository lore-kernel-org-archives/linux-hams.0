From: Ricardo Saiz Villoria <ea1apm@amsat.org>
Subject: about ax25ipd
Date: Tue, 16 Apr 2002 19:50:15 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204161909100.2225-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hello to all

Many thanks for the answers about ax25ipd. The pipe between ax25ipd and
kissattach works perfectly now. But a different problem has appeared.

We have four computers in my radioclub. Axip works fine between any given
two, except with the two ones I'm most interested in. They have linux,
win200 with flex32, win95 with 16 bit flexnet, and ms-dos with 16 bit
flexnet. I can connect from anyone to any other, BUT I can't connect from
linux to the computer with dos, the one which has the TNC.

In fact, linux can hear packets from the dos machine, and it actually
answers to SABM petitions (as seen from tcpdump), but nothing is received 
at the other end.

All the links are configured as udp via port 93. I also tried port 10093
and raw ip with no success.

Any help would be appreciated
thanks in advance

-- 
Ricardo Saiz Villoria EA1APM
AX.25:  ea1apm@ea1rkv.eapo.esp.eu
WEB:	http://www.qsl.net/ea1apm
E-MAIL: mailto:ea1apm@amsat.org

