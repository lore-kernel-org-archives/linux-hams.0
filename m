From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Soundmodem Not Decoding Real Packets
Date: Fri, 1 Jul 2005 08:01:41 +0000 (UTC)
Message-ID: <loom.20050701T095736-780@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I've been trying to get Tom Sailer's soundmodem to decode AX.25 packets. I've
been able to see the audio coming in from the radio and from other machines
transmitting packets through a cable. The only problem is that the DCD can be
too sensitive and turn on when there is nothing but just inducted noise in the
cable from somewhere. The noise in normal, and the level is very, very low. But,
the problem is that soundmodem tries its best to try and decode the noise. But
when a real packet comes down the line, it tries but fails to decode it
properly. I think that I have an issue with audio levels, but I'm open to being
wrong. Does anyone on list have any good ideas of things to try?

Jonathan Lassoff (KG6THI)

