From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Announcing PREDICT Version 2.1.6
Date: Mon, 8 Jul 2002 08:57:51 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020708155751.11207.qmail@web12207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello Everyone.

A new version of PREDICT, a satellite tracking/orbital prediction program
for Linux has been released.  The major changes in the new release include:

* Buffering added to I/O functions in the vocalizer utility
  for better efficiency and less CPU load.

* Fixed errors in main() (predict.c) that prevented the
  vocalizer utility from ever being invoked by PREDICT.

* Modified the earthtrack utility for compatibility with
  versions of xplanet more recent than 0.82.

* Serial port configuration for antenna rotator interface control
  is now automatically set within PREDICT to the EasyComm 2 protocol
  standard (9600 bps, 8N1, no handshaking) when the -a or -a1
  command-line options are invoked.

* -a1 command-line option added.  It works like the -a option, except
  it sends tracking data to the specified serial port at least once
  per second, whether the data has changed since the last transmission
  or not.  These "keepalives" are required for interfaces such as the
  ones by Suding Associates, Inc. that throttle back to manual mode if
  updates aren't received on a regular and frequent basis.
 
* "gsat" by Xavier Crehueras, EB3CZS, has been updated to version 1.0.0.
  The new version adds Doppler control for beacon frequencies, support
  for a satellite frequency database, and automatic frequency selection.
  In addition, an azimuth/elevation graphic window is now included,
  and automatic rotator control via plugins is now supported.

* The destination directory for PREDICT's executables may now be
  specified to something other than the regular default (/usr/local/bin)
  when ./configure is invoked.  See the README file for details.

* Main menu option [I] (Program Information) was changed to provide
  information about which files were loaded by PREDICT, if a soundcard
  is present, if network server mode is enabled, if rotator AutoTracking
  is enabled, and if so, what serial port is used, how often is data sent,
  etc.

* The documentation was updated, and several other small coding
  changes were made.

Further information on PREDICT is available at:

	http://www.qsl.net/kd2bd/predict.html


Enjoy the program.


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : KITSAT-OSCAR-25  |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com
