From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: man listen
Date: 29 Jun 2003 17:04:10 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1056895450.1397.11.camel@oh2bns.ampr.org>
References: <NCEPJGLIJIFOHBPEAAAOAEJFFCAA.phil@wotech.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCEPJGLIJIFOHBPEAAAOAEJFFCAA.phil@wotech.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi,

Riley gave you a good explanation on the other issues. However a
quick note about modulo-128.

> According to the ax25 specification, modulo 8 sequence numbers should
> be 0 to 7. Since I am seeing a sequence number of 74 here I assume
> this link has negotiated modulo 128 operation.
> uhf: fm VK6BBS to VK6AD ctl I74+ pid=F0(Text) len 250

You can tell modulo-128 frames (connections) from regular by the
"EAX25" text at the start of the line. Like this:

  1: EAX25: fm OH2BNS to OH2RBI-1 ctl SABME+ 16:51:43

Also note that for EAX25 the sequence number display is pretty much 
broken in listen. As the numbers are simply concatenated you can not
tell which belongs to which...

In my opinion the old xNOS style AX.25 dump was much more readable
_and_ consistent with the other protocol dumps in listen. But that's
just me...

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

