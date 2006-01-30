From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: kernel panic w/ax25 in FC4
Date: Mon, 30 Jan 2006 09:32:09 +0100
Message-ID: <43DDCF09.3050400@ccr.jussieu.fr>
References: <1138587184.10860.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1138587184.10860.57.camel@localhost>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jabennett@insightbb.com
Cc: linux-hams@vger.kernel.org

Hi John,

I suggest you download 2.6.14.4 kernel source and install it on your 
Linux box.

I did it using a Mandriva 2006 official distro which comes with 2.6.12 
then installed vanilla 2.6.14.4 on three different PCs.

There was no kernel panics using Mkiss with this kernel. In fact I have 
tested 2.6.14.3 and 4 with good success.

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org (mirror)
http://rose.fpac.free.fr/

-------------

John Bennett wrote :
> Hey guys,
> 
> I routinely read the emails in this list and don't remember seeing
> anything like this before. If this issue has been previously discussed,
> my apologies.
> 
> FC4 built from CDs. Updated everything with yum. Latest libax25,
> ax25-tools built from tarballs. Rebuilt kernel using
> 'kernel-2.6.14-1.1656_FC4.src.rpm' sources. Rebuilt kernel because I
> needed mkiss for a TNC attached to a serial port. TNC is an MFJ-1274
> using TAPR firmware 1.1.8 or 1.1.7b (can't remember which).
> 
> Machine in question was a P3-500 w/256 MB. Previously installed and ran
> RH9 with a 2.4 kernel on it for the last year with no problems. This was
> an 'upgrade' which is actually a new install (never have found that
> upgrade paths work well). Due to time constraints, I had to leave and
> finish building and configuring the machine remotely.
> 
> This build/hardware configuration was similar to several other builds
> completed in the last two months.
> 
> When starting ax25 (kissattach), there was a kernel panic every time.
> Tried 2.6.11 and 2.6.12, but the TIOCSETD error kept popping up. Went
> back to 2.6.14. Finally decided there must be a hardware problem with
> this particular box that was not on the others. Grabbed another machine
> that was identical to an installation running at another QTH (P3-866
> w/512MB). Built and checked on the bench here. All worked as it should.
> 
> Today I drove to the remote site, installed the new box, and immediately
> got a kernel panic. After some investigation, I discovered that the TNC
> had dropped out of the KISS mode. If the TNC was disconnected or the
> power was off when doing a kissattach, no problems. The instant the TNC
> was switched on or was on when invoking kissattach there was a kernel
> panic. Using minicom, I put the errant TNC back into the KISS mode.
> Everything now works.
> 
> I suspect that when mkiss receives certain characters from the TNC when
> in the normal (?) mode, it is causing a segmentation fault of some kind
> that causes the panic. I know this has not been an issue in the past
> with other kernels (i.e., 2.4). While it doesn't happen very often, TNCs
> do drop out of KISS if something screwy happens. Hopefully someone on
> this list is the maintainer and can take a look at the code. I scanned
> through 'kissattach' and didn't see anything that could cause the
> problem. It's fairly simple program.
> 
> At least the week-long siege of frustration is finally over...
> 
> 73
> 
