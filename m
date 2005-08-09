From: Jeff Laughlin <jeff.laughlin@gmail.com>
Subject: Announcing Ham-APRS-Parser version 0.02
Date: Tue, 9 Aug 2005 00:44:17 -0400
Message-ID: <8ea83f4050808214448996701@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

http://aprs.n1ywb.com/Ham-APRS-Parser-0.02/

I've added support for a bunch more APRS data. Please check it out and
let me know how it goes.

Any ideas where else I could announce this to get some knowledgable
people to look at? Not places like eHam.com... I've posted it on
#hamradio on irc.freenode.net...

I applied to make this a sourceforge.net project, haven't heard back
from SF yet though.

NAME

Ham::APRS::Parser - Perl module for parsing APRS packets into a
consistant and easy to work with format

SYNOPSIS

        use Ham::APRS::Parser;

        my $aprsPacket =
parseAPRSPacket("EA1EKE-8>TR3UTW,EC1H-12,EA1A-3*,qAo,EA1URO-10:`|@+
,>/>"9f}");

        while( my ($k, $v) = each %$aprsPacket ) {
                print "key: $k, value: $v\n";
        }

DESCRIPTION

Insert plaintext aprs packets from APRS-IS, get back a reference to a
hash containing the APRS data in a consistant and easy to process
format.

The above code will yield the following hash:

        %$aprsPacket = {
                'AMBIGUITY' => 0,
                'COMMENT' => '"9f',
                'COURSE' => 234,
                'FROM' => 'EA1EKE-8',
                'LAT' => '42.5911666666667',
                'LON' => '-6.6025',
                'MICE_CURRENTNESS' => 'CURRENT',
                'MICE_MSG' => 'En Route',
                'PATH' => 'EC1H-12,EA1A-3*,qAo,EA1URO-10',
                'SPEED' => '75.932',
                'TO' => 'TR3UTW'
        };

Be careful, because Mic-E packets use the TO field as data, not a real
callsign. Also Mic-E packets may contain non-printing chars, although
the output should be 100% printable.

The module tries to be fast by using dispatch tables and not using
regular expressions unecessarily.

I wrote this module because I wanted to translate APRS packets into
KML files for displaying on Google Earth. Unfortunately Google Earth
can't handle the tens (or hundreds) of thousands of APRS stations all
at once. I will keep working on ways to get around this.

Other neat applications might be an advanced, highly intellegent
digipeater. Or a free open source findu.com replacement using Google
Maps.

Currently the module should mostly reliably return these fields from
position reports, Mic-E position reports, and compressed position
reports:

    * TIME_FORMAT
    * TIME
    * GPS_FIX
    * NMEA_SRC
    * COMP_ORIG
    * ALTITUDE
    * COURSE
    * LAT
    * LON
    * SYMBOL
    * MESSAGING
    * MICE_MSG
    * MICE_CURRENTNESS
    * MICE_DEVICE
    * FROM
    * PATH
    * TO
    * COMMENT
    * AMBIGUITY
    * SPEED
    * RANGE
...

Thanks

73 de n1ywb
