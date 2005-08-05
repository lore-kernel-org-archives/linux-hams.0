From: Jeff Laughlin <jeff.laughlin@gmail.com>
Subject: Announcing Perl module for parsing APRS packets
Date: Fri, 5 Aug 2005 17:26:42 -0400
Message-ID: <8ea83f405080514263ae2ec3d@mail.gmail.com>
Reply-To: Jeff Laughlin <jeff.laughlin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

Hello,

I've written a Perl module, Ham::APRS::Parser, for parsing APRS
packets, and I've released it under the GPL. You can find it here:
http://aprs.n1ywb.com/Ham-APRS-Parser-0.01/

It takes the packet string, parses it, and returns a hash with the
data in a consistent and easy to process format. Currently it reliably
returns position, from and to calls, digi-path, symbols, and Mic-E
status reports from normal position reports, compressed position
reports, and Mic-E position reports. More work is needed to fully
implement the APRS protocol.

Once the data is in a friendlier format in the hash structure, it can
be used to generate Google Earth KML, or combined with the Google Maps
API to create a FOSS findu.com replacement.

OK this is actually from my IARU 2005 contest log but these could just
as easily be APRS stations :)
http://www.n1ywb.com/pics/iaru05.jpg

Also I would like to start working on a complementary module to
construct APRS packets from the hash structure returned by the parser
module. Applications could include a highly intelligent digipeater.

Comments and suggestions are appreciated.

73 de n1ywb
