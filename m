From: John Ackermann N8UR <jra@febo.com>
Subject: OT:  Help using a analog-to-digital converter board under Linux
Date: Sun, 22 Dec 2002 10:44:51 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1450000.1040571891@[192.168.1.222]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I wonder if someone here would be willing to work with me off-list to see 
if I can make use of an analog-to-digital converter board under Linux.

I have an ADAC 5500MF data acquisition board that has 8 channels of 12 bit 
ADC (as well as some DAC channels and timers, but I'm not really interested 
in those).  It has DOS and Windows software which frankly I'm not thrilled 
with, even if you leave the OS aside!

It appears that the board only uses some memory ports and doesn't use IRQs 
or DMA.  I have the I/O memory map, and some sample program fragments from 
the manual in several different languages.  I just don't know enough about 
Linux programming at the hardware level to know how to begin writing my own 
program.

If someone has that skill and would be willing to help me out off-line, I'd 
really appreciate it.  I can scan the relevant pages from the manual and 
make them available.  My goal is to find a way to do this in perl, but if 
we need to stick with C, that's OK.

Thanks to anyone who can help!

73,
John N8UR
jra@febo.com

