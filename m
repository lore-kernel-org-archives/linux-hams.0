From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: problems with soundmodem (userspace)
Date: Tue, 15 Jun 2004 16:57:38 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40CF0E62.3070500@cs.unibo.it>
References: <20040607203614.30352.qmail@radagast.org> <40C5F2A5.8010603@alumni.ethz.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020608070207000404070701"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40C5F2A5.8010603@alumni.ethz.ch>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------020608070207000404070701
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Sailer wrote:

> I've put a soundmodem version with a rather experimental native Alsa API
> on http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.9.tar.gz

I am having the same problem with rx packets being lost so I gave this 
version a try. Now RX is apparently fine, but on the first TX packet the 
soundmodem crashes with the following output:

-cut-cut-
ALSA lib pcm_hw.c:494:(snd_pcm_hw_start) SNDRV_PCM_IOCTL_START failed: 
Broken pipe
sm[21164]: snd_pcm_start: Broken pipeALSA lib 
pcm_hw.c:494:(snd_pcm_hw_start) SNDRV_PCM_IOCTL_START failed: File 
descriptor in bad state
sm[21164]: snd_pcm_start: File descriptor in bad statesm[21164]: audio: 
snd_pcm_readi: Broken pipec
-cut-cut-

I tried using something else than hw:0,0 but it either results in a 
config error or in a similar crash. Here is the relevant info about my 
Alsa setup, is there any obvious mistake in the config?

/proc/asound/cards:
0 [V8235          ]: VIA8233 - VIA 8235
                      VIA 8235 at 0x1400, irq 9

/proc/asound/devices:
   0: [0- 0]: ctl
  17: [0- 1]: digital audio playback
  25: [0- 1]: digital audio capture
  16: [0- 0]: digital audio playback
  24: [0- 0]: digital audio capture
  33:       : timer

/proc/asound/pcm:
0-00: VIA 8235 : VIA 8235 : playback 4 : capture 1
00-01: VIA 8235 : VIA 8235 : playback 1 : capture 1

/proc/asound/version:
Advanced Linux Sound Architecture Driver Version 1.0.4rc2 (Tue Mar 30 
08:19:30 2004 UTC).
Compiled on Jun 12 2004 for kernel 2.6.6clarisse.


B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

--------------020608070207000404070701
Content-Type: text/xml;
 name="soundmodem.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="soundmodem.conf"

<?xml version="1.0"?>
<modem>
  <configuration name="Packet">
    <channel name="Channel 0">
      <mod mode="afsk" bps="1200" f0="1200" f1="2200" diffenc="1"/>
      <demod mode="afsk" bps="1200" f0="1200" f1="2200" diffdec="1"/>
      <pkt mode="MKISS" ifname="sm0" hwaddr="IZ4FHT-1" ip="192.168.10.2" netmask="255.255.255.0" broadcast="192.168.10.255"/>
    </channel>
    <chaccess txdelay="500" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
    <audio type="alsa" device="hw:0,1" halfdup="1" capturechannelmode="Left"/>
    <ptt file="/dev/ptt"/>
  </configuration>
</modem>

--------------020608070207000404070701--
