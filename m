From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: IO, IRQ and DMA in PCI soundblaster
Date: Fri, 13 Sep 2002 02:37:39 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020913093739.30307.qmail@web14401.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-hams@vger.kernel.org

Hi all,

My machine is installed RH 7.1 kernel 2.4.19 and
supported latest v. AX.25 stuff. I am trying to use
PCI Creative Soundblasters (SB) for soundmodem, but I
couldn't get the data of I/O, IRQ and DMA.=20
These pci cards are:
(1) Vibra 128 P20 (CT 5880)
(2) Creative-PCI 128 (CT 5880)
(3) Soundblaster Live 5.1! (EMU10K1)

I have tried using sndconfig command to configure the
Soundblaster Live 5.1! ... and I can hear the sample
sound. But in file /etc/modules.conf I couln't find
the specified data of i/o, irq and dma
# cat /etc/modules.conf
alias eth0 ne2k-pci
alias parport_lowlevel parport_pc
alias usb-controller usb-uhci
..
..
alias sm0                 soundmodem
..=20
alias sound-slot-0 emu10k1
post-install sound-slot-0 /bin/aumix-minimal =D0f
/etc/.aumixrc -L >/dev/null 2>&1 || :
pre-remove sound-slot-0 /bin/aumix-minimal =D0f
/etc/.aumixrc -S >/dev/null 2>&1 ||

How can I get the data of i/o, irq and dma for PCI
soundcard?
Is it impossible to use the PCI Soundcard for
soundmodem?

Many thanks for any assistance.
Vivi

__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com
