From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Pc/rig interface for packet
Date: Mon, 5 May 2003 15:59:46 +1200
Sender: linux-hams-owner@localhost
Message-ID: <200305051559.46380.w.knol@niwa.co.nz>
References: <20030410170405.GA29076@strauss.udel.edu> <20030410175130.GE13938@n7xy.net> <20030501180055.GK10769@mahler.udel.edu>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030501180055.GK10769@mahler.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Markowski <mm@UDel.Edu>, Linux Hams <linux-hams@vger.kernel.org>


> Would electrically isolating the Tx/Rx/PTT signals like in the Rascal
> kit make a significant difference?  I read that the isolation is
> important if you want to use packet on HF.

I won't go into details, but there are several reasons why HF digital modes
are so sensitive to RF feedback. Audio isolating transformers often help, 
particularly in the TX audio path, but there are other tricks to reduce RFI.

VHF/UHF FM packet is a lot more immune, and I've always managed without audio 
transformers. 

The down-side of audio isolating transformers is, that they can easily pick up 
stray magnetic fields from things like power supplies, from as far as half a 
meter or so away. And you won't even hear that through tinny little 
loadspeakers, but it will be bad enough to wreck your signal.

The RFI acid test is, to transmit idle flags or calibration tones continuously 
whilst you vary TX power. You listen to the transmitted audio on a second 
receiver nearby (on a dummy load). Use a pair of good quality HIFI 
headphones. If the audio starts sounding raw when you increase power, you 
have RFI.

If you kill the TX audio, you'll also hear stray 50 Hz pick-up.

FSK modes are much less susceptible than linear modes such as PSK.

Another thing to look out for: some people use handhelds for packet radio, 
that leave the internal condenser mike connected. Shack noise then causes 
packet corrupton. 

Anyway, all of this has little to do with Linux...

HTH

Wilbert, ZL2BSJ

