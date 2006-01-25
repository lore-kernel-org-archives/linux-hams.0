From: Josh Freeman <cpe.jfreeman@gmail.com>
Subject: Re: Unwanted packets on AX25 interface
Date: Wed, 25 Jan 2006 09:11:32 -0600
Message-ID: <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
References: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello again,

AE5PL Lists wrote:
> Are you running Samba (standard in FC4)?  If so, restrict it to your LAN
> interface or it will send packets out your AX.25 interface.

Yes, and I believe I now have it restricted to the TCP/IP interfaces
(lo, eth0, wlan0), but it turns out that the unwanted packets are
being generated even when the Samba services (smbd and nmbd) aren't
running at all.

John Ronan wrote:
> did you get this fixed? (I'm slowly catching up on my emails)

Not yet =)

Ralf Baechle DL5RB wrote:
> Until then you may try to limit the problem by setting up a packet filter
> blocking all ARP/IP traffic over your mkiss interface.

OK. I'll go do some doc-searching and try to figure out how to set that up.

Thanks for all your responses.

Josh KI4ITI
