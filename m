From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: Soundmodem hangs all USB keyboard or mouse input -- and
 soundmodem 0.16: fix the AFSK modulator for 300 baud operation
Date: Sun, 08 Apr 2012 17:23:58 +0200
Message-ID: <1333898638.2072.18.camel@vortex>
References: <1330736067.25864.15.camel@vortex> <4F51E964.9080605@bfs.de>
	   <1330786027.2248.33.camel@vortex> <4F537D4A.6040507@bfs.de>
	   <1330892180.2083.84.camel@vortex> <4F776E14.7090104@trinnet.net>
	   <1333379832.2112.15.camel@vortex> <4F7B199F.3050104@trinnet.net>
	   <1333647291.2605.34.camel@vortex> <1333741818.4064.20.camel@vortex>
	  <4F7F7A2C.2030500@trinnet.net> <1333809855.2433.10.camel@vortex>
	 <4F80CA6B.4010204@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4F80CA6B.4010204@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <linux-hams@trinnet.net>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Hello David.

On Sat, 2012-04-07 at 16:14 -0700, David Ranch wrote:
> Hello Guido, Thomas, fellow Linux HAMs:
> 
> I've CCed the Linuxhams group as I'm curious if any of you have any 
> thoughts on why Soundmodem would be shutting down all USB-based keyboard 
> and mouse functionality until the process is killed!  In all my years of 
> Linux, I've never need something like this.  Very strange and any/all 
> comments would be very much appreciated!

Soundmodem should be accessing USB through ALSA/Pulseaudio not anything
lower level than that, so I doubt the problem with USB is being caused by
soundmodem itself.

You should perhaps cross-check if the problem persists with other audio
applications and then report it for as example as a kernel or Pulseaudio
issue, but I don't know...

