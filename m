From: Stuart Longland VK4MSL <me@vk4msl.yi.org>
Subject: Packet BBSes on ax25d
Date: Sun, 23 Mar 2014 18:02:58 +1000
Message-ID: <i2h20b-t7c.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi all,

Well, I'm in the midst of setting up an experimental packet station.
Amongst other things, I've set up ax25d with Unode and uucico.

Those work fine.  I can "dial in" using ax25_call to the UUCP service to
exchange files, news and mail.  I can also call in to the node service.

I'm looking around for something that can act as a BBS to work with
software like Outpost PM (http://www.outpostpm.org) so we can evaluate
it.

Among the packet BBSes it talks to is F6FBB BBS.  Well, I managed to
find sources, compile those, install them.

Then comes the fun bit of configuring.  So far as much as I get is a
telnet interface that tells me my callsign isn't registered no matter
what callsign I put in, and a AX.25 SSID that beautifully emulates
/bin/cat.

Utterly useless.  I've clearly done something wrong, but it's going to
require some digging to find out what.

So since ax25d works, I'm on the look-out for some BBS software that
could possibly work within ax25d.

I recognise this has been asked before: back in 1998.  I ask now
in case things have changed.

Has anyone seen such software?
Regards,
Stuart Longland

