From: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 09:24:17 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D464D31.7090005@btinternet.com>
References: <001401c2355e$2ef96750$e239832c@jrws2> <200207270637.01098.n7ipb@koster.seatcp.net> <20020728151549.A6657@dea.linux-mips.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Ralf Baechle DO1GRB wrote:
>  Unfortunatley the number of race conditions in that code are
 > just frightening and the longer I'm hacking the code the more
 > I discover.

Anyone examined NEWAX25 stuff to see if it is any better?
I'm sure I heard someone starting to port it to 2.4.
I'm happy to help on a clean-up exercise (based on the
either old or new ax25 code) but it's a big job and would
need a coordinated team effort.
It's been done with the user-mode stuff, and I think it
made a big difference to that. Maybe the same rigor applied
to the kernel stuff could weed out some of the funnies that
rear their heads now and then.
I still get unexplained things happening and I have to
brush them under the carpet when trying to woo someone
into runnig Linux as their AX25 system and I'd like to
be in a more confident position than that...

	J

