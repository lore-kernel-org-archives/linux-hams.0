From: Kristoff <kristoff@skypro.be>
Subject: AC600 wifi USB sticks for ham-radio use (5 Ghz)
Date: Sun, 21 Feb 2016 22:29:48 +0100
Message-ID: <56CA2C4C.90107@skypro.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,


I am interested in using wifi devices for ham-radio use, especially for 
HSMM (adhoc, olsr) and HAMNET; e.g. by extending their frequency-range 
for the complete hamradio bands.

One of these devices I am looking at for 6 cm operations is the AC600 
(mt7610-based).
http://www.aliexpress.com/item/New-Mini-2-4GHz-5GHz-Dual-Band-USB-Network-Card-5dBi-Antenna-AC600-802-11ac-Wireless/32246544516.html

For that, I have been hacking the kernel-driver found here:
https://github.com/coolshou/mt7610u


I managed to change the driver to get it to work on all channels in the 
13 cm and 6 cm bands: channels 1 (2.412Ghz) to 6 (2.437) and channels 
132 (5.660 Ghz) up to 168 (5.840 Ghz).

As of today, I have been running pings and olsr between two linux PCs 
(Ubuntu LTS) using these devices on 5 Ghz in wifi ad-hoc mode.


However, I am now running into a number of issues:
- packets being queued before being send (i.e. a one-ping per second is 
not received at the same rate at the remote side: first 4 seconds 
nothing is received and then a burst of 4 pings in one go)
- packets lost
- "iwlist freq" only shows parts of the frequencies
- "ifconfig" does not show the ESSID you have configures (but it does 
seams to use it).

And, in short, the code can use a lot of cleaning.



So I am looking for people who can help me with information about this:

- does anybody have a good document that explains how userland 
application interact with a kernel wifi network driver: sending data, 
receiving data, iwconfig, iw, iwpriv, ...

- Does anybody have experience with adapting wifi devices for ham-radio?
I did some work on atheros-based wifi dongles to get them to operate on 
2.3 Ghz before, but these "mt7610u" drivers seams to be a lot more 
complex. So any advice would be helpfull.

Is there documentation of other simular projects?


- When searching the web, I found multiple different drivers for the 
mt7610u; all a bit different and from different projects.
Even on the kernel.org website, there is  another version for the 4.5 
kernel.

Are there other / better drivers out there for the mt7610u then the one 
I use now, that can be more easily addapted for ham-radio use?

My goal would be to run this on small unix-boards (RPi, BBB, ...) as 
dedicated network node for HSMM or hamnet; so drivers compatible with 
the versions of the linux kernel found on these devices are interesting.


- Has anybody done RF measurements on these 5 Ghz wifi-sticks and looked 
at the RF signal they transmit, e.g. when using the frequencies not 
assigned for the official wifi-channels?

- Has anybody ever tested these AC600/mr7610u devices and checked if 
they can operate below 2.4 Ghz? (like the atheros chips)?


Any info would be very usefull.


73
kristoff - ON1ARF
