From: "Robert Eliassen" <la6gha@robenel.com>
Subject: RE: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 20:07:44 +0200
Message-ID: <MAEBLGENFLMMCIMBCMPOMEJKCKAA.la6gha@robenel.com>
References: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Bill - WA7NWP wrote:

> I watched Airmail send a message (15k picture) over AX25
> a couple weeks ago and it beautiful.   3 full packets
> of compressed data followed by a single ACK.  3 more data
> packets and one more ACK.   A minute or so later and it
> was done.

Is TCP/IP often (always?) encapsulated in NetROM or similar protocols over
AX.25, or is it possible (implemented somewhere) to send IP-packets right in
AX.25's payload? The routing has to be figured out some way...

I know TCP/IP, but I'm not an expoert on AX.25. The max packet length is 256
bytes, right? Alignment in order to send full packets should be the clue to
an efficient transfer.

Regards
Bob - LA6GHA


