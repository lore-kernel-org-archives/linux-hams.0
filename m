From: "Philip Maley" <phil@wotech.com.au>
Subject: RE: kernel 2.4.21 and AX25 & netrom
Date: Tue, 2 Sep 2003 09:47:33 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <GPEOIGAEGJENDGILOEJKCEIEFHAA.phil@wotech.com.au>
References: <12777@9A0TCP>
Reply-To: <phil@wotech.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <12777@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

G'day Tihomir

I tried applying the patch to one of my systems today. It was an
unmodified 2.4.21 kernel and it returned one error from dmascc.c. I
don't use that drives so it should not be a problem for me, but it may
be for others.

root@shack:/usr/src# patch -p0 <9a4gl*
patching file linux-2.4.21/Documentation/Configure.help
patching file linux-2.4.21/drivers/net/hamradio/Config.in
patching file linux-2.4.21/drivers/net/hamradio/dmascc.c
Hunk #1 FAILED at 1.
1 out of 6 hunks FAILED -- saving rejects to file
linux-2.4.21/drivers/net/hamradio/dmascc.c.rej
patching file linux-2.4.21/drivers/net/hamradio/mkiss.c
patching file linux-2.4.21/include/linux/ax25.h

Here is dmascc.c.rej:

***************
*** 1,10 ****
  /*
!  * $Id: dmascc.c,v 1.1.1.1 2003/06/27 16:18:51 root Exp $
   *
   * Driver for high-speed SCC boards (those with DMA support)
   * Copyright (C) 1997-2000 Klaus Kudielka
   *
   * S5SCC/DMA support by Janko Koleznik S52HI
   *
   * This program is free software; you can redistribute it and/or
modify
   * it under the terms of the GNU General Public License as published
by
--- 1,11 ----
  /*
!  * $Id: dmascc.c,v 1.3 2003/07/04 06:15:49 9a4gl Exp $
   *
   * Driver for high-speed SCC boards (those with DMA support)
   * Copyright (C) 1997-2000 Klaus Kudielka
   *
   * S5SCC/DMA support by Janko Koleznik S52HI
+  * Software CRC check by Tihomir Heidelberg 9A4GL
   *
   * This program is free software; you can redistribute it and/or
modify
   * it under the terms of the GNU General Public License as published
by

73
Phil vk6ad

