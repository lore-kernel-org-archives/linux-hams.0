From: John Ackermann N8UR <jra@febo.com>
Subject: Tracking down a Linux crash
Date: Wed, 16 Oct 2002 09:08:56 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3031448.1034759336@WUSJA129861-8HP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux@lists.tapr.org, linux-hams@vger.kernel.org

Hi all --

I realize this may be a bit off-topic, but my rationale is that (a) I'm
among knowledgeable friends, and (b) this machine is destined to be my
hamshack system, displacing a Windows box.

I've been building Linux systems since back in the 0.99pl4 days, and for
the first time I'm confronted with a system that regularly crashes.  There
are unfortunately quite a few variables in the equation, so I doubt anyone
here can give me an outright answer.  But perhaps with your collective
experience, I can zero in on the problem.  Please bear with the length of
this message as I want to provide as much detail as I can.

The box is an Athlon XP2000+ on an Elite Group L-7VMM motherboard with VIA
chipset.  On-board S3 SavagePro video, Realtek 8139 LAN, and VIA8233A
sound.  512MB DDR, 40GB drive.  Expansion cards are an M-Audio Delta44
sound card, and a Boca 8 port serial card.

I've been loading Debian 3.0 (woody) with KDE[2,3].  I'm using a
home-compiled kernel, both 2.4.18 and 2.4.19.  I'm not turning on any
exotic features in the kernel (other than AX.25 :-) ) and I'm setting the
CPU type to Athlon/K7.

I've installed ALSA sound drivers and utils.  I've had some problems with
the onboard VIA8233A sound, so I'm not currently enabling it.  I do have
the ICE1712 ALSA module installed for the Delta44 card, and the sound
system seems to be working OK with that card.  To get the S3 SavagePro 
video working in X
I had to download a later version of the XFree-4 driver for that card; I
was able to find a .deb file for it and it seems to install and work OK.
I'm using the ext3 filesystem.

The crash occurs after the system is fully booted and the KDE environment
is up and running -- in fact, it may occur as much as a couple of days
after bootup.  Several of the crashes have occurred when I was using
Mozilla (version 1.0, installed from Debian), immediately after typing in a
URL and hitting the return key -- but it's also crashed when Mozilla wasn't
running.  I've had both KDE2 (standard for Debian 3.0) and KDE3 (by
upgrading the system from woody to sarge and installing .debs from kde.org)
installed and had crashes under both environments.  The crash does not seem
to be related to sound card activity.

The crash itself is unusual.  The symptom is that the X screen freezes,
though usually the mouse pointer continues to move with the mouse. However,
there's no response to keyboard or mouse-clicks, with one exception.  That
is that if I use ctr-alt-F1 to go to a virtual console, the screen will
switch to VGA mode, but remains completely black, with no login banner or
anything.  After that point, nothing I do with the keyboard or the mouse
yields a response. The keyboard LEDs stop working (at least at this point;
I'm not sure if they stop before switching consoles).

The network subsystem remains at least partially active.  I can ping the
box from a remote host, but attempting to ssh to it fails with no reponse.
I don't have a telnet server installed, but attempting to telnet from a
remote machine to the normal port yields a "connection refused" message. If
I telnet to port 25 (smtp), I get a connect, but exim does not respond to
any commands sent to it.

There's no trace left in the standard logs that I can tie to the crash.

After rebooting by a power cycle or hardware reset, there are often some
corrupted files left behind, and they're hosed in a pretty dramatic way --
the ownership and dates are changed to impossibly large numbers, and it's
often impossible to delete them without extraordinary effort -- you get an
"unlink: operation not permitted" error and only using the filesystem
editor to edit the inode entry lets you get to the point where you can
delete the file.

A web search hasn't shown any mention of problems using Linux with this
motherboard or chipset.

Well, that's a lot of info, but I'm hoping that someone out there will
recognize something here that will point me in the right direction.  Thanks
for any help!

73,

John N8UR
jra@febo.com

----
John Ackermann    N8UR         jra@febo.com     http://www.febo.com
President, TAPR                n8ur@tapr.org    http://www.tapr.org
