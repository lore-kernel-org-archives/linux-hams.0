From: David Ranch <linux-hams@trinnet.net>
Subject: Re: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring
 corruption HELP Required please
Date: Sun, 01 Jun 2014 09:04:03 -0700
Message-ID: <538B4EF3.7080003@trinnet.net>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org> <024rua-e6d.ln1@atomos.longlandclan.yi.org> <IYGDg$AQECNTFw+e@skywaves.demon.co.uk> <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl> <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl> <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk> <53406C67.3080008@trinnet.net> <0AC34FBF7531404B98449A9318023E3B011B294F@EXMBX16.thus.corp> <5341A229.8010902@trinnet.net> <T1wVLuA0bviTFw2H@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <T1wVLuA0bviTFw2H@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>


Hello Paul,

First off, kudos to you for sticking with it and working through the 
problems both patently and following through the steps logically!


> There is an issue with setserial which is a 2000 version

As I understand it, setserial is completely optional and the kernel 
should properly select IRQs, memory addresses, etc.  I'm thinking this 
might be a kernel / driver bug.


> From what I read from the Professor Google files, UBUNTU identified
> the issue late 2013..

Do you have a URL to share here so we can read what was found on that 
Ubuntu list?  Thirteen years is a LONG time to find a bug though the 
value of serial ports have been on a great decline in that period.


> /dev/ttyS4 uart 16950/954 port 0xef00 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS5 uart 16950/954 port 0xef08 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS6 uart 16950/954 port 0xef10 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS7 uart 16950/954 port 0xef18 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS8 uart 16950/954 port 0xed00 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS9 uart 16950/954 port 0xed08 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS10 uart 16950/954 port 0xed10 irq 22 baud_base 921600 
> spd_normal autoconfigure
> /dev/ttyS11 uart 16950/954 port 0xed18 irq 22 baud_base 921600 
> spd_normal autoconfigure

Depending on the card's driver, the number of available interrupts, 
etc., and if you see some strange performance issues, you might want to 
consider using a few different IRQs.  I doubt you'll have this issue as 
computers are so fast today but wanted to mention it as it WAS a very 
real problem back in the day.


> To force an error. I set the boot option in the GRUB menu
> pci=routeirq  # For all devices temp work around for broken drivers

Right... https://help.ubuntu.com/community/DebuggingIRQProblems
--
Do IRQ routing for all PCI devices. This is normally done in 
pci_enable-device(), and is a temporary workaround for broken drivers 
which don't call it.
--

That goes along my thought that this is a kernel driver issue.



> Then reviewed the syslog  Was very Interesting.. and Bingo!!!

Google indexes this list too so maybe you could past in some of the 
syslog errors that you saw?


> Deleted modem-manager  sudo apt-get purge modemmanager
> as do not run dial up modems. rebooted without the pci=routeirq boot 
> option.
> We now have PCI VScomm  8 serial ports active connected to 6 paccom 
> TNC's and
> two SCS PTCiipro data controllers.  All working.

[tangent]
Ah yes... the infamous #$^#$%# modem-manager and it's bitten me (and 
many other people) many times.  Btw, I don't recommend to DELETE it as 
many distributions have so many dependencies on it.  I personally 
recommend to RENAME it - 
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#1f.presetup-modemmanager 
.   Anyway, it greatly saddens me to see over-arching software coming 
into various Linux distros.  Ubuntu started it with enabling software 
like modem-manager and network-manager by default and now many 
distributions is bringing in systemd which REALLY obfuscates things even 
more.  I can appreciate a distrubution's goal to get things to "just 
work" but this comes at a very high price.  Time will tell how this goes 
and decisions like this are purely at the distro level.  If we don't 
like it, users can switch to a different distro but there aren't many 
distros left that are opting out (not a super comprehensive list but you 
get the idea):

    http://en.wikipedia.org/wiki/Systemd#Adoption


> At the time of writing this. they have been up for 23 hours.. instead 
> of a few minutes.

Congratulations and now we need to get you on the AMPR system!

--David
KI6ZHD
