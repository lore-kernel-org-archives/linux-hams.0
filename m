From: Tapio Sokura <oh2kku@iki.fi>
Subject: 300 bps packet with soundmodem?
Date: Sun, 19 Dec 2004 12:51:42 +0200
Message-ID: <41C55D3E.4070608@iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I just tried soundmodem versions 0.7 and 0.9 for 300 bps HF packet 
(afsk, 300 bps, tones 1600 and 1800 Hz). The modem window (from 
soundmodemconfig's diagnostics menu) is constantly showing bit one, no 
matter what audio I feed to it. If I bump the speed up to 400 bps or 
anything above that, the modem sees both bits 0 and 1.

Is there a bug in the soundmodem or is this a user error? I'm running 
fedora core 1 and compiled the 0.9 version against alsa lib 1.0.7, 
soundmodem 0.7 was compiled against freshrpms.net prepackaged alsa lib 
1.0.4.

   Tapio
