From: Niall Parker <niall@ve7hex.ampr.org>
Subject: ancient history ...
Date: Wed, 07 Jul 2004 23:53:30 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40ECEF6A.1070202@ve7hex.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello,

I'm trying to get an old machine I had running years ago back online and I'm 
running into problems, maybe someone here with a good memory can help me.

The system is running kernel 2.0.37 with ax.25 compiled in (no modules) and 
using the ax25-utils-2.0.12. I've managed to get the system running and hearing 
traffic but when I try to connect using call I get

---

[niall@ve7hexgw /tmp]$ call lsp spr
GW4PTS AX.25 Connect v1.11
*** Connected to spr
Error opening terminal: xterm.
[niall@ve7hexgw /tmp]$

----

the trace of packets going back and forth for this

----

[Thu Jul  8 02:57:34 2004]
Port lsp: AX25: VE7SPR-8->ID <UI C> pid=Text
0000  TheNet Plus 2.08 (SPR).

[Thu Jul  8 03:07:03 2004]
Port lsp: AX25: VE7HEX->SPR <C C P>

[Thu Jul  8 03:07:05 2004]
Port lsp: AX25: SPR->VE7HEX <UA R F>

[Thu Jul  8 03:07:05 2004]
Port lsp: AX25: VE7HEX->SPR <D C P>

[Thu Jul  8 03:07:06 2004]
Port lsp: AX25: SPR->VE7HEX <UA R F>

----

It appears my system is dropping the connection as soon as it gets an 
acknowledgement. Any ideas what is configured wrong ? The system worked fine 
when I was using it 4 years ago, though I mainly used it for tcp/ip stuff and 
didn't do much with ax.25/netrom etc.

The error message above is not within the call executable, nor can I find it in 
the ax25-utils source anywhere. The system is very limited for debugging, no 
strace/gdb etc (it was stripped down to run in 2 MB RAM) and short of rebuilding 
another box with the old distribution CDs I no longer have anything this old 
running.

Any ideas appreciated.

						... Niall (VE7HEX)

