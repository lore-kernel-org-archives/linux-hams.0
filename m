From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Listen on a consol
Date: Mon, 5 Jun 2006 00:18:59 +0100
Message-ID: <20060604231859.GA20158@linux-mips.org>
References: <620c90570606031248i6b02af9ao4c872b96e53e3359@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c90570606031248i6b02af9ao4c872b96e53e3359@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sat, Jun 03, 2006 at 03:48:42PM -0400, Chuck Hast wrote:

> Folks,
> I use the listen command at times remotely. When I run it as a terminal
> window, I notice that I can no longer page back and look at what has
> scrolled off of the screen. I am trying to figure out what I have missed,
> but so far am hitting zero.

I suggest you run it in screen, which will give you scrollback even if the
OS doesn't such as in case of the limited scrollback abilities of the
Linux console.

  Ralf
