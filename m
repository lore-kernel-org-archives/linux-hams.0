From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Re: Predict 2.1.5
Date: Sat, 20 Apr 2002 19:06:52 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020421020652.32349.qmail@web12205.mail.yahoo.com>
References: <0204201920200F.00773@g4klx>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0204201920200F.00773@g4klx>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g4klx@qsl.net, linux-hams@vger.kernel.org

Hi Jonathan.

I agree with the comments made by Claudio and Riley.

PREDICT was first designed when Modes B and J were popular.  In fact,
the very first version (that I have long since abandoned) ran on a
Commodore 64 with a 40 column screen.

Since the modern versions are Open Source, it isn't difficult to modify
the program to display Doppler shifts for different bands.  Modifying
the source should be the equivalent of editing a configuration file
for a closed-source application, IMHO.

As has been pointed out in earlier comments, client applications can
poll PREDICT for Doppler information normalized to 100 MHz, and scale
it accordingly (for tuning uplink transmitters and downlink receivers
automatically, for example).

As Riley mentioned, the satellite mode and attitude information must
come from information in files that do not yet exist (as far as PREDICT
is concerned), and do not apply to all satellites, either.  Based on
feedback I have received, there are a good number of PREDICT users
who aren't even interested in radio.

What I have discovered over the years is that people become very attached
to screen displays and data formats.  When I released PREDICT 2.1.5, it
contained some data format modifications over earlier versions.  I made
these changes to permit future expansion and simplification of client
applications.  It was a painful decision to make those changes fearing
the negative implications it could have.  The feedback I received from
users indicated that the changes were BAD, since they broke so many of
their specially designed client applications.  Many went back to version
2.1.4 as a result.  :-(

What I started planning for inclusion in version 2.1.6 was some more
flexibility in the way the serial port controls different types of antenna
rotator interfaces (rotators abide by NO standards), and perhaps allow for
the generation of version 2.1.4 data formats.  These to date have been the
most requested features.

Right now I am involved with another software project that functions
as a terrain analysis program for predicting geometric line-of-sight
paths and analyzing coverage areas of transmitters where terrain is
the primary factor in limiting coverage.  Details are available at:

	http://www.qsl.net/kd2bd/splat.html

Version 1.0.1 is undergoing testing and should be ready any day now...


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : KITSAT-OSCAR-25  |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________________________
Do You Yahoo!?
Yahoo! Games - play chess, backgammon, pool and more
http://games.yahoo.com/
