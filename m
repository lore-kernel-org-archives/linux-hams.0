From: Thomas Osterried <thomas@osterried.de>
Subject: Re: mkiss problem
Date: Mon, 23 Jun 2003 03:00:07 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030623010007.GA4558@osterried.de>
References: <3EF64733.00000B.01608@gizmo>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3EF64733.00000B.01608@gizmo>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Wells <mvc2@dodo.com.au>
Cc: linux-hams@vger.kernel.org

> mkiss: ax1: truncating oversized transmit packet!
> Usually when this happens I have to reboot the system to restore the port to
> a working condition, [..]

seen this too.
with 6pack. very seldomly.
if this happens, ifconfig sp0 showed very strange statistics.

i assume there was an overflow, writing data to to the struct (and
thought it was caused by my 6pack enhencements for my pr430 xmitter).

> I'm not sure of what information I should include here so I'll post what I
> think might be relevant.

do you see a chance to reproduce it?

> The machine is a Pentium 166 with 32M RAM running Debian 2.2.r0 with kernel
> 2.2.20 running xfbb (7.04h) and fpac (3.25).

debian woody, p233, 64MB ram, kernel 2.4.18 run here (my notebook).

73,
	- thomas  dl9sau

