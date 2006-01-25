From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Unwanted packets on AX25 interface
Date: Wed, 25 Jan 2006 12:02:39 -0600
Message-ID: <43D7BD3F.4060401@lightningflash.net>
References: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local> <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Freeman <cpe.jfreeman@gmail.com>
Cc: linux-hams@vger.kernel.org

Josh Freeman wrote:
> Yes, and I believe I now have it restricted to the TCP/IP interfaces
> (lo, eth0, wlan0), but it turns out that the unwanted packets are
> being generated even when the Samba services (smbd and nmbd) aren't
> running at all.

Also turn off the mdns service. It's not related to samba. It's some kind of 
auto-finding name service. Apple calls it "Rendezvous", but it has a generic 
name, too; I just can't remember it.

(I don't even know if FC4 has this... SuSE does.
-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the 
cookies.

