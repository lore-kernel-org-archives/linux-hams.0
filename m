From: "Wilbert Knol" <w.knol@niwa.cri.nz>
Subject: Re: ANN: gMFSK v0.4
Date: Mon, 8 Apr 2002 17:02:01 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3CB1CD09.12082.1950EDB@localhost>
References: <Pine.LNX.4.33.0203290250170.1587-100000@oh2bns.ampr.org>
Reply-To: w.knol@niwa.cri.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
In-Reply-To: <02040805201200.01821@bcat>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have the source RPM installed and running now, on a Mdk 8.1 distro, 
KDE desktop, and it appears to be working very nicely.

Initially, gMSFK complained about read errors from the sound device. I 
tried re-assigning DMA channels from the BIOS, and updating the OSS 
module accordingly, but it went from read errors to write errors to a full 
system freeze :-(

The fix was to ditch OSS for the ALSA drivers, and all is well now. I am 
using a Toshiba laptop and the Yamaha sound system has always been a 
bit tricky to get going.

Anyway, the KDE sound server does a pretty good job of sharing the 
sound system between apps, I am going to try to record a sound bite of 
transmitted audio into a file, and re-play it, to see what the transmitted 
spectrum looks like. I am really intrigued by the MFSK, which sounds like 
a mix  between a flute and bag-pipes on fast-forward.

A question: I would like to extract PTT from a USB serial adapter, but the 
device file for it doesn't show up in the pick list of gMFSK. Can I safely 
add a symlink to the USB device file and call it, say /dev/ttyS99?

Wilbert, ZL2BSJ

