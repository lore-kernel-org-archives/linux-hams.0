From: Dave Platt <dplatt@radagast.org>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 13:33:04 -0700 (PDT)
Message-ID: <20050809203304.4727.qmail@radagast.org>
References: <407645010508091213efc990f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <407645010508091213efc990f@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jlassoff@gmail.com
Cc: linux-hams@vger.kernel.org

> Well, I can get the driver loaded just fine, but what I am interested
> in doing is just a text connection. I want to just get some software
> running that gives the classic "cmd:" or ":" prompt. For example, I'd
> like to just get and send text to my local DX cluster. Any ideas?

In the usual Unix/Linux metaphor, these sorts of things are usually
done via individual stand-alone programs, invoked from the shell,
rather than from a monolithic program such as a "TNC command
interpreter emulator."

If the driver is loaded, and the AX.25 interface has been
configured with a portname, then you'd probably want to try
running commands such as:

   beacon -s myport -d HEADSUP "Santa Claus on 14.020 QRO"

or

   call myport W9ZZZ

or something like that.

You can run "listen -a" in another window to monitor the
packet traffic in both directions.

