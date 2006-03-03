From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Hard Drive Ghosting
Date: Fri, 3 Mar 2006 07:22:14 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0603030719200.1056@eskimo.com>
References: <6.1.2.0.2.20060302182940.025531c0@mail.sasktel.net>
 <9923fd660603021700j12b44602xc4e329d71ed7927a@mail.gmail.com>
 <44079AEC.2070905@wa7v.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44079AEC.2070905@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Mueller <wa7v@wa7v.com>
Cc: linux-hams@vger.kernel.org, appld@sasktel.net

On Thu, 2 Mar 2006, Brett Mueller wrote:

> As Curt and Doug both mention, "dd" is perfect for doing sector-level
> copying under native Linux.  "cp -a" and/or "rsync -a" (if you are
> updating an archive) are good tools for copying at the filesystem level...

I've done it via booting from a Tom's Root/Boot floppy disk, copying
a 6.4GB drive to an identical 6.4GB drive.

I might not get the command exactly right here, but it was something
like this

    dd if=/dev/hda of=/dev/hdb bs=512

It copies every sector until it runs out of sectors, so it copies
all of the empty space, windows partitions, linux partitions, boot
sectors, etc.  From the hda drive to the hdb drive in the above
command, in case that isn't obvious (don't want to copy in the wrong
direction now do we?).

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
