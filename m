From: James Washer <washer@trlp.com>
Subject: newbie soundmodem question about mic vs line input
Date: Fri, 13 Feb 2004 10:02:03 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040213100203.62bbe780.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


I've got soundmodem working using the mic jack, but I'd rather use the line jack. When I try, I get nothing.. hence, the following questions.


1) Under linux, are the mic and line inputs mixed, or do they have seperate devices to open?

2) I can play with the mic/line/speaker/etc gains using aumix.. Does this have any effect on soundmodem, or does it set the gain using ioctls, etc.

3) The mic jack appears to be mono, where as the line jack appears to be stereo. Does soundmodem have any options to listen to the two channels seperately? i.e. I'd like to do APRS on one channel, and packet on another, but I fear that /dev/dsp is a mix. Is this correct? 

thanks

 - jim
