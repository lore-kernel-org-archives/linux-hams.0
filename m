From: Claude <info_list@f5pbl.fr>
Subject: Re: R: Re: AX25 write up anywhere?
Date: Mon, 03 May 2010 22:28:39 +0200
Message-ID: <4BDF31F7.3010404@f5pbl.fr>
References: <21698816.680381272878404600.JavaMail.root@ps19> <019ab659d50e2766ec48e48f38a8bc87@localhost> <4BDF24E2.2090809@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BDF24E2.2090809@tiscali.it>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello Luigi,

> BTW, I know that Ubuntu comes out with the AX25 precompiled (as default)
> inside the kernel... isn't it ?!?

Yes; the modules are yet present in the default kernel. You can check that
by using modprobe ax25 and then lsmod.
But you may know that it is always better to compile the libs on your own
system. But of course, the default config may work fine on your side
without recompiling the libs from sources.

73,
Claude, F5PBL