> Few points:
> 
> 1) I've recently noticed a change on my system that when I run 
> soundmodemconfig (patched or unpatched), and I go into the spectrum 
> scope view, my USB keyboard and mouse stop responding!  Though the 
> spectrum scope continues to update, I can't type nor mouse around until 
> I kill soundmodem via an out of band SSH connection!   How weird!
> 
> This Gateway NV57 laptop system is Centos6 (linux 2.6.32) running 
> PulseAudio and Soundmodem using a USB soundcard (US Interface Navigator) 
> which is configured to use ALSA natively (not OSS).
> 
>      - If I configure soundmodemconfig to use the on-motherboard 
> soundcard, the keyboard and mouse continue to function when the spectrum 
> scope is running!  This makes me think this is a USB / kernel issue with 
> soundmodem
> 
>      - I moved all my various USB devices to different port locations 
> but there wasn't any improvement
>      - I tried disconnecting and re-connecting the USB to kb+mouse 
> adapter after the spectrum scope is running but that didn't help
>      - The KB+mouse are actually PS/2 style devices connecting through a 
> PS2 to USB adapter
>      - I've unconfigured the PTT port in soundmodemconfig to reduce 
> variables but that didn't have any change to the behavior
>      - I'm not running a KVM or Xen enabled kernel
>      - I've tried soundmodemconfig -S and that didn't allow the 
> soundsystem to be found.  Options -R and -M don't seem to be legal in 
> soundmodemconfig though the man page says they are.
> 
>      - When I start soundmodem and try to show the spectrum display, I 
> see the following on STDOUT:
> 
> [root@hampacket2 dranch]# soundmodemconfig
> on_configtree_selection_changed
> config_select: cfg: hampacket  chan: -
> selection: cfg: hampacket  chan: -
> on_configtree_selection_changed
> config_deselect: cfg: hampacket  chan: -
> selection: cfg: hampacket  chan: Channel 0
> Modulator: afsk Demodulator: afsk
> Modulator: parameter bps value 300
> Modulator: parameter f0 value 1600
> Modulator: parameter f1 value 1800
> Modulator: parameter diffenc value 1
> Demodulator: parameter bps value 300
> Demodulator: parameter f0 value 1600
> Demodulator: parameter f1 value 1800
> Demodulator: parameter diffdec value 1
> Minimum sampling rate: 11025
> Audio IO: type alsa
> ALSA: Using sample rate 11025, sample format 2, significant bits 16, 
> buffer size 5513, period size 165
> ALSA: Using sample rate 11025, sample format 2, significant bits 16, 
> buffer size 5513, period size 165
> sm[3644]: audio: starting "plughw:1,0"
> Real sampling rate: 11025
> sm[3644]: Opening PTT device "/dev/USI_PTT"
> --
> 
>      - As a test, I tried using "padsp" to try things under OSS 
> emulation but the /dev/dsp device isn't getting created.  It looks like 
> maybe soundmodem as asking for something that PulseAudio cannot support 
> (according to an strace):
>        --
> write(2, "utils/padsp.c: SNDCTL_DSP_CAPS\n", 31utils/padsp.c: 
> SNDCTL_DSP_CAPS) = 31
> write(2, "sm[4098]: ", 10sm[4098]: )              = 10
> write(2, "audio: forcing half duplex mode\n", 32audio: forcing half 
> duplex mode) = 32
> write(2, "utils/padsp.c: SNDCTL_DSP_SETFRA"..., 50utils/padsp.c: 
> SNDCTL_DSP_SETFRAGMENT: 0xffff0008) = 50
> futex(0x817160, FUTEX_UNLOCK_PI_PRIVATE, 0) = 0
> write(2, "utils/padsp.c: SNDCTL_DSP_SETFMT"..., 37utils/padsp.c: 
> SNDCTL_DSP_SETFMT: 16) = 37
> futex(0x817160, FUTEX_UNLOCK_PI_PRIVATE, 0) = 0
> write(2, "utils/padsp.c: SNDCTL_DSP_STEREO"..., 36utils/padsp.c: 
> SNDCTL_DSP_STEREO: 0) = 36
> write(2, "utils/padsp.c: SNDCTL_DSP_SPEED:"..., 39utils/padsp.c: 
> SNDCTL_DSP_SPEED: 11025) = 39
> futex(0x817160, FUTEX_LOCK_PI_PRIVATE, 1) = 0
> write(2, "utils/padsp.c: ss: s16le 1ch 110"..., 37utils/padsp.c: ss: 
> s16le 1ch 11025Hz) = 37
> futex(0x817160, FUTEX_UNLOCK_PI_PRIVATE, 0) = 0
> write(2, "utils/padsp.c: unknown ioctl 0x0"..., 40utils/padsp.c: unknown 
> ioctl 0x0000500e) = 40
> write(2, "sm[4098]: ", 10sm[4098]: )              = 10
> write(2, "audio: Error, cannot set nonbloc"..., 42audio: Error, cannot 
> set nonblocking mode) = 42 <-------------------------------------
> write(2, "utils/padsp.c: freeing fd info ("..., 38utils/padsp.c: freeing 
> fd info (fd=4)) = 38
> write(2, "utils/padsp.c: Draining.\n", 25utils/padsp.c: Draining.
>        --

So, pulseaudio is having problems... Unless you are certain that
soundmodem is using pulseaudio improperly, then you'd better narrow down
to a pulseaudio problem.

> I want to say soundmodem used to work on this specific machine with 
> Pulse/Alsa on plughw1,0.

If you are using the configuration file that I did send to you, you
should adapt it to suit your needs and configuration, it's just an
example, since you did ask...

If you just plugged in my configuration file, then that might be the
problem, as for example, it uses /dev/dsp directly (device="/dev/dsp")
and not alsa.

The configuration file was mainly intended to give a hint on tone
frequencies, differential enconding and decoding that need to be
enabled, half-duplex that needs to be enabled, but the rest, you need to
adapt it to your setup.

>   I even tried starting up an older kernel but 
> that didn't help.  I don't see anything helpful in /var/log/messages, 
> /var/log/Xorg.0.log, dmesg, etc.
> 
> 2) I'm trying the newer soundmodem-0.16 patch iz6rdb submitted to Thomas 
> for better 300BAUD performance but I thought you said you reverted one 
> of these patches.  I assume means I only need ONE of the patches.  Which 
> one should I NOT apply?
> 
> Sampling rate fix: 
> http://iz6rdb.trentalancia.com/en/soundmodem-0.16-use-a-minimum-samplerate-for-afsk-v5.patch
> Longer filters (I think it's this one you don't recommend now): 
> http://iz6rdb.trentalancia.com/en/soundmodem-0.16-increase-rx-filters-parameters.patch

