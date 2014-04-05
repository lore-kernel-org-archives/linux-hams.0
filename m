From: Stuart Longland <stuartl@longlandclan.yi.org>
Subject: Re: AX25IPD /tmp/unix98 invalid  export Variable AX25:
Date: Sat, 5 Apr 2014 13:30:45 +1000
Message-ID: <50a41b-n9s.ln1@atomos.longlandclan.yi.org>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
	<024rua-e6d.ln1@atomos.longlandclan.yi.org>
	<IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
	<14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
	<14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
	<dZbWwYCt4TPTFw8R@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thu, 03 Apr 2014 11:55:41 +0100, Paul Lewis wrote:

> Hi all..
> 
> AX25IPD /tmp/unix98 Invalid Variable
> 
> I run six ax25ipd interfaces using the old legacy Pty pairs for the past
> 15+ plus years. Spreading the load, in case an interface fails. ( run
> automated checks to bring the interface up on old system.
> Not sure how this can be done with unix98 as need the same dev/tty
> address statically assigned)

Not sure what the slaves are connected to, but I did post a patch that 
allowed kissattach to generate a predictable symlink to a slave PTY.

In fact what you're asking is a little unclear.  I have no idea what /tmp/
unix98 is supposed to be.

My patch to kissattach is here:
https://bugs.gentoo.org/attachment.cgi?id=373814&action=edit

I've used this with some init scripts in Gentoo Linux to allow Gentoo's 
openrc to automatically start up the AX.25 processes.

https://bugs.gentoo.org/show_bug.cgi?id=506146

I'm not sure what work would be needed in other Linux variants, should be 
doable in systemd/upstart/ye olde SysVInit, but I haven't investigated at 
this time.

