From: "Tsutsumi Family" <oakie@kamakuranet.ne.jp>
Subject: RE: 300bps Packet (and EHAS)
Date: Fri, 26 Nov 2010 11:52:34 +0900
Message-ID: <CF65928CBF594B608362298FFC1B9470@LIVINGROOM>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM> <4CED5B60.5040108@radagast.org> <40C75B79D58C4ECDBC044010559CE8CA@LIVINGROOM> <4CEEB394.3020305@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: 
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 'David Ranch' <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Cc: 'Dave Platt' <dplatt@radagast.org>

Resent with text mode.
________________________________________
=46rom: Tsutsumi Family [mailto:oakie@kamakuranet.ne.jp]=20
Sent: Friday, November 26, 2010 10:39 AM
To: 'David Ranch'; 'linux-hams@vger.kernel.org'
Cc: 'Dave Platt'
Subject: RE: 300bps Packet

David,

900/1100 offset seems to a typical practice for the soundmodem 300bps
operation.

I share your concern concerning it would not be the practical capabilit=
y to
be used at HF.

By the way, does anybody know the implementation status in the radio am=
ateur
world about EHAS (Hispano-American Health Link) protocol which is origi=
nally
based on radio amateur Linux AX.25 and the soundmodem of both FSK and
newQPSK modes but adds the several performance improvement techniques l=
ike
=46EC, Turbocodes, ARQ e.t.c.?=20

The several literatures can be googled by =93EHAS=94.

Regards,

take

De JA5AEA

________________________________________
=46rom: David Ranch [mailto:linux-hams@trinnet.net]=20
Sent: Friday, November 26, 2010 4:06 AM
To: Tsutsumi Family; linux-hams@vger.kernel.org
Cc: 'Dave Platt'
Subject: Re: 300bps Packet


I've used the same 900/1100 offset setting for 300baud HF packet with
Soundmodem and things worked OK I suppose.=A0 I ultimately came to the
conclusion (as did others in my research) that without a beam and high
power, HF packet doesn't work very well.=A0 I would get four times more
retries than actual good packet exchanges from Santa Clara, CA to say=A0
Denver, CO. (Google 'Network 105').=A0 For this exact reason, I've been
tracking the Winmor efforts and it's upcoming kb-to-kb mode.=A0 I hope =
one day
we'll see it on Linux where we can get a packet-like mode with real FEC=
 for
an inexpensive price.=A0 I now can now truly appreciate Pactor2/3 but t=
he
beyond acceptable high costs of the single vendor TNC and the proprieta=
ry
nature of the mode are show stoppers for me.

Anyway, I have my Soundmodem HF and VHF settings here:

=A0=A0 http://www.trinityos.com/HAM/CentosDigitalModes/etc/ax25/


If anyone would like to put together a sched. (might be fun to try), em=
ail
me.=20

--David


Tsutsumi Family wrote:=20
Dave,

Thank you for your quick reply.

Along with Phill's configuration parameters i.e. f0=3D900Hz and f1=3D1,=
100Hz in
the separate correspondence, the conclusion seems to be that f0 and f1 =
must
be any arbitrary numbers below 1,200Hz and above the low cut frequency =
of
his/her TX/RX audio path with 200Hz gap.

As the above conclusion is unique nature of the soundmodem, the fact sh=
ould
be widespread to the new 300bps AFSK SSB users of the soundmodem and I =
hope
Andrew's pointed sites will kindly cover this.

Regards,

take

de JA5AEA
-----Original Message-----
=46rom: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Dave Platt
Sent: Thursday, November 25, 2010 3:37 AM
To: linux-hams@vger.kernel.org
Subject: Re: 300bps Packet

Tsutsumi Family wrote:
=A0=20
Dave,

Thank you for providing the tutorial of SM source codes.

As one of ways to solve 300bps SSB operation without any code change, y=
ou
are suggesting to use the frequency setting of f0 and f1 to less than 4=
 x
300bps =3D1,200 Hz such as 800Hz and 1,000Hz, not conventional 2,100Hz =
and
2,300Hz.

Correct?
=A0=A0=A0=20

Correct - I think this ought to work.=A0 As long as you don't pick
frequencies so low that your audio connection (PC to rig) is
rolling off the amplitude (due to e.g. transformer isolation
in the audio path) this approach should let you generate a pair
of tones with a suitable separation.

You'll just need to tune your sideband rig a bit differently than
if you were using a traditional "hard" TNC with its receive filters
tuned for a 2200 Hz channel center.=A0 Just tune to match up the
tone you hear during reception, with the tone that your PC generates
during transmission... it'll be an octave or so lower than the usual
pitch but it should work.



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
=A0=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
