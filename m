From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Linux AX25 KISS driver for Kenwood D700
Date: Fri, 18 Dec 2009 11:23:29 -0800 (PST)
Message-ID: <alpine.LNX.2.00.0912181108520.16739@wapiti.we7u.net>
References: <5abd436b0912171434g6bfa1c46r52cca684de4f7999@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323584-1053896178-1261164215=:16739"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5abd436b0912171434g6bfa1c46r52cca684de4f7999@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Bill V WA7NWP <wa7nwp@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-1053896178-1261164215=:16739
Content-Type: TEXT/PLAIN; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Dec 2009, Bill V WA7NWP wrote:

Actually Rick Muething, KN6KB wrote:

> The solution we used and which appears to work well and is solid is to
> escape the =93C=94 character.  So when any data is sent to the TNC in KISS
> mode if there is an ASCII =93C=94 it is replaced by the sequence <0xDB>=
=94C=94
> which essentially escapes the =93TC 0<Cr>=94 sequence. The KISS protocol
> (in the D710=92s KISS TNC implementation) removes the <0xDB> which is
> the frame escape so no modification of the transmitted data stream is
> actually made. Thanks to Peter Woods for figuring this out.

Bill:  I see the mentioned that this fixes the problem with Winlink
talking to D710's.  Has this "fix" (hack) been tested on all of
these?

     TM-D700A
     TM-D710A (Yes, per above)
     RC-D710 (the actual TNC used w/TM-D710A) (Yes, per above)
     TH-D7A
     TH-D7A(G)
     TS-2000 (all models)
     Other Kenwoods?

For Xastir purposes:  Would I need to identify a port as having a
Kenwood KISS TNC attached before enabling this extra escaping?  A
counter-question would be:  Would the above escaping of the 'C'
character cause problems for non-Kenwood KISS implementations?

I _really_ wish Kenwood would fix this (and other) problems with
their KISS implementations so the rest of us wouldn't have to
program around their bugs.

--=20
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
--8323584-1053896178-1261164215=:16739--
