From: Stuart Longland <me@vk4msl.yi.org>
Subject: Revised AX.25 multicast patch
Date: Sun, 23 Mar 2014 17:40:57 +1000
Message-ID: <1395560458-9576-1-git-send-email-me@vk4msl.yi.org>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hi all,

This is a revised patch for my earlier one.  I've found it's sometimes needed
to tweak the TTL on multicast packets.

This allows such tweaking to occur: by adding the 'mcttl' command to the config
file one can set the TTL of outgoing packets.

-- Stuart Longland

