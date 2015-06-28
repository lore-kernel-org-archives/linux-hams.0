From: me@vk4msl.yi.org
Subject: PTY Improvements for kissattach, kissnetd
Date: Sun, 28 Jun 2015 13:04:40 +1000
Message-ID: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

This is a re-based patchset for ax25-tools based on commit
18fa7fa6776da35da34a7e148fa2d96be8921e2.  It adds command line options to
kissattach and kissnet to permit two things:

- symbolic linking of pseudo TTYs to consistent names for referencing in
  configuration files.
- changing ownership/mode of pseudo TTYs so that they can be accessed by
  designated users/groups.

These patches have been in successful operation on my APRS digipeater here
in Brisbane.  http://aprs.fi/info/a/VK4MSL-1

