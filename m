From: Joe Veldhuis <kd8atu@gmail.com>
Subject: soundmodem activates PTT on DCD
Date: Fri, 19 Aug 2005 16:51:51 -0400
Message-ID: <43064667.5020604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have soundmodem working for the most part. It decodes and encodes just
fine except for one problem: when I enable PTT control through the
serial port, it keys the rig whenever it starts decoding. This makes it
impossible to recieve anything, and also jams the signal to some extent.

From reading through the archives, it seems that soundmodem sends some
kind of signal on the serial port when it goes into DCD mode. This is
probably what is keying the rig. Does anyone have any ideas as to how I
can stop it from doing that?

Pertinent config info:
Soundmodem 0.9, kernel 2.6.11.8
Dell Latitude CPx J650GT laptop
Buxcomm Rascal serial/soundcard interface, Alinco DJ-596T HT

TIA es 73,
-Joe, KD8ATU
