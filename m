From: "Vic" <radio@beer.org.uk>
Subject: Re: Hard Drive Ghosting
Date: Fri, 3 Mar 2006 10:30:52 -0000 (GMT)
Message-ID: <49375.84.43.68.228.1141381852.squirrel@84.43.68.228>
References: <6.1.2.0.2.20060302182940.025531c0@mail.sasktel.net>
Reply-To: radio@beer.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6.1.2.0.2.20060302182940.025531c0@mail.sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Can a Linux hard drive be ghosted?? If so, which ghost programme must
> be used and what environment must it be run?

dd is the way to do it if you want a genuine clone.

Make sure you've got DMA turned on on the drives you want to use (use
hdparm to check/set this) - it takes *forever* if you don't.

Then use something like :-

dd if=/dev/hda of=/dev/hdb bs=8192

(This will clone all of hda to hdb - you could do individual partitions
here if you want, but be sure to set up a partition table with fdisk
first).

If your source drive is broken in some way, dd_resscue is a nice variant -
it does the same as dd, but does what it can when it finds a broken
sector. It's about as good as you get without forensic data-recovery
kit...

If, on the other hand, you don't want a duplicate of the drive, you just
want to copy the files over, rsync -a is the way to go.

HTH

Vic.

