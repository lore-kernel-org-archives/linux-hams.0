From: Curt Mills <archer@eskimo.com>
Subject: Re: ax25 with digipeaters
Date: Thu, 15 Jul 2004 21:22:41 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0407152121160.30845-100000@wapiti>
References: <065101c46a60$34620420$050010ac@tokland>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <065101c46a60$34620420$050010ac@tokland>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Arnau_S=E1nchez?= <arnau@gbt.tfo.upm.es>
Cc: linux-hams@vger.kernel.org

On Thu, 15 Jul 2004, [iso-8859-1] Arnau S=E1nchez wrote:

> I have been using ax25 for long time, but until now I had never tried=
 to use it with
> digipeaters... I try:
>
> (from SOURCE)
> call port FINAL DIGI (or call port FINAL via DIGI)
>
> but the station with callsign "DIGI" does not repeat the packet (alth=
ough it shows it in listen)
>
> What's the problem? Should something be enabled on "DIGI" station?

Make sure the syntax is proper for your command.  I don't recall
whether spaces are needed or commas between stations.

Yes, there are parameters on the intermediate stations that would
need to be set to use it as a digipeater.  Something like "MRPT
ON"???  Can't recall the exact commands, and they may change based
on the TNC or the software involved.

--=20
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
