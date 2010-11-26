From: David Ranch <linux-hams@trinnet.net>
Subject: Re: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Thu, 25 Nov 2010 21:23:27 -0800
Message-ID: <4CEF444F.6010308@trinnet.net>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM> <4CED5B60.5040108@radagast.org> <40C75B79D58C4ECDBC044010559CE8CA@LIVINGROOM> <4CEEB394.3020305@trinnet.net> <CF65928CBF594B608362298FFC1B9470@LIVINGROOM>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CF65928CBF594B608362298FFC1B9470@LIVINGROOM>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Tsutsumi Family <oakie@kamakuranet.ne.jp>, linux-hams@vger.kernel.org
Cc: 'Dave Platt' <dplatt@radagast.org>


Hello Take,

It's interesting you bring up the newQPSK setting. I've never found any=
=20
comprehensive documentation on soundmodem and what some of these other=20
modes are. Do you know? Anybody else on the list know or could comment?

fsk - I know what FSK is but what does it mean in respect to soundmodem=
?=20
My Yaesu FT-950 supports an FSK input and my US Interfaces Navigator=20
device does FSK too but how would soundmodem use it? Seems it's slowest=
=20
speed is 4800Bits/sec.

pam - what is pam?

psk - I know what PSK is and I use the BPSK31 mode in Fldigi but what=20
would soundmodem do with it in respect to a packet mode?

newqpsk - I know what QPSK is and I've used the QPSK31 mode in Fldigi=20
(has forms of FEC enabled on it) but what would soundmodem do with it i=
n=20
respect to a packet mode? Seems it's slowest speed is 1000Bits/sec.


I would love to learn what these modes do, are they stable, and maybe=20
these modes could be used as a strong alternative to trying/failing=20
300BAUD HF packet.

--David

> 900/1100 offset seems to a typical practice for the soundmodem 300bps
> operation.
>
> I share your concern concerning it would not be the practical capabil=
ity to
> be used at HF.
>
> By the way, does anybody know the implementation status in the radio =
amateur
> world about EHAS (Hispano-American Health Link) protocol which is ori=
ginally
> based on radio amateur Linux AX.25 and the soundmodem of both FSK and
> newQPSK modes but adds the several performance improvement techniques=
 like
> FEC, Turbocodes, ARQ e.t.c.?=20
>
> The several literatures can be googled by =93EHAS=94.
>
> Regards,
>
> take
>
> De JA5AEA
>
> ________________________________________
> From: David Ranch [mailto:linux-hams@trinnet.net]=20
> Sent: Friday, November 26, 2010 4:06 AM
> To: Tsutsumi Family; linux-hams@vger.kernel.org
> Cc: 'Dave Platt'
> Subject: Re: 300bps Packet
>
>
> I've used the same 900/1100 offset setting for 300baud HF packet with
> Soundmodem and things worked OK I suppose.  I ultimately came to the
> conclusion (as did others in my research) that without a beam and hig=
h
> power, HF packet doesn't work very well.  I would get four times more
> retries than actual good packet exchanges from Santa Clara, CA to say=
=20
> Denver, CO. (Google 'Network 105').  For this exact reason, I've been
> tracking the Winmor efforts and it's upcoming kb-to-kb mode.  I hope =
one day
> we'll see it on Linux where we can get a packet-like mode with real F=
EC for
> an inexpensive price.  I now can now truly appreciate Pactor2/3 but t=
he
> beyond acceptable high costs of the single vendor TNC and the proprie=
tary
> nature of the mode are show stoppers for me.
>
> Anyway, I have my Soundmodem HF and VHF settings here:
>
>    http://www.trinityos.com/HAM/CentosDigitalModes/etc/ax25/
>
>
> If anyone would like to put together a sched. (might be fun to try), =
email
> me.=20
>
> --David
>
>
> Tsutsumi Family wrote:=20
> Dave,
>
> Thank you for your quick reply.
>
> Along with Phill's configuration parameters i.e. f0=3D900Hz and f1=3D=
1,100Hz in
> the separate correspondence, the conclusion seems to be that f0 and f=
1 must
> be any arbitrary numbers below 1,200Hz and above the low cut frequenc=
y of
> his/her TX/RX audio path with 200Hz gap.
>
> As the above conclusion is unique nature of the soundmodem, the fact =
should
> be widespread to the new 300bps AFSK SSB users of the soundmodem and =
I hope
> Andrew's pointed sites will kindly cover this.
>
> Regards,
>
> take
>
> de JA5AEA
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Dave Platt
> Sent: Thursday, November 25, 2010 3:37 AM
> To: linux-hams@vger.kernel.org
> Subject: Re: 300bps Packet
>
> Tsutsumi Family wrote:
>  =20
> Dave,
>
> Thank you for providing the tutorial of SM source codes.
>
> As one of ways to solve 300bps SSB operation without any code change,=
 you
> are suggesting to use the frequency setting of f0 and f1 to less than=
 4 x
> 300bps =3D1,200 Hz such as 800Hz and 1,000Hz, not conventional 2,100H=
z and
> 2,300Hz.
>
> Correct?
>    =20
>
> Correct - I think this ought to work.  As long as you don't pick
> frequencies so low that your audio connection (PC to rig) is
> rolling off the amplitude (due to e.g. transformer isolation
> in the audio path) this approach should let you generate a pair
> of tones with a suitable separation.
>
> You'll just need to tune your sideband rig a bit differently than
> if you were using a traditional "hard" TNC with its receive filters
> tuned for a 2200 Hz channel center.  Just tune to match up the
> tone you hear during reception, with the tone that your PC generates
> during transmission... it'll be an octave or so lower than the usual
> pitch but it should work.
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
