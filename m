From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: AX25 socket question.
Date: Tue, 16 Jul 2002 01:38:14 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0207160057230.22772-100000@prkele.tky.hut.fi>
References: <20020715052433.18187.h005.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020715052433.18187.h005.c002.wm@mail.peoplepc.com.criticalpath.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: TIMOTHY POWELL <kd4iky@peoplepc.com>
Cc: linux-hams@vger.kernel.org

On Mon, 15 Jul 2002, TIMOTHY POWELL wrote:

> int socket(int domain, int type, int protocol);
>
> So PF_AX25 is the domain, SOCK_SEQPACKET would be the
> type of communication.  So what protocol is used for
> receiving AX25 information, or am I still
> misunderstanding sockets?

Not necessarily but maybe you're not quite up to what the different
protocol layers are.

Just like Craig said, when you need to have an AX.25 socket and do
information transport between two stations, you need a
PF_AX25,SOCK_SEQPACKET socket. AX.25 does not support SOCK_STREAM. It does
support unnumbered data (UI frames) with SOCK_DGRAM.

But, the point is (as far as I can see) that what you want to do is not
(point to point) information transfer, but network monitoring. When doing
that you actually do not want to have a socket that corresponds to the
higher level protocol but you want a socket to see the data from the
device driver. That is what "listen" does.

The same thing applies to applications that monitor for example the
internet traffic in your local ethernet segment (eg. ethereal). They can't
use PF_INET sockets but something lower level.

The listen program uses PF_PACKET as the domain and SOCK_PACKET as the
type. This is actually deprecated in new kernels but still works (see
packet(7) manual page for more details). Anyway the general idea is that
you need to interpret the raw data from the device driver to do your
monitoring. PF_PACKET,SOCK_PACKET socket handles the device dependent part
for you, basically removing the KISS command byte when using a KISS TNC
and maybe something else for other packet radio drivers, but the actual
AX.25 and higher level protocol/data interpretation is left to you (feel
free to copy from "listen").

So writing an application to monitor AX.25 traffic might not be the
easiest way to start exploring the world AX.25 as you really need to do
the whole protocol decoding in your application. Writing an application
for simple information transfer with another packet radio station is much
simpler as the kernel handles all the gory protocol details for you...

But, as already said here, you can always re-use the code from "listen".
If you are not interested in the upper level protocols (above plain AX.25)
you can modify it accordingly (to just hex dump any higher level data or
whatever).

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

