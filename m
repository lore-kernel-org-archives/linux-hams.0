From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: request for AX25 help
Date: Thu, 22 Jan 2004 21:45:02 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040122214502.C255@jeroen.pe1rxq.ampr.org>
References: <001601c3e125$b93e4010$554689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001601c3e125$b93e4010$554689d8@oem7paq6co5hph>; from wb8zrl@avalon.net on Thu, Jan 22, 2004 at 21:23:22 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vavra <wb8zrl@avalon.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On 2004.01.22 21:23:22 +0100 Tom Vavra wrote:
> # /usr/sbin/kissattach /dev/ttyS1 port1 44.1.1.1
> kissattach: Error setting line discipline: TIOCSETD: Invalid argument
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?

This kind of sais it all.... You have to load the mkiss module called
'mkiss.o' first.

Jeroen

