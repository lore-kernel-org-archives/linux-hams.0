From: richard <richard.bown@blueyonder.co.uk>
Subject: gmsk & fldigi inputs
Date: Sat, 04 Nov 2006 01:16:47 +0000
Message-ID: <454BE9FF.7060106@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all
First a warning if you are using Mandriva 2007 and a sound card using 
the VIA envy24 chip, this applies to Terratec and M-audio cards.delta 44 
delta 66
and so on.
Avoid loading the multimedia kernel, especially the "hack"version, 
kernel-multimedia-desktop-latest-2.6.17.13-3mdv2007
This and its associated dependent files cause any PCM audio to be 
clocked at half speed, and what ever it installs is NOT removable
by using rpm-e or urpme.
This bug has been seen on Ubuntu and Suse 10.1, and now on mdv2007, its 
listed on bugzilla on both distros, once its on the system I found it 
also altered
the PCM clocking speed on the on board sound card VIA 8235, the only 
common thing I can see is both chips are VIA and sound is ALSA.
The only way I've found is to reload the whole stem, I know that a bit 
defeatist, but I've done battle with that bug for days when using suse 10.1,
its quicker to reload the system.

now the main bit applicable to both fldigi and gmfsk pre0.7 and ver 53

How do you get incoming audio from  inputs 2 to 4 to be seem by both 
programs ?
from the patch panel each input can be switched from each input to each 
output, what does get through to the dsp from inputs 2 to 4 on a Delta 
66 card
looks to be crosstalk, which part of the build on each controls where 
each app take its input from ?

TIA Richard g8jvm

