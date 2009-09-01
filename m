From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX25 help site
Date: Tue, 01 Sep 2009 15:59:15 -0700
Message-ID: <4A9DA743.9090101@radagast.org>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1251842807.8971.1.camel@w8iss-desktop>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: w8iss <w8iss@wideopenwest.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

w8iss wrote:
> Wondering if anyone has used the tnc-x either serial port or USB
> with their AX25 setup?

I have used an earlier version of the TNC-X with AX.25.

I bought it with the USB interface, but wasn't happy with it...
unplugging the adapter tended to cause my system to go into
a CPU-burning loop.  I believe that this may have been due
to problems in the FTDI driver in the kernel and/or in the USB
stack... something didn't take well to having the endpoint device
yanked out from underneath the stack.  Things may have improved
in the several years since then.

I switched over to using one of the RS-232 serial ports in my
system.  This worked more reliably - the hangs went away.

The TNC-X uses KISS as its basic communication protocol with
the host (and it does support hardware flow control to avoid
transmit-buffer overruns).  Unfortunately, KISS has a fundamental
design limitation - it's impossible for the host to know just when
a packet has been transmitted, so that the host can start the
retransmit timer for that connection.  As a result, KISS-based
implementations (including the TNC-X) can make a congested frequency
even worse, by retransmitting packets unnecessarily (the retransmit
timer runs out while the TNC-X still has the packet in its buffer
and is waiting for "clear air" to send).  Without a more
sophisticated protocol between host AX.25 stack and TNC, I don't
think this problem can be avoided.

One problem I noted was a significant incompatibility between
the TNC-X, and Thomas Sailer's "soundmodem", when the former was
on the receiving end and the latter was sending.  When the soundmodem
send back-to-back AX.25 packets, the TNC-X would often lose all but
the first.

Investigation showed (I feel) that both the TNC-X and the soundmodem
were responsible for this - they had different deficiencies, which
individually weren't of great significance but which interacted quite
badly.

Soundmodem's deficiency:  it violates a "SHOULD" clause in the
AX.25 spec, which says that any idle time between packets SHOULD be
filled with FLAG octets (i.e. synchronization or idle).  The code
in soundmodem encodes AX.25 packets one at a time, and it always
starts encoding on a byte boundary in its output buffer.  AX.25
packets aren't always an integral number of bytes, due to the
use of bit stuffing.  The soundmodem will transmit the required
number of complete bytes, padding out the last encoded byte with
zero bits, before it encodes and sends the FLAG which starts the next
packet.  As a result, a back-to-back packet transmission looks like

   FLAG-packet1-FLAG-zeros-FLAG-packet2-FLAG

The TNC-X deficiency:  in the firmware version I received,
the TNC-X would "lose sync" with the packet stream as a result
of the extraneous zero bits in between the FLAG at the end of the
first packet and the FLAG at the start of the next.  Its
packet-parsing logic failed to resynchronize, and wouldn't
successfully do so until it received several FLAG bytes in
sequence... which usually didn't happen until the next
complete transmission.

Result:  massive packet loss and excessive retransmissions.

I reported this problem to the author of TNC-X, and also
to Thomas Sailer (and, in the latter case, included a source
change to the soundmodem which eliminated the mis-packing
in between the packets).  An alternate fix might be to give
the soundmodem the ability to insert one or more additional
PADs in between packets, in order to allow for a more robust
re-syncing.

The author of TNC-X subsequently released a new version of
the firmware, which I believe has addressed this problem
(enabling the firmware to re-sync on the first PAD of the
next packet).  One of these days I need to flash a new
PIC and test it out :-)

Mr. Sailer rejected my proposed fix to the soundmodem.  It's
his feeling that a proper HDLC receiver ought not to mind
the extraneous zero bits in the packet, and that the TNC-X's
failure to resynchronize was the real problem.

I personally feel that both the TNC-X code, and soundmodem,
were slightly in violation of good engineering practice
(i.e. "be conservative in what you send, and liberal in what
you're able to receive") and that modifying the soundmodem
code to comply with the "SHOULD" recommendation in the AX.25
spec would be appropriate.  Since it's his code, I haven't
pursued the matter further... I just patch it locally any time
I install a new version.

I've heard some people criticize the TNC-X for being
rather sensitive to RF coupled back from the transmitter
and antenna - it can hang, and require a power-cycle to reset.
Using a version in a robust metal case, properly grounded, and
with plenty of ferrite chokes on the power and data and radio
cables would probably be wise.



