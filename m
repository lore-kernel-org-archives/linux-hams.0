From: Bob Nielsen <nielsen@oz.net>
Subject: Re: AX25/NETROM
Date: Mon, 12 May 2003 17:39:36 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030513003936.GC5718@n7xy.net>
References: <S262447AbTELTDp/20030512190345Z+8235@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <S262447AbTELTDp/20030512190345Z+8235@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Ron, 

Several of the early 2.4 kernel versions apparently have problems with
AX.25.  I suggest you try 2.4.19 or 2.4.20 (will 2.4.21 ever get
released?)

In your ax25d.conf, you have a line:

#[ke7rt-0 via spideruse]

This line should not have a #.

73,
Bob, N7XY

