From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Announcing PREDICT Version 2.2.0
Date: Sat, 12 Oct 2002 13:27:46 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021012202746.49164.qmail@web12202.mail.yahoo.com>
References: <20020708155751.11207.qmail@web12207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020708155751.11207.qmail@web12207.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello Everyone.

PREDICT version 2.2.0 has been released.  This version contains
significant internal changes including the adoption of SGP4/SDP4
orbital models, support for a satellite transponder database, and
a completely revised Single Satellite Tracking mode that provides
detailed uplink and downlink frequencies (properly compensated for
Doppler shift) that are required for successful communication via
OSCAR satellites.  (You can now "tune" across a transponder using
the keyboard to equate a particular downlink signal to the required
uplink frequency.)  Many of the other functions of the program
were allowed to successfully remain intact.

The CHANGES file provides more details, and reads as follows:

Release 2.2.0: (a.k.a. The Columbus Day Release)
By John A. Magliacane <kd2bd@amsat.org> (12-Oct-2002):

* PREDICT's satellite tracking algorithm was replaced by a more precise
  model based on a port of Dr. TS Kelso's SGP4/SDP4 Pascal routines to
  'C' by Neoklis Kyriazis, 5B4AZ.

* PREDICT now imports, exports, and permits editing of TLE element set
  numbers, International Designators, and Bstar and nddot/6 drag terms
  in addition to all the remaining orbital data found in a two-line
  element set.

* Earthtrack was modified so that when multi-tracking satellites,
  range circles are displayed 5 minutes prior to AOS through LOS.

* Maximum allowable callsign length was increased to 15 characters to
  permit groundstation names to be used in place of 6 character callsigns.

* Vocalizer will no longer send audio to the soundcard if the soundcard
  cannot be set to the proper sampling rate and word size.

* The Single Tracking mode was completely redesigned to allow interactive
  selection of satellite transponder, provide real-time Doppler-compensated
  uplink and downlink frequency information, and support for a transponder
  database.  Spacecraft antenna squint angle, propagation delay, echo,
  and satellite eclipse depth information are also now available.  See
  the NEWS file for additional information.

* Orbital predictions now report squint angles instead of orbit
  numbers if ALAT/ALON data is available in the transponder database.

* A Visual BASIC Windows-based client application has been contributed
  by Steve Fraser, VK5ASF.  Steve also contributed some small coding
  changes that allow PREDICT to be successfully invoked by rc.local
  upon startup.

* Bent Bagger, OZ6BL, contributed a small change to get_response() in
  the client demo.c program.  The modification recognizes the absence
  of a PREDICT server, and displays an appropriate error message.
  The previous method set an alarm and waited for a timeout to occur.

* A bug in the configure script was fixed.

* Lots of other small coding changes were made.


Further details are available at:

        http://www.qsl.net/kd2bd/predict.html


Enjoy the program!


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : KITSAT-OSCAR-25  |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com
