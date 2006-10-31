From: richard <richard.bown@blueyonder.co.uk>
Subject: envy24 contoller  & linux
Date: Tue, 31 Oct 2006 22:45:43 +0000
Message-ID: <4547D217.8060007@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: perex@suse.cz

Hi All
I'm using a M-Audio delta 66 sound card with gmfsk, and the envy24 
control utility 0.6.0
I hope there are a few with same setup as I've found something a bit 
strange and wondered if anyone else has seen the same
and found a fix for it.
You can direct audio from any of the four analogue inputs to any one of 
the four analogue output and control the levels.
But looking at the wee booklet that comes with the board it looks like 
the proprietary driver( a windows thing ) is able to switch the input
sensitivity by about 14dB.
Now if a signal is applied to input one the sensitivity on that input is 
about 20dB ish more than the other inputs, I would like to be able to 
have the same
input sensitivity across all the inputs, with the linux driver, envy24 
control utility 0.6.0, I can't find any control to do this.
Has any one found a way of controlling this parameter ??. It's not a 
killer problem as I could take the audio from the rigs after the volume
 control where the levels are higher, but I prefer to take the output 
from the hot end of the volume control on each rig.

TIA
73 Richard g8jvm

