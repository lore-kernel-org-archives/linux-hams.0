From: "Phil Maley" <phil@wotech.com.au>
Subject: RE: axdigi
Date: Tue, 6 Jul 2004 10:53:02 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040706025301.442F4504E5@vscan01.westnet.com.au>
References: <40D38BDB.29594.1A737@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40D38BDB.29594.1A737@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

A bit late, but I've now had a chance to try axdigi with kernel 2.4.22 and I
can't get it to work. The binary that comes with the distribution simply
will not run under 2.4.22 so after messing around with some of the header
file location definitions I got it to compile cleanly. It runs now but I get
a problem with invalid call signs. Here is a typical capture from "listen":

axip: fm VK6HGR-10 to VK6BBS via VK6AD-9 ctl SABM+ 23:19:11
uhf: fm VK6HGR-10 to [invalid] via VK6AD-12* ctl SABM+ 23:19:11

Note the [invalid] call sign.

I have given up on axdigi and have just got digi_ned running instead.

73
Phil vk6ad


