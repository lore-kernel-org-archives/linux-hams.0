From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: ax25/aprs with perln
Date: Thu, 15 Aug 2002 09:44:50 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.44.0208150941110.20993-100000@dogbert.tc.fluke.com>
References: <20020814204516.A7335@goliath.geekthing.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020814204516.A7335@goliath.geekthing.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Fugina <robf@geekthing.com>
Cc: linux-hams@vger.kernel.org

On Wed, 14 Aug 2002, Rob Fugina wrote:

> Does anybody have any AX25 socket programming examples in perl?
>
> Has anybody every seen an APRS perl module (or set of modules)?
> I'm looking for something that can be used to both encode and decode
> APRS packets.  If I can't find one, I'll be forced to write it myself...

I wrote aprsd.pl, which is a minimal subset of aprsd written in
Perl.  I spawns off child processes for each connection, whether it
be a child connection or a server.  Handles multiple connections of
each type.  That might be a good place to look at normal socket
programming, but not AX25 sockets.  I haven't done anything with
AX25 sockets in Perl yet.

Ian wrote a Perl APRS decoder while he was editing the APRS spec for
release.  It helped him to figure out how to write the spec
properly.  That would be a great starting point for your decoding.
I think he posted it to the aprsspec and/or aprssig list a while
back.

aprsd.pl is at ftp://ftp.eskimo.com/u/a/archer somewhere, probably
under the aprs or xastir directories.  Haven't looked recently.

Curt Mills, WE7U                         hacker.NO_*SPAM@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U

