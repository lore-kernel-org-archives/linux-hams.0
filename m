From: Dan Roloff <dlr@cs.pdx.edu>
Subject: no data from user-mode soundmodem
Date: Sat, 24 Aug 2002 18:47:07 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200208250147.g7P1l7N07098@12-224-31-54.client.attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I have successfully gotten the user-mode soundmodem working on two
linux systems, but a third one has me stumped. The systems are all very
similar. For two of them, I had to install the alsa sound drivers to get
the i810 audio to work, but after doing that, one of the systems seems to
be working fine.  (So far, I have only tried receiving packet data.) The
other system brings up the sm0 device (as reported by ifconfig), but never
receives any packets. But using soundmodemconfig shows audio getting to
the modem and DCD being detected.  Also, using soundmodem -v255 shows
DCD being set appropriately. Neither soundmodem or soundmodemconfig
fully decode any packets though, (ie. nothing is printed to stdout,
or to the diagnostic modem text window).

In kisspkt.c, pktput is called, as is hdlc_receive, but that's as far
as I got with my debug attempt.

If anyone has any ideas about what could cause this problem, let me
know. (One minor difference between the working and non-working systems
is that on the working systems I am using the microphone input, while
on the non-working system I am attempting to use the line input. But I
don't think that should be significant.)

Included below is my soundmodem.conf file. The linux version is 2.4.18 +
an acpi patch.

Thanks.

Dan Roloff
dlr@cs.pdx.edu

<?xml version="1.0"?>
<modem>
  <configuration name="dlr">
    <channel name="Channel 0">
      <mod mode="afsk" bps="1200" f0="1200" f1="2200"/>
      <demod mode="afsk" bps="1200" f0="1200" f1="2200"/>
      <pkt mode="MKISS" ifname="sm0" hwaddr="W7HXR-15" ip="10.0.0.1" netmask="255.255.255.0" broadcast="10.0.0.255"/>
    </channel>
    <chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
    <audio type="soundcard" device="/dev/dsp" halfdup="0"/>
    <ptt file="none"/>
  </configuration>
</modem>
