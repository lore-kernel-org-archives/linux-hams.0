From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: ax25: setcrystal, hdlcdrv, soundmodem
Date: Fri, 30 Aug 2002 06:01:01 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020830130101.22653.qmail@web14407.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-hams@vger.kernel.org

Hi,

I have still the problem in my machine1 with ax25
stuff ;-(=20

But in another, machine2 I installed RH 7.1, upgraded
Kernel 2.4.18, CPU CyrixInstead M II 3x, [AudioPCI]
Ensoniq CT5880. I have compiled and installed:
libax25-0.0.10, ax25-apps-0.0.6, ax25-tools-0.0.8=20
Everything works smooth, I think :-)

Based on
<http://www.tldp.org/HOWTO/AX25-HOWTO/x235.html>=20
in machine2 doesn't appear directories and its files
(point 5.1. and 5.2.):=20
  /proc/sys/net/ax25/
  /proc/sys/net/ax25/portname/
  /proc/sys/net/netrom/
  /proc/sys/net/rose/
and doesn=EDt have utilities and modules (point 6.):
  setcrystal, hdlcdrv, soundmodem

How I can get setcrystal, hdlcdrv, soundmodem? Because
without them I can't configure the sound card and
soundmodem driver.

Thanks for any help.
Vivi

--------------------------------------------------

The option to an AX.25 configuration are:
Code maturity level options  --->
    [*] Prompt for development and/or incomplete
code/drivers
    ...
General setup  --->
    ...
    [*] Networking support
    ...
Networking options  --->
    <*> UNIX domain sockets
    ...
    [*] TCP/IP networking
    ...
    <n> IP: tunneling
    ...
Amateur Radio Support --->
    [*] Amateur Radio support
    --- Packet Radio protocols
    [*]   Amateur Radio AX.25 Level 2 protocol
    <n>     AX.25 DAMA Slave support
    [*]     Amateur Radio NET/ROM protocol
    [*]     Amateur Radio X.25 PLP (Rose)
    AX.25 network device drivers  --->
    <n> Serial port KISS driver
    <n> Serial port 6PACK driver
    <n> BPQ Ethernet driver
    <n> High-speed (DMA) SCC driver for AX.25
    <n> Z8530 SCC driver
    <n> BAYCOM ser12 fullduplex driver for AX.25
    <n> BAYCOM ser12 halfduplex driver for AX.25
    <n> BAYCOM picpar and par96 driver for AX.25
    <n> BAYCOM epp driver for AX.25
not appears-> < > Soundcard modem driver <-not appears
    [*]   soundmodem support for Soundblaster and
compatible cards
    <n>  soundmodem support for WSS and Crystal cards
    [*]  soundmodem support for 1200 baud AFSK
modulation
    <n>  soundmodem support for 2400 baud AFSK
modulation (7.3728MHz crystal)
    <n>  soundmodem support for 2400 baud AFSK
modulation (8MHz crystal)
    <n>  soundmodem support for 2666 baud AFSK
modulation
    [*]   soundmodem support for 4800 baud HAPN-1
modulation
    <n>  soundmodem support for 4800 baud PSK
modulation
    <n>  soundmodem support for 9600 baud FSK G3RUH
modulation
    <n>  YAM driver for AX.25




__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
