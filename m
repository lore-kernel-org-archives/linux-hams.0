From: Sandor Dibuz <ha3pg@ha3pmf.boszi.pte.hu>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 4 Dec 2002 12:04:48 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212041148210.23313-100000@off1.audion.com>
References: <19399@9A0TCP>
Reply-To: ha3pg@ha3pmf.boszi.pte.hu
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <19399@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>
Cc: linux-hams@vger.kernel.org

On Wed, 4 Dec 2002, Tihomir Heidelberg wrote:

> ... When the problem occur, all connections
> are running well, so I think that ax25_list is not broken
> because ax25_find_socket and ax25_find_cb functions are doing
> good work, but running netstat or cat /proc/net/ax25 will
> do "segementation fault".

> I analyzed the kernel ax25 source, and I tried to find what
> can make ax25_get_info function crash. I don't know much
> about how kernel and sockets exactly work, but want to know
> if someone have the same problem, and maybe one of kernel
> guru will catch a problem.

That would be great. I used to see this time to time on two different
systems with significant traffic load, namely that of HA3PMF and WB0TAX.
But HA5OB/Zoli also reported to experience it on his pc.

Once the system turnes to this state, modules like ax25 and netrom can not
be removed any more and usually it dies with a kernel crash in 1 or 2
days. Unless I notice in time and restart the computer but I hate doing
so. Always feel like somebody is watching, then he might believe I'm using
windows ;-)))


73... Sanyi

-- 
Dibuz Sandor  | email: ha3pg@ha3pmf.boszi.pte.hu
Pecs, Hungary | AX.25: HA3PG@HA3PG.HUN.EU | UIN: 81545608

