From: don <don_reid@comcast.net>
Subject: Trouble connecting to KPC3P-8.3-HM$
Date: Fri, 9 Feb 2007 14:02:35 -0800
Message-ID: <20070209220235.GA8814@reid1.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi.  I am new to this (sort of).  I have a new SignaLink sound card
modem and a laptop running Ubuntu.  I can talk to our local node a
little, but it seems to stop responding.  I wonder if my system is
doing something wrong.

There are logs attached from sessions, here is what happened:

I changed my ID to just "KE7JVS", the program still adds "-0" to that.
I also modified the code very slightly so the log data all goes to a
syslog file (changed 2 printfs into logprintf).

When I connected today, it took the "L" command and also "R 16" and
showed me the header and message contents.

When I tried to send a message (to "N8GFO"), it prompted for a subject,
but then didn't take any contents.  I gave up and disconnected.

The second time I connected, after trying the "Help" command, I tried
again to send.  This time I waited longer, and there was a prompt
for the message. 

	I first sent the subject at 13:12:55
	It didn't prompt for the message until 13:14:13, 78 sec later.

Then I sent a few lines of message.  It looks like the BBS never took
most of them.  If I red things right, it may have taken packet #6.
After about 12 min. I disconnected.

The 2 attached files are from these two accesses.

Yes I've been in contact with the Ctrl. Op.  I also asked him to send a
message to the BBS while I leave my setup running and logging.

73
Don KE7JVS
