From: John Mock <kd6pag@qsl.net>
Subject: re: Sony VAIO laptop 'soundmodem' troubles
Date: Sat, 24 Jul 2004 15:22:18 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E1BoUuI-000791-00@penngrove.fdns.net>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thanks for the ALSA suggestions.  That fixed my audio startup error at
least, that is to say, with 'Mode: alsa', i now see the usual sine waves
at the two AFSK frequencies.  However, it still isn't successful at
decoding anything; DCD in the Scope display does not light, and there
are not the expected bimodal peaks at 1200 and 2200 Hz on the spectrum
display (maybe just weak spikes).  Attached are the new log and config 
files.

Any futher suggestions would be gratefully appreciated.  'multimon' still
works just fine, so i haven't broken anything.

Thank you again for your patience and assistance!

		         -- KD6PAG  (Networking Old-Timer, Satellite QRPer)


P.S.  AE6EO: I'm already using a 10K trimpot to set the level here for VAIO
audio input, since there is no level setting on Kenwood TH-F6A in 9.6kb mode.
Alas, that doesn't work very well on the Mac, as i previously noted and is 
the wrong approach, as you noted, for noise reasons.  I would rather fix the
software than kludge the hardware.  *SIGH*


[Note: I never send unsolicited binary attachments and if you receive anything
purportedly from <kd6pag@qsl.net> that isn't signed with my callsign, then it
probably isn't from me.]

-------------------------------------------------------------------------------
VAIO 510> sudo ./soundmodemconfig 
config_select: cfg: vaio  chan: -
selection: cfg: vaio  chan: -
config_deselect: cfg: vaio  chan: -
channel_select: cfg: vaio  chan: Channel 0
selection: cfg: vaio  chan: Channel 0
Modulator: Off Demodulator: afsk
Demodulator: parameter bps value 1200
Demodulator: parameter f0 value 1200
Demodulator: parameter f1 value 2200
Demodulator: parameter diffdec value 0
Minimum sampling rate: 7000
Audio IO: type alsa
sm[3874]: chanmode: 0x80d8528 [0x1]
ALSA: Using sample rate 48000, sample format 2, significant bits 16, buffer size 16384, period size 512
sm[3874]: audio: starting "hw:0,0"
Real sampling rate: 7000
-------------------------------------------------------------------------------
<?xml version="1.0"?>
<modem>
  <configuration name="vaio">
    <chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
    <audio type="alsa" device="hw:0,0" halfdup="0" file="" repeat="0" simchan="0 - Ideal channel" snr="10" snrmode="0 - White Gaussian" srate="0" capturechannelmode="Left"/>
    <ptt file="none"/>
    <channel name="Channel 0">
      <mod mode="Off" bps="1200" f0="1200" f1="2200" diffenc="1"/>
      <demod mode="afsk" bps="1200" f0="1200" f1="2200" diffdec="0"/>
      <pkt mode="MKISS" ifname="sm0" hwaddr="KD6PAG-1" ip="44.4.28.42" netmask="255.255.255.0" broadcast="44.4.28.255"/>
    </channel>
    <channel name="Channel 1">
      <mod mode="fsk" bps="9600" f0="1200" f1="2200"/>
      <demod mode="fsk" bps="9600"/>
      <pkt mode="MKISS" ifname="sm1" hwaddr="KD6PAG-2" ip="44.4.28.42" netmask="255.255.255.0" broadcast="44.4.28.255"/>
    </channel>
  </configuration>
</modem>
===============================================================================
