From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Netrom Broadcast
Date: Thu, 11 Mar 2004 17:52:44 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1079020363.1284.31.camel@oh2bns.ampr.org>
References: <001101c4077d$cba85690$0200a8c0@albertla>
	 <32623.194.140.66.170.1079019823.squirrel@palotes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <32623.194.140.66.170.1079019823.squirrel@palotes.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Thu, 2004-03-11 at 17:43, Ruben Navarro Huedo wrote:

> nos     1       200     100     1
> xnet    1       200     100     1
> 
> And it only TX netrom frames in nos port.

Have you monitored long enough? Netromd doesn't send on all port
at the same time. Instead it send first on one port, then on the
second, third and so on...

-- 
Tomi Manninen / OH2BNS / KP20ME04