As I told you already off-list, you will probably need both of them. Or at least
I do need both of them, but I couldn't test on different setups or carry out
any further optimization.

> 3) With the unpatched soundmodemconfig spectrum view, there isn't any 
> waveforms in column #1 but I do see all spectrum filling in columns 
> 2-8.  With your patches applied, I see the upper frequencies of column 1 
> filled (50%) all the way through column 4.  Columns 5-8 are completely 
> empty.  It's as if all the spectrum has been compressed into the first 
> four columns with your patch.  Is that expected?   It seems to be due to 
> the soundmodem-0.16-use-a-minimum-samplerate-for-afsk-v5.patch patch
> 
> 4) With your patched soundmodem code running with a config of 1600/1800 
> mark/space, if I hit the PTT button say in the spectrum screen, I get 
> one primary tone at 1700hz (according to the soundmodemconfig spectrum 
> scope) and two very large harmonics on each side of it (1390hz, 1550, 
> 1850, 1990).  With the original soundmodem-0.16 code, I get one single 
> tone at 1200hz and no harmonics
> 
> 5) In soundmodemconfig under channel 0, do you know what the 
> "differential encoding" option is for?

You need that. Online resources such as Wikipedia will explain you what 
that it for.

> 6) It seems I must apply the 
> soundmodem-0.16-use-a-minimum-samplerate-for-afsk-v5.patch FIRST and if 
> I don't, the other patch will fail to apply.

Yes, the first patch is mandatory until at least a new release of
soundmodem will accommodate 300 baud AFSK properly. The second patch
just makes the RX filter better. I do need the second patch for
successful decoding, however it might not be optimized. It just works
for me.

>   Might be worth mentioning 
> the order dependency on your website

It's explained in the patch. And they are listed orderly. Also with only
two patches, there are very few possible combinations ;-)

> 7) - Your patch files are assuming unique directories 
> (soundmodem-0.16-orig).  You should probably make them be more generic 
> and relative:
> 
> --- soundmodem-0.16-orig/afsk/modem.c   2012-02-29 20:31:24.356287000 +0100
> +++ soundmodem-0.16/afsk/modem.c        2012-03-03 19:14:07.696345582 +0100
> 
> to say
> 
> --- afsk/modem.c   2012-02-29 20:31:24.356287000 +0100
> +++ afsk/modem.c        2012-03-03 19:14:07.696345582 +0100

patch -p1: kernel standard options for diff.

> Sorry for the long email but lots of interesting stuff and I think 
> including all the details always helps to come to a complete picture of 
> the problem(s).

Yes indeed, interesting stuff. One day I'd also like to have more
configurable options (such as IIR filters), but it all takes time, you
know...

> 73s!
> 
> --David
> KI6ZHD

Summing up, I really doubt the USB conflict problem is due to soundmodem
itself. Double-check your configuration file rather than just
dumb-copying the one I did supply to you. If the problem with USB
persists, then you either need to do a bit of debugging yourself or try
reporting it to pulseaudio for example.

Another option is to try posting your configuration file on here for
others to check it.

Hope it helps. 73 Guido IZ6RDB
-- 
This email and any attachments are intended only for the person to which
this email is addressed and may contain confidential and/or privileged
information.  If you received this email in error, please do not
disclose the contents to anyone, but notify the sender immediately and
delete this email (and any attachments) from your system.

