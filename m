From: James Washer <washer@trlp.com>
Subject: soundmodem on laptop.. receive working, xmit not working.
Date: Thu, 22 Jan 2004 20:57:31 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040122205731.5638d4df.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I've tried a new kernel (2.4.24 from kernel.org) but my soundcard modem is still not producing reasonable sounds. Receive works just fine.

If I select the PTT button from soundmodemconfig, it makes a lot of 'noise' but this sounds to me to be quite a bit higher frequency that the 'hiss' sound of normal 1200baud AFSK.

If I use the beacon command, or some other AX.25 commandline tool to 'send' a packet, the speaker just makes a clicking sound.

If I stop soundmodem, and use the linux play command to play a simple music wave file, all sounds well.


Any ideas? I'm in the process of building a soundmodem system on a desktop PC (as opposed to the laptop). I just want to check whether I get different results on a full PC than I do on the laptop.


My /etc/ax25/soundmodem.conf is included below.

thanks

 - jim 

<?xml version="1.0"?>
<modem>
  <configuration name="config0">
    <channel name="Channel 0">
      <mod mode="afsk" bps="1200" f0="1200" f1="2200"/>
      <demod mode="afsk" bps="1200" f0="1200" f1="2200"/>
      <pkt mode="MKISS" ifname="sm0" hwaddr="KG7HH-2" ip="10.0.0.1" netmask="255.255.255.0" broadcast="10.0.0.255" file="/dev/soundmodem0" unlink="1"/>
    </channel>
    <chaccess txdelay="400" slottime="100" ppersist="40" fulldup="1" txtail="10"/>
    <audio type="soundcard" device="/dev/dsp" halfdup="1"/>
    <ptt file="none"/>
  </configuration>
</modem>
