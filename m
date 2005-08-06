From: Arno Verhoeven <linux-hams-list-rcvr@sharon.esrac.ele.tue.nl>
Subject: Re: Xastir version 1.6.0 released
Date: Sat, 06 Aug 2005 10:59:02 +0200
Message-ID: <42F47BD6.6020806@sharon.esrac.ele.tue.nl>
References: <Pine.SUN.4.58.0508011252400.9302@eskimo.com>	 <42F30023.1050803@sharon.esrac.ele.tue.nl> <d5d4185b05080515424c6bd65@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <d5d4185b05080515424c6bd65@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeremy Utley <jerutley@gmail.com>
Cc: linux-hams@vger.kernel.org

Jeremy Utley wrote the following on 2005-08-06 0:42:
> Woah - Patrick accepted Xastir into the main Slack distro?  I've
> maintained the binary slack-packs for 10.0 and 10.1 on my FTP.
> 
> Will this copy of Xastir be linked to the ax.25 libs?  IIRC, those
> aren't part of the default Slack install either.
> 
> Jeremy, NW7JU
> 

Pat accepted Xastir and other ham packages already many years ago.

I have been creating/maintaining ham related binary packages since 1998.
http://sharon.esrac.ele.tue.nl/pub/slackware/attic/libc5/

Since Slackware 7.0 Pat included my binary packages in the distro.
ftp://ftp.slackware.com/pub/slackware/slackware-7.0/contrib/ham/

The first Xastir package that was included in Slackware was 
xastir-1.1.2, which was included in slackware-8.1.
ftp://ftp.slackware.com/pub/slackware/slackware-8.1/extra/ham/packet/

The xastir-1.6.0 Slackware package has been configured using the
following external libraries.

Building with AX25 .............................. : yes
Building with Festival .......................... : no
Building with GPSMan ............................ : no
Building with ImageMagick ....................... : yes
Building with libproj ........................... : yes
Building with GeoTiff ........................... : yes
Building with GDAL/OGR .......................... : no
Building with ShapeLib .......................... : yes
Building with pcre .............................. : yes
Building with dbfawk ............................ : yes
Building with map caching ....................... : no
Building with ErrorPopups ....................... : no
Building with libgc (Debug) ..................... : no
Building with profiling (Debug) ................. : no
Building with rtree indexing (experimental) ..... : no

Slackware AX.25 packages, as well as proj, libgeotiff, and shapelib can 
be found in the same directory as the other Slackware ham packages.
ftp://ftp.slackware.com/pub/slackware/slackware-current/extra/ham/

Before they are included in the main Slackware distro, I usually publish 
  new packages on http://sharon.esrac.ele.tue.nl/pub/slackware/  (check 
the various *_updates directories)

While we're on the subject of Slackware ham.... I could use some help 
testing and/or creating Slackware packages. These days I'm more busy 
than 5-7 years ago, and I now only focus on packages that I actually use 
myself (or want to use, but haven't gotten around to do so :-)
Drop me a line if you want to work together on this.

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org
