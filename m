From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: Hard Drive Ghosting
Date: Thu, 02 Mar 2006 17:25:00 -0800
Message-ID: <44079AEC.2070905@wa7v.com>
References: <6.1.2.0.2.20060302182940.025531c0@mail.sasktel.net> <9923fd660603021700j12b44602xc4e329d71ed7927a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660603021700j12b44602xc4e329d71ed7927a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: appld@sasktel.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 3/2/2006 17:00, Douglas Cole wrote:
> On 3/2/06, Doug <appld@sasktel.net> wrote:
>>Can a Linux hard drive be ghosted?? If so, which ghost programme must
>>be used and what environment must it be run?
> 
> Norton Ghost will copy a Linux hard drive (ext2 filesystems anyway)...

- From Symantec site on Ghost:
"Sector-based and file-based disk imaging creates file images of any
FAT, NTFS, EXT2, and EXT3 file system"

Looks like it must be run from Windows.

> If the source and destination drives are the same architecture/size
> then just use 'dd'  ;^}

As Curt and Doug both mention, "dd" is perfect for doing sector-level
copying under native Linux.  "cp -a" and/or "rsync -a" (if you are
updating an archive) are good tools for copying at the filesystem level...

73,

Brett

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iD8DBQFEB5rs+/Ps1x4JxWYRAhEiAJwMt61e22iOplfHFqY+5hAV1dKDyQCggT9i
nyTdfZAhu6LrW0/Owd/aEu8=
=A9JF
-----END PGP SIGNATURE-----
