From: James Washer <washer@trlp.com>
Subject: help with user soundmodem.
Date: Wed, 21 Jan 2004 19:17:34 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040121191734.74129e72.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I'm just starting to try to bring a soundmodem up.. I believe I have the kernel set up correctly..


I 'borrowed' a soundmodem.conf I found on the web.. ( included at the bottom of this mail). I can start soundmodem, and the interface sm0 comes up...

I'm looking for information on the various options I can set in soundmodem.conf. I want to use 1200baud packet.. Can someone provide a soundmodem.conf for me?

Also, if I just want to monitor the packet data.... what application should I use?


If anyone would like to contact me offlist and offer to help get me 'over the hump', I'd appreciate that greatly..

thanks

 - jim KG7HH


<?xml version="1.0"?>
<modem>
<configuration name="mine">
<chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/>
<audio type="soundcard" device="/dev/dsp" halfdup="0"/>
<ptt file="/dev/ttyS1"/>
<channel name="Channel 0">
<mod mode="fsk" bps="9600"/>
<demod mode="fsk" bps="9600"/>
<pkt mode="MKISS" ifname="sm0" hwaddr="M5AIQ" ip="10.0.0.1" netmask="255.255.255.0" broadcast="10.0.0.255"/>
</channel>
</configuration>
</modem>



