From: Arnau Sanchez <arnau@ehas.org>
Subject: Software Radio-Phonepatch for Asterisk
Date: Wed, 28 Jun 2006 21:56:11 +0200
Message-ID: <44A2DEDB.4040603@ehas.org>
References: <Pine.SUN.4.58.0606051233310.12282@eskimo.com> <44A27928.20700@sharon.esrac.ele.tue.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44A27928.20700@sharon.esrac.ele.tue.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello!

I am working on a software Radio-Phonepatch for Asterisk (developed in 
Python). It's still on beta state, but there may be someone interested 
on testing. Source and a binary package for Debian/Ubuntu are available 
for download. Bug reporting or ideas for new features would be appreciated.

http://www.nongnu.org/asterisk-phpatch/

thanks
arnau

*********
Package: asterisk-phonepatch
Version: 0.1-7
Priority: optional
Section: comm
Maintainer: Arnau Sanchez <arnau@ehas.org>
Depends: python (>= 2.3), asterisk, sox, festival, python-serial, 
python-parallel, python-numarray, python-numeric-ext
Size: 512156
Installed-Size: 848
MD5sum: bf13ba5d035a301e790b2cf1a04692e1
Description: Software radio-phonepatch for the Asterisk PBX
  Although the term "phonepatch" usually refers to the hardware
  device used to connect a radio transceiver and a phoneline,
  asterisk-phonepatch is esentially software, as only needs a
  simple hardware interface between radio and computer (to send/
  receive audio, control PTT and, optionally, get carrier status).
  .
  Audio interface is made using the soundcard as A/D, D/A converter,
  while PTT (Push-to-talk) and carrier detection are operated
  though a serial/parallel port.


