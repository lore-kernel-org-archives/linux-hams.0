From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Announcing PREDICT Version 2.2.2
Date: Tue, 24 Jun 2003 10:03:25 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030624170325.48839.qmail@web12204.mail.yahoo.com>
References: <E186w1M-000HFS-00@serenity.mcc.ac.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E186w1M-000HFS-00@serenity.mcc.ac.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

PREDICT-2.2.2 has been released.  This release corrects several small bugs
and adds several new features.  Some of the important changes include:


* Fixed a bug that caused GET_SAT (UDP socket) requests to fail after
  GET_DOPPLER requests were issued.  (Tnx: KF6RFX)

* Fixed a bug in "earthtrack" where latitude and longitude options sent
  to "xplanet" were reversed under certain circumstances.  (Tnx: ZL2BSJ)

* "earthtrack" has been modified to work with "xplanet" version 1.0 and
  later.  Compatibility for versions of "xplanet" prior to 1.0 is retained
  through an earlier version of "earthtrack" that has been moved into
  an "old_version" directory.

* Orbital phase, eclipse depth, and squint angle data has been appended
  to the information returned to UDP client applications in response
  to the GET_SAT command.

* Moon tracking code was replaced with a more precise algorithm based
  on Meeus' method.

* Added a lunar prediction mode that predicts "passes" of the Moon.

* Added a solar prediction mode that predicts "passes" of the Sun.

* Added "MoonTracker", a small utility that runs in the background and
  directs an AZ/EL antenna array toward the position of the Moon (for
  EME communications).

* The Moon's declination, Greenwich hour angle, and right ascension
  have been appended to the information returned to UDP clients in
  response to the GET_MOON command.

* The Sun's declination, Greenwich hour angle, and right ascension
  have been appended to the information returned to UDP clients in
  response to the GET_SUN command.

* PREDICT now returns orbital data in NASA Two-Line format to UDP
  clients in response to the GET_TLE command.

* Added a new UDP socket command (GET_MODE) to return PREDICT's
  current tracking mode (single, multi, none) to networked clients.
  If PREDICT is operating in Single Satellite tracking mode, then the
  name of the satellite currently being tracked is returned by GET_MODE.

* In Main Menu option [G] (Edit Ground Station Information), ground
  station latitude and longitude may now be entered in degree, minute,
  second (DMS) format in addition to decimal degrees.

* The "vocalizer" feature was dramatically improved.  Sound samples
  are now read from ubiquitious .wav files, making it easier for users
  to create samples of their own, even in languages other than English.
  PREDICT now articulates numeric values in their entirety (ie:
  "three hundred forty nine") instead of articulating each digit
  individually ("three four nine") as was done previously.  Alarms
  and additional announcements were added to alert a visual observer
  when a spacecraft is visible, when it enters into sunlight, and
  when it enters into eclipse.

* Added "fodtrack", written by Luc Langermann, LX1GT.  This utility
  permits AZ/EL antenna control using the Fodtrack hardware interface
  via the parallel port.

* Added titles to windows when PREDICT is run under X.

* The latest version of "gsat" (1.1.0) has been included.

* Several other coding changes were made.  Linux-specific code was
  removed in an effort to allow easier compilation under FreeBSD,
  MacOS X, and other Unixes in general.

* PREDICT's main menu was expanded to handle the additional program
  options.  The main menu also now displays the text "Server Mode"
  when the program is invoked in socket server mode (-s).

* Program documentation was updated.


PREDICT may be downloaded from:

	http://www.amsat.org/amsat/ftp/sotfware/Linux/predict-2.2.2.tar.gz

Further information on PREDICT is available at:

	http://www.qsl.net/kd2bd/predict.html


Happy tracking!


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : UoSAT-OSCAR-22   |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
