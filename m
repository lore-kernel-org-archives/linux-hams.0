From: Chris Kantarjiev <cak@dimebank.com>
Subject: Re: debugging KISS basics
Date: Sun, 30 Nov 2008 06:50:16 -0800 (PST)
Message-ID: <200811301450.mAUEoG35030056@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f6bvp@free.fr
Cc: linux-hams@vger.kernel.org, vk2tv@exemail.com.au

> 
> When TNC is in KISS mode you cannot issue any more command to it.

You missed my point, I think. I wasn't trying to issue "command mode"
commands to it - I was trying to send KISS commands to it, with no
effect.

But I seem to be past that now - I can use "call" and "listen"
and it seems to work. Great progress...

Is there some command I can use from a shell scrip to set the
speed of the TTY, so I can send the KISS initialization script? Right
now, my TNC doesn't seem to preserve KISS mode across power cycles,
so I want to make sure it gets initialized at reboot...

73 de chris K6DBG
