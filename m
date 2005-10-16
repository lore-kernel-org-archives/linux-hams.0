From: Hamish Moffatt <hamish@cloud.net.au>
Subject: kernel oops / TIOCSETD fail on kissattach
Date: Sun, 16 Oct 2005 11:33:41 +1000
Message-ID: <20051016013341.GA5894@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I'm running 2.6.12 on amd64, and trying to set up a KISS TNC.
The TNC is on /dev/ttyS0 and I have the serial driver loaded
(linked into the kernel).

When I run kissattach (where "APRS" is my port in /etc/ax25/axports):

kissattach /dev/ttyS0 APRS 192.168.250.1

it fails telling me TIOCSETD: no such device, and a few seconds later
the kernel oopses in random places, like in the pdflush kernel thread
and the like.

Is this something already fixed with Ralf's latest patches?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
