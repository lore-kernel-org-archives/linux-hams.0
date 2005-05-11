From: Bob Nielsen <nielsen@oz.net>
Subject: sound chip/driver issues
Date: Wed, 11 May 2005 12:43:52 -0700
Message-ID: <1115840632.30713.19.camel@office.n7xy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have several digital apps working fine on one of my computers, which
has a MSI K7T-Turbo motherboard (Athlon XP 2000+ CPU)) which  uses the
VIA 686 chipset's built-in sound capabilities, but my other computer,
which uses an ASUS TUSI-M motherboard (1.2 GHz Celeron CPU) that has a
CMI-8738 sound chip appears to have some problems.  Applications such as
gMFSK and linpsk don't seem to be able to detect any audio being fed
into either the line-in or microphone inputs (there isn't even noise
indicated on the spectrum or waterfall displays).  If I connect an
amplified speaker to the line-out jack, I can hear the received audio
and play MP3 files, etc., so it appears that the audio system is working
(at least somewhat).  

If I set a digital  application to transmit, the proper tones appear to
be generated in the computer, so applications are communicating with the
sound driver.

Are there any issues with the CMI chip which I need to consider?  Would
it be best to disable the onboard sound and use a PCI sound card?  If
so, which cards are recommended (I think I have one which uses the same
CMI chip around somewhere, but I fear it might have the same problem).

Bob, N7XY

