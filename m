From: "Riley Williams" <Riley@Williams.Name>
Subject: RE: Mixed network problem
Date: Thu, 26 Jun 2003 07:58:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BKEGKPICNAKILKJKMHCAGEFOEHAA.Riley@Williams.Name>
References: <002901c33bb5$287a2a00$0100a8c0@xp400>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <002901c33bb5$287a2a00$0100a8c0@xp400>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Colin Harris <chedward@tiscali.co.uk>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Hi Colin.

 > Anyone willing to converse off list with my networking problem ?
 > chedward@tiscali.co.uk  Apologies for being a bit off list.

I have no problem doing so, if you wish to email me.

 > 3 Linux boxes working fine but my newly setup Win XP machine
 > refuses to play ball ( along with the Win 98 SE box which
 > networks ok with win XP ). I guess this is a hosts lookup
 > problem or similar but win 98SE did manage to ping / telnet
 > / ftp to and from Linux before I introduced Win XP / pro into
 > the network. Those three functions are all I require in the
 > win = linux function.

Some basic questions:

 1. Do you have a DHCP server on your network?

 2. Do you have a DNS server on your network?

I run a network with several Linux boxes, one WinXPpro box and
one Win98 box, and all of them talk to each other without any
problems other than that the WinXP box doesn't respond to ping's
for the reason stated below.

My ADSL router is configured as a DHCP server that always
provides the same IP address to the same MAC address, and one
of my Linux boxes is configured to run bind and provide a DNS
server for the entire network. The DHCP server is set to supply
the Linux DNS server's IP address as the network DNS server.

 > I can ping Win 98 successfully but not XP.

That is correct - WinXP disables ping responses and this can't
be re-enabled in my experience. This is apparently part of M$'s
"Security through obscurity" policy - if one doesn't get a ping
response, one is not likely to try hacking further into that
particular system.

Personally, I'm rather cynical about the effectiveness of that
particular policy...

Best wishes from Riley.
---
 * Nothing as pretty as a smile, nothing as ugly as a frown.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.491 / Virus Database: 290 - Release Date: 18-Jun-2003

