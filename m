From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 11 Dec 2002 13:30:17 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021211133016.A14287@linux-mips.org>
References: <20021211024019.A28178@linux-mips.org> <Pine.HPX.4.10.10212111219220.22086-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.HPX.4.10.10212111219220.22086-100000@saturn.trs.ntc.nokia.com>; from tpm@prkele.tky.hut.fi on Wed, Dec 11, 2002 at 12:29:12PM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

On Wed, Dec 11, 2002 at 12:29:12PM +0200, Tomi Manninen OH2BNS wrote:

> Ok, I understand. Anyway some kind of progress report would be nice. Even
> something like: "don't hold your breath", if that is appropriate... :-)

Holding breath is definately something that could negativly impact your
health ;-)

> I have gotten surprisingly many private queries about this lately, so to
> recap what I have understood so far: the 2.4 code is bad, full of races,
> works only if treated nicely. Your SOCKOPS_WRAP removal obviously makes
> things even worse until you redo the locking stuff. When that is done we
> have a perfect ax.25 stack again. Right? ;-)

In some sense the improments that are necessary to make the AX.25 stack
"future proof" are ridiculous.  AX.25 is about the worst protocol design
I've ran over in my life, so making a multi-threaded implementation of it
is an amusing thought.  But the other legacy protocols like Appletalk
are going through the same pain ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
