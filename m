From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Sony VAIO laptop 'soundmodem' troubles
Date: Sun, 25 Jul 2004 12:09:02 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4103A2DE.16410.287F81@localhost>
References: <E1BoSf3-0006hp-00@penngrove.fdns.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <E1BoSf3-0006hp-00@penngrove.fdns.net>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: John Mock <kd6pag@qsl.net>



---
On 24 Jul 2004 at 12:58, John Mock wrote:

> I'm trying to get 9.6kb packet running either on a PowerMac 8500 (with
> G3 upgrade) or Sony VAIO R505EL (P-III), preferably both.  I'm stuck on
> either at the moment.  Here's the Sony problem.
> 
> On the VAIO machine, 'multimon' decodes APRS packets at 1.2kb AFSK from
> either of my HT's directly connected to the 'Mic' input. 'soundmodemconfig' 
> shows similar waveforms to 'multimon' but gets gibberish for APRS packets
> in 'soundcard' [non-ALSA] mode.
> 
> Thus far, i have not found anyone transmitting 9.6kb packet locally, and
> attempts to receive a couple of different satellites so far as not gotten
> any packets at 9.6 kb using 'multimon'.  (I have not yet tried 9.6kb with
> 'soundmodem'.)
> 
> I looked into the LINUX-Hams archives, and note that others have not had
> an easy time getting the AC97 codec to work properly.  I picked up a copy
> of experimental version of 'soundmodem' with native ALSA code mentioned in 
> June of this year.  Forcing the AFSK sample rate to either 22050 Hz or 
> 48000 Hz in 'soundcard' mode does not seem to change anything (c.f. the
> discussion of similar problem[s] here in March of this year).  Trying to
> use native ALSA mode shows a dialog box "Cannot start audio I/O" and the
> message
> 
>     ALSA lib pcm.c:1972:(snd_pcm_open_noupdate) Unknown PCM /dev/dsp
> 
> A copy of '/etc/ax25/soundmodem.conf' and the full error log are attached
> below.  I am running a vanilla LINUX 2.6.7 [.config posted upon request]
> and the 'unstable' branch of Debian LINUX.
> 
> Any idea what might be wrong with 'soundmodem' at 1.2 kb AFSK and/or with
> 'multimon' at 9.6kb FSK?  (Of course, fixing 'multimon' is really only a
> temporary fix, as i want to make packet work properly.)
> 
> Thank you for your patience and assistance.
> 
> 		         -- KD6PAG  (Networking Old-Timer, Satellite QRPer)
> 
> 
> [Note: I never send unsolicited binary attachments and if you receive anything
> purportedly from <kd6pag@qsl.net> that isn't signed with my callsign, then it
> probably isn't from me.]
> 
> -------------------------------------------------------------------------------
> <?xml version="1.0"?>
> <modem>
>   <configuration name="vaio">
>     <chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
>     <audio type="alsa" device="/dev/dsp" halfdup="0" file="" repeat="0" simchan="0 - Ideal channel" snr="10" snrmode="0 - White Gaussian" srate="0" capturechannelmode="Mono"/>
>     <ptt file="none"/>
>     <channel name="Channel 0">
>       <mod mode="afsk" bps="1200" f0="1200" f1="2200" diffenc="1"/>
>       <demod mode="afsk" bps="1200" f0="1200" f1="2200" diffdec="1"/>
>       <pkt mode="MKISS" ifname="sm0" hwaddr="KD6PAG-1" ip="44.4.28.42" netmask="255.255.255.0" broadcast="44.4.28.255"/>
>     </channel>
>     <channel name="Channel 1">
>       <mod mode="fsk" bps="9600" f0="1200" f1="2200"/>
>       <demod mode="fsk" bps="9600"/>
>       <pkt mode="MKISS" ifname="sm1" hwaddr="KD6PAG-2" ip="44.4.28.42" netmask="255.255.255.0" broadcast="44.4.28.255"/>
>     </channel>
>   </configuration>
> </modem>
> -------------------------------------------------------------------------------

I'm using soundmodem at 1200bps with oss drivers on a k6-2 
based machine. Some time ago made some tries at 2400bps with 
the same sondmodem, adding a second channel. It worked, but 
then noticed that 1200 decoding was worse. Some stations 
were decoded as normal, and some weren't decoded at all. So, 
try 1200 and 9600 one at a time to see if that improves 
decoding.

The soundcard I'm using with soundmodem is an old one, that 
does not support full-duplex operation, but some told me 
that with full-duplex option enabled had some problems. So, 
try setting the soundcard to half-duplex mode too 
(halfdup="1" ) and then tell us if you had any sucess.

Good luck.
