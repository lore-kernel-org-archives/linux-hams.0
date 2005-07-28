From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Hamlib: PTT Broken for Icom IC-746
Date: Thu, 28 Jul 2005 16:31:21 -0700
Message-ID: <4076450105072816315a3f8075@mail.gmail.com>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have an Icom IC-746 connected to my linux box through a level
converter. I have the latest hamlib (1.2.4) all setup, and most of the
functions work. The only qualm I have is that it will not trigger the
PTT on. There is a CI-V command on the serial bus to do it, but I get
the error: "set_ptt: error = Feature not available"
I'm not much for C, so I can't really find where this would be
implemented. Does anyone have any ideas?

Cheers,
Jonathan Lassoff (KG6THI)
