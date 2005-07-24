From: Alexander Werner <awerner@wired-brain.de>
Subject: usermode soundmodem
Date: Sun, 24 Jul 2005 13:10:36 +0200
Message-ID: <20050724111036.GI32031@router.lan>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

allthough i'm fairly new to this packet radio thing, i want to try to
set up a packet station on my linux box. I tried - but i got stuck ...
i'm using: gentoo - libax-0.0.11 - ax25-tools-0.0.8 - ax25-apps-0.0.6
and soundmodem 0.9 from tom sailer page
kernel: 2.6.9 with mkiss driver as a module

my soundmodem confi in /etc/ax25/soundmodem.conf

<?xml version="1.0"?>
<modem>
  <configuration name="config">
    <channel name="Channel 0">
      <mod mode="psk"/>
      <demod mode="psk"/>
      <pkt mode="MKISS" ifname="ax0" hwaddr="" ip="10.0.0.1" netmask="255.255.255.0" broadcast="10.0.0.255"/>
    </channel>
    <chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
    <audio type="soundcard" device="/dev/dsp" halfdup="0"/>
    <ptt file="none"/>
  </configuration>
</modem>


now i say
# soundmodem -v 9 -R -M
sm[27953]: mkiss: ifname ax0 mtu 256 ipaddr 10.0.0.1 netmask 255.255.255.0 broadcast 10.0.0.255
sm[27953]: audio: starting "/dev/dsp"
sm[27953]: audio: sample rate 48000 input fragsz 4096 numfrags 32 output fragsz 4096 numfrags 32

what do i have to do now??
# ifconfig ax0
ax0       Link encap:AMPR AX.25  HWaddr LINUX-1  
          inet addr:10.0.0.1  Bcast:10.0.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
# lsmod
tells me, that mkiss was loaded

or do i need to run kissattach?
it seems simple - but i did not find anything on the web


Thanks,

ALex
