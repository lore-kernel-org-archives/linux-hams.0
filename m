From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Packet duplication in kernels 2.6 onwards
Date: Mon, 04 May 2015 19:30:36 +0100
Message-ID: <5547BACC.7000709@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Just put togther a packet system to test wireshark on and
discovered that packets are being duplicated at the ax0 interface.

My tests so far show that the issue is not present in kernels
2.4.29 & 2.4.37.11 and is present in kernel 2.6.33.3.
I also have reports of the issue being in kernel 3.x.x.x

Is this a known issue?

If so is there any idea as to when it appeared? My guess is during
the 2.5 kernel series.

Has anybody on the list attempted to trace the cause?

-- 
Regards
	Richard

