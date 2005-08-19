From: Joe Veldhuis <kd8atu@gmail.com>
Subject: Re: soundmodem activates PTT on DCD
Date: Fri, 19 Aug 2005 17:52:45 -0400
Message-ID: <430654AD.7040503@gmail.com>
References: <20050819211801.2675.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050819211801.2675.qmail@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

Dave Platt wrote:
>     Edit soundcard/kisspkt.c, find the pktsetdcd function, and change its
>     second parameter to 0.  This will ensure that the DTR signal remains
>     false at all times, and will avoid accidentally keying the radio
>     during reception.

That worked. Thanks!

> This will provide you with an LED which lights up whenever the soundmodem
> signals that it's receiving/decoding a packet.

Sounds like something I'll have to try sometime.

-Joe, KD8ATU
