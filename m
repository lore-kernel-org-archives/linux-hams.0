From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: soundmodem, Cannot open PTT device "/dev/parport0"
Date: Sat, 05 Oct 2002 22:22:07 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D9F49EF.8080405@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I'm trying Thomas' userspace soundmodem but I have problem with PTT 
operation via the parport.

I'm using...
  soundmodem-0.6
  kernel 2.4.20-pre9

I've loaded the parport and parport_pc kernel modules.

When I start soundmodem I get the following error.

sm[3429]: Cannot open PTT device "/dev/parport0"
sm[3429]: cannot start PTT output

This is my soundmodem.conf

<?xml version="1.0"?>
<modem>
   <configuration name="config0">
     <channel name="Channel 0">
       <mod mode="afsk" bps="1200" f0="1200" f1="2200"/>
       <demod mode="afsk" bps="1200" f0="1200" f1="2200"/>
       <pkt mode="MKISS" ifname="sm0" hwaddr="PE1ICQ-1" ip="10.0.0.1" 
netmask="255.255.255.0" broadcast="10.0.0.255" file="/dev/soundmodem0" 
unlink="1"/>
     </channel>
     <chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" 
txtail="10"/>
     <audio type="soundcard" device="/dev/dsp" halfdup="1"/>
     <ptt file="/dev/parport0"/>
   </configuration>
</modem>

Can anybody help point me in the right direction?

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org

