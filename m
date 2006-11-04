From: "Jeff Laughlin (RV Melville)" <jlaughlin@ucsd.edu>
Subject: Ham::APRS::Parser v0.03 released
Date: Sat, 04 Nov 2006 15:54:32 -0800
Message-ID: <454D2838.6040307@ucsd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

Get it from http://sourceforge.net/projects/ham-aprs-parser/

Release notes:
* Fixed a bug in the MIC-E decoder that would sometimes cause small 
errors of up to 1 minute in longitude, affecting approximately 1 in 10 
packets.
* Fixed an error in the readme.txt command line example
* Moved Ham/aprs to Ham/APRS

NAME
    Ham::APRS::Parser - Perl module for parsing APRS packets into a
    consistent and easy to work with format

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
    hash containing the APRS data in a consistent and easy to process
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

