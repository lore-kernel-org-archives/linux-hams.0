From: Daniel Parthey <linux-hams@spambox.dyndns.org>
Subject: PROBLEM: baycom_ser_fdx in kernel 2.6 broken
Date: Sun, 8 May 2005 21:17:35 +0200
Message-ID: <20050508191735.GA15489@daniel.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hamradio mailing list <linux-hams@vger.kernel.org>
Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>

I could not get AX25 to work under kernel 2.6.11.6 although it ran
fine under kernel 2.4.x, using a serial baycom modem with baycom_ser_fdx.

Receiving packets works without any problems, but the transmitted
packets cannot be decoded by other stations.

I set up another testbox (situated in the same building) with a
soundcard and the soundmodem tools to analyse this problem.

I could only read some data after enabling "pass all" (no FCS check)
and then it looked like some bytes were missing.

Packet: fm D0CHZ0-3 to IATEp-14 via B0STL0-3,H2NOD0-1 I35  pid=65
          ^            ^

The correct frame header should look like:

Packet: fm ND0CHZ-0 to IGATE-0 via CB0STL-0,CH2NOD-0 I35  pid=65

As far as I can tell from looking at the waveforms, my packets are
complete and not cut off, neither at the beginning nor the end.

Packets received from other stations are decoded correctly.

[Sending station]

  - Vanilla kernel (kernel.org) 2.6.11.6 with the configuration
    adapted from the debian kernel
  - Kernel compiled with gcc version 3.3.5
  - Processor Intel Celeron (Mendocino) 450 MHz

  - Serial configuration (Modem on ttyS0)
    # setserial -g /dev/ttyS{0,1}
    /dev/ttyS0, UART: unknown, Port: 0x03f8, IRQ: 4
    /dev/ttyS1, UART: 16550A, Port: 0x02f8, IRQ: 3

  - Baycom startup options:
    sethdlc -p -i bcsf0 mode "ser12*" io 0x3f8 irq 4
    ifup bcsf0
    sethdlc -i bcsf0 -a half

  - Module parameters for /etc/modules.conf
    options baycom_ser_fdx mode="ser12*" iobase=0x3f8 irq=4
    alias bcsf0 baycom_ser_fdx
    alias nr0 netrom
    alias tty-ldisc-5  mkiss

  - Loaded modules:
    hdlcdrv, baycom_ser_fdx, ax25, mkiss, af_packet

  - /etc/ax25/axports
    cb  CBPORT-0  19200 255 7 CB-Funk
    axudp AXUDP-0   19200 255 7 Netzwerk AX25UDP Link
    lokal CH0CON-0  19200 255 7 Lokal

# cat /proc/ioports | grep baycom
03f8-03ff : baycom_ser_fdx

# cat /proc/interrupts 
           CPU0       
  0:     285101          XT-PIC  timer
  1:        130          XT-PIC  i8042
  2:          0          XT-PIC  cascade
  4:      39576          XT-PIC  baycom_ser_fdx
  7:          0          XT-PIC  parport0
 11:       3473          XT-PIC  Intel ICH 82801AA, eth0
 12:       9693          XT-PIC  HiSax, uhci_hcd, eth1
 14:      17651          XT-PIC  ide0
 15:         13          XT-PIC  ide1
NMI:          0 
LOC:          0 
ERR:          0
MIS:          0


[Testbox]

- soundmodemconfig from debian package "soundmodem" version 0.9-1

The complete output of soundmodemconfig with "pass all" enabled:

Modulator: afsk Demodulator: afsk
Modulator: parameter bps value 1200
Modulator: parameter f0 value 1200
Modulator: parameter f1 value 2200
Modulator: parameter diffenc value 1
Demodulator: parameter bps value 1200
Demodulator: parameter f0 value 1200
Demodulator: parameter f1 value 2200
Demodulator: parameter diffdec value 1
Minimum sampling rate: 9600
Audio IO: type soundcard
sm[7286]: audio: starting "/dev/dsp"
sm[7286]: audio: forcing half duplex mode
sm[7286]: audio: sample rate 9600 input fragsz 256 numfrags 2 output fragsz 256 numfrags 256
Real sampling rate: 9600
passall: 1
passall: 0
passall: 1
Packet: fm ND0CHZ-0 to kIATE-0 via CB0M0C-8,2NOD0-8,*42'2:-7,722&-4 I37^ pid=75
x), 1.79dp02 (JO60JT:ND0CHZ)
Internet-Node Chemnitz-Gruena - Mail DP9BOX

Packet: 
Packet: 
Packet: fm D0CHZ0-3 to IATEp-14 via B0STL0-3,H2NOD0-1 I35  pid=65
NetNode (Linux), 1.79dp02 (JO60JT:ND0CHZ)
Internet-Node Chemnitz-Gruena - Mail DP9BOX

Packet: fm NXHZ0C-2 to kIATE-0 via 0STL0C-8,2NOD0-8,*42'2:-7,722&-4 I37  pid=75
x), 1.79dp0(JO60JT:NdHZ)
Internet-Node Chemnitz-Gruena - Mail DP9BOX

Packet: 
Joining TxThread
Joining RxThread
Releasing IO

I would be happy to provide further information if necessary.

Bye,
Daniel.
-- 
JabberID: pada@jabber.ccc.de
http://de.wikipedia.org/wiki/Jabber
