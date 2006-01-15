From: John Bennett <jabennett@insightbb.com>
Subject: wxn weather server 0.1 released
Date: Sat, 14 Jan 2006 21:02:10 -0600
Message-ID: <1137294130.19159.24.camel@localhost>
Reply-To: jabennett@insightbb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

The first release of the Linux version of my WXN weather server, 0.1 is
now available for download. The code is open source and is licensed
under the GNU/GPL.

The WXN weather server is a suite of daemons that run on the Linux
platform. It allows users to obtain real-time, archived weather data and
other related information stored in a database via APRS on amateur
radio, the Internet, or a Local Area Network. Most common weather
stations are supported (listed below). The various daemons are written
in C/C++. The RDB used is PostgreSQL.

Highlights of key features are as follows:

        * SQL based
        * Supported weather stations: Heath ID-5001 (now Questech), 
          Peet Brothers Ultimeter stations (all), TAPR T-238/T-238+
          and Davis Instruments Monitor II, Wizard, Perception, and
          Vantage Pro stations.
        * Support for additional sensors using 1-Wire technology. The
          current list includes the following: barometer, temperature
          (inside, outside, soil), rain gauge, EMP (lightning) sensor,
          outside humidity, control interfaces for aspirator (used with
          humidity sensor) and rain gauge heater, and background
          radiation (as in nuclear). With the exception of the soil
          temperature sensor, all features are supported in the X1W
          series of kits available from TAPR. Instructions (with pictures)
          on how to build a soil temperature sensor can be found on my 
          home page.
        * Support for the Peet Brothers Weather Picture (does not require
          a Peet station to use).
        * Built-in native APRS support for weather, position, PHG, and status.
        * Built-in callbook support for callsign resolution using US and
          Canadian data readily available over the Internet or QRZ cdrom.
        * Query server allows polling database over radio using APRS
          messaging protocol.
        * Support for extended weather data over APRS (highs, lows,
          climatological, and other data not natively supported by APRS).

The system has been extensively tested on Red Hat 9, Fedora Core 3, Fedora Core 4,
and current versions of Gentoo, Debian, Suse, and Mandrake. Fedora Core 4 is the
main target.

Under development is a NWR SAME daemon that will monitor, record and broadcast 
watches and warnings from the NWS over APRS.

More information, including an on-line sysop manual, can be viewed on my web site:

    http://n4xi.home.insightbb.com

The code can be downloaded at my web site or from TAPR in the weather area:

    http://www.tapr.org

John Bennett, N4XI
14 January 2006

-- 
John Bennett
Evansville, IN
Amateur Radio Web: http://n4xi.home.insightbb.com
Where am I? http://www.findu.com/cgi-bin/find.cgi?N4XI
Bike Racing Web: http://xibike.home.insightbb.com
Live Strong - Lance Armstrong Foundation: http://www.laf.org/

