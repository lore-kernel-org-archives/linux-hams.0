From: Jeff Laughlin <jeff.laughlin@gmail.com>
Subject: Announcing Trackulator, free open source web based APRS client
Date: Wed, 24 Aug 2005 22:25:05 -0400
Message-ID: <8ea83f4050824192570f0905a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

http://www.trackulator.com/

Try it out at: http://www.trackulator.com/tracku.cgi
% is the wildcard although it currently will only use the first callsign found.

Get it from https://sourceforge.net/projects/trackulator/

Trackulator depends on Ham::APRS::Parser, get it from
http://sourceforge.net/projects/ham-aprs-parser/

A few technical notes
I had to pare down the schema quite a bit, it had some nice features
in it originally but it was putting way too much load on my server.
Granted I'm taking a full APRS-IS stream, if you use a filter it will
be a lot less data. If you hook it up to your TNC and just use it on
your local APRS net the load on your computer should be negligible.

I'm planning to incorporate PostGIS, I just haven't got around to it yet.

Ham::APRS::Parser still needs some work, it's pretty ornery when it
comes to malformed APRS packets, or APRS formats that it's not yet
familiar with. I have to wrap calls to it in eval{} in case it dies.

There's still quite a bit of functionality missing before Trackulator
will be competitive with findu.com but we can get there. The nice
thing about Trackulator is that if you wish you can hook it up to your
TNC and just use it to monitor your local APRS traffic, and query it
however you like using raw SQL if you want. Plus it's free, open
source, yadda yadda.

73 and enjoy de n1ywb


From README.txt

===================================

Trackulator v0.02
(C) 2005 Jeff Laughlin, jeff.laughlin@gmail.com
http://www.trackulator.com

Trackulator aims to be a free open source APRS web client.

THIS IS ALPHA QUALITY SOFTWARE! It's buggy and I know it. Please send patches,
not bug reports.

Requirements
 * PostgreSQL
 * Perl
 * Ham::APRS::Parser.pm (Get from http://aprs.n1ywb.com)
 * DBI.pm
 * DBD::Pg.pm
 * CGI.pm
 * Internet connection (For google maps)
 * aprsistest.pl (In the Ham::APRS::Parser tarball)

There are three main parts
 * trackud.pl
 * tracku.cgi
 * schema.sql

trackud.pl is the Trackulator daemon. It reads raw APRS packets on stdin, calls
Ham::APRS::Parser to parse them, the inserts the bits into the PostgreSQL
database.

tracku.cgi is the front end. It queries the database and maps stuff using google
maps.

schema.sql defines the trackulator postgresql backend.

To use Trackulator, first you need a working PostgreSQL installation. Then run
        psql -f schema.sql
to import the Trackulator schema into your postgresql database. If you have
problems with this command, please read the PostgreSQL documentation in it's
entirety and check your postgresql setup thoroughly before contacting me.

Then start the trackulator daemon. In order to get the full APRS-IS feed into
the database, use this command
        perl aprsistest.pl | perl -I . trackud.pl
The -I tells perl where to look for the Ham/APRS/Parser.pm directory. You should
now be getting a rapidly expanding screen full of warnings and errors from the
APRS parser (this is alpha software after all). If you get errors from the Perl
DBI, please let me know. Otherwise, ignore the errors, I already know about
them. You can just redirect them to /dev/null or something, or do this:
        perl aprsistest.pl | nohup perl -I . trackud.pl &
Which will cause the daemon to run in the background and send all output to
nohup.out. Careful, nohup.out could get pretty big.

I developed this with PostgreSQL. It might work with other RDBMS's but then
again it might not, I wouldn't know so don't ask, but if you have success with
another one please let me know about it.

License:

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
