From: Mike Fenske <mike_fenske@telus.net>
Subject: Soundmodem
Date: Sat, 20 Jul 2002 20:15:40 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3.0.6.32.20020720201540.007a6500@pop.telus.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello all. I am tying to get Thomas's userspace soundmodem working on an
IBM laptop. I have installed SuSE 7.3 and Kernel 2.4.8. AX25 is working
fine with baycom drivers. I have installed soundmodem from SuSE's rpm's.
Got it configured OK and soundmodem starts with no errors. If I check
ifconfig, it shows port ax0 up running. Next, using "call" I tried
"calling" a station, expecting to hear a packet from the internal speaker
(I haven't hooked up a radio yet). Nothing is heard. After stopping "call"
with Ctrl-C, I checked ifconfig again and see only 1 packet transmitted
(should be at least 2 I think). I am using alsa sound drivers and sound
card (ESS1688) works fine to play wav files, etc. 

Any suggestions??

Mike Fenske
VE7MKF
