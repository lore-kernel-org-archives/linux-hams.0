From: Ray Heasman <nurf@spamcop.net>
Subject: Re: Tracking down a Linux crash (update)
Date: 18 Oct 2002 10:41:25 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1034962886.26779.21.camel@maze.mythral.org>
References: <200210160935.19272.w9ya@amsat.org> 
	<3489387.1034931722@WUSJA129861-8HP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3489387.1034931722@WUSJA129861-8HP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Ackermann N8UR <jra@febo.com>
Cc: linux@lists.tapr.org, linux-hams@vger.kernel.org

Hi John,

One more thing you should consider with an AMD CPU - make sure you have
"mem = nopentium" appended to your kernel boot line. This is usually set
in your lilo.conf using the "append" keyword.

This resolves (mostly) some nasty conflicts you can get between AMD
cache memory and AGP memory. This stopped my AMD system from randomly
freezing. Since then, the only reboots I have had have been to upgrade
kernels.

Oh, and the Mozilla-Flash freeze only freezes Mozilla, not your whole
system.

Cheers,
Ray
ZR6RAY




