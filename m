From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: [PATCH] mkiss
Date: Mon, 7 Jul 2003 02:11:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030707001148.GC29616@linux-mips.org>
References: <20030705211733.A255@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030705211733.A255@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org

On Sat, Jul 05, 2003 at 09:17:33PM +0200, Jeroen Vreeken wrote:

> This is a patch to get mkiss working under 2.5.74
> It used the driver_data field of the tty structure, this field can be NULL.
> Further the whole mkiss magic stuff seems to be unreachable as I can't find
> a single piece of code in the kernel that sets the driver_data field with
> this structure... Is is something from a long time ago?? Shouldn't it be
> removed completly?
> This patch also removes the MOD_*_USE_COUNT calls.

The code that was setting the magic number - actually large parts of
mkiss.c were removed in 2.4.0-prerelease.  Alan Cox did remove support for
mkiss as a tty driver; the mkiss magic stuff are the last remains of it;
they should be removed also.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
