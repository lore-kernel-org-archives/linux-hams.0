From: "Steve Fraser" <sfraser@sierra.apana.org.au>
Subject: Re: axip
Date: Mon, 26 Aug 2002 21:52:52 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001601c24cfb$4df99620$04590cca@apana.org.au>
References: <Pine.LNX.4.33.0208260433330.2303-100000@n1uan.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: N1UAN Bob <bobbru@chartertn.net>, linux-hams@vger.kernel.org

Hi Bob,

> Well it seems i got the attachs done for the ax25ipd at least they took
> i have  ptyp0 in the ax25ipd.conf and ttyp0 and when i do an mheard to
> check it anything is listed there it does sy port axip with so many
> packets but  it never makes the connect  either way any idea why
> Bob
>
A couple of things that may help:

The "master" end of a pseudo tty (ptyXX) must be opened first, so it may be
better to kissattach to that and then start the ax25ipd daemon second (ie
swap ptyp0 and ttyp0 in the above). That way you're not relying on the
daemon to get started and running before you get to the kissattach if you do
it in a system startup script.

You need routes in ax25ipd.conf for the station you're connecting to. These
use the IP number of that station, and you must have a TCP/IP route to them.

The other station must have an ax25ipd.conf route back to you (if linux).
(Note: JNOS people use totally different setup and terms, but it still
works)

Earlier versions of ax25ipd didnt route correctly if you tried to use
different SSID's on one callsign to select different routes - the default of
SSID zero was used. The latest version fixes that.

You can use "listen" on the ax25 port specified in the kissattach to see
what packets are getting to you from the far end. They can do the same.

The far end MUST have a process to connect to (like FBB, node etc). So if
you want connects from the far end to you, you must used ax25d (or FBB etc)
to recognise that incoming connect and do something with it.

Hope something in this helps :-)

cheers
Steve


