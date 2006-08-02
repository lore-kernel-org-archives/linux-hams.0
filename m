From: Joe Veldhuis <kd8atu@gmail.com>
Subject: soundmodem won't decode 300 baud signals?
Date: Wed, 02 Aug 2006 10:53:05 -0400
Message-ID: <44D0BC51.6050709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

There was a very similar question posted here back in November 2005 
which never got an answer, so I guess I will have to ask again. I've 
been trying to receive 300 baud packet signals via HF with soundmodem, 
and have had no luck thus far. I have a channel configured with these 
settings on the Demodulator tab:

Mode: AFSK
Bits/s: 300
Frequency 0: 900
Frequency 1: 1100
Differential Decoding checked

When receiving a signal, the diagnostic screen shows that the modem is 
just detecting a solid string of '1's. The app seems to be able to 
decode 300 baud packets sent over FM from another computer running 
soundmodem with the same settings.

Is this supposed to work? If so, what am I doing wrong?

-Joe, KD8ATU
