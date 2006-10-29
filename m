From: richard <richard.bown@blueyonder.co.uk>
Subject: gmfsk
Date: Sun, 29 Oct 2006 16:40:44 +0000
Message-ID: <4544D98C.7080405@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Apologies if this has already got on the list, I think I sent it before 
list aurthorisation was granted

Hi all
System here
Mandriva 2007 Gnome 2.16
GMFSK 0.7 pre1
sound cards M-audio delta 66
on board  VIA 8253


Problem:-

Cant seem to get audio routed to GMFSK , it compiled OK as far as I
know, no errors .
In settings , selecting device /dev/dsp  /dev/dsp1 /dev/dsp2 doesn't
route audio to the program.
I've determined that /dev/dsp2 is the mic input off the webcam, so that
can be ignored.
There never seems to be any input directed  from /dev/dsp, bur /dev/dsp1
has an input even when everything has been muted.
I've had problems trying to get the sound from the TV card which is hard
wired to AUX i/p on the mobo to route through the digital mixer
to get routed out of the delta 66 breakout box to a diddy little hifi
system in the shack. So I'm aware that the two cards don't talk to each
other very well.

Is this behaviour I'm seeing on GMFSK normal , ie displaying garbage on
/dev/dsp1  ??

Yet I can run winrad using wine to use the delta66 card as the input and
the VIA 8253 as the output device

the output from lspci -v below
00:0d.0 Multimedia audio controller: VIA Technologies Inc. ICE1712
[Envy24] PCI Multi-Channel I/O Controller (rev 02)
        Subsystem: VIA Technologies Inc. M-Audio Delta 66
        Flags: bus master, medium devsel, latency 32, IRQ 17
        I/O ports at d800 [size=32]
        I/O ports at d400 [size=16]
        I/O ports at d000 [size=16]
        I/O ports at b800 [size=64]
        Capabilities: [80] Power Management version 1
00:11.5 Multimedia audio controller: VIA Technologies, Inc.
VT8233/A/8235/8237 AC97 Audio Controller (rev 50)
        Subsystem: ASUSTeK Computer Inc. A7V8X-X Motherboard
        Flags: medium devsel, IRQ 18
        I/O ports at e000 [size=256]
        Capabilities: [c0] Power Management version 2

I'm using the envy24 patch bay as well as the alsa control thing.
It used to be easy to determine which dsp was in use by selecting them
with other software like skype, which now lists devices not by which dsp
they are connected to, but by a list of device types.

Any help appreciated
73
Richard g8jvm




