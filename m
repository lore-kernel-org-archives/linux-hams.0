From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: mkiss, udev and kernel 2.6
Date: Tue, 02 Nov 2004 17:48:51 +0100
Message-ID: <4187BA73.2080908@ccr.jussieu.fr>
References: <20040729113651.6517fe27@dell_ss3.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040729113651.6517fe27@dell_ss3.pdx.osdl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hi,

Does someone have an experience with mkiss and udev in 2.6 kernel ?

I need to use mkiss-kissattach to drive a dual port TNC 1200/9600 KPC9612.

However I don't see how to set up a master-slave pseudo tty system with 
udev.

Actually, I went through by instructing the kernel to load devfs at boot 
(append="devfs=mount... " in lilo.conf.

But Is there any other solution with udev alone (without devfs) ?

73 de Bernard, f6bvp
