From: Jack Heller <kb7no@sbcglobal.net>
Subject: hamlib parameters in gMFSK and xlog for Icom
Date: Tue, 4 Mar 2008 23:02:04 -0800
Message-ID: <200803042302.04710.kb7no@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi to all,

	I have been struggling with hamlib.  I have the 1.2.6.1 installed and appears 
to work.  At least in verbose mode I can retrieve data from the Icom 756PRO.  
I am using Kubuntu 6.06.  gMFSK works very well, the PTT switch works through 
the serial port OK, but I cannot find the correct set of "parameter=value" to 
place in the config line so the get_freq can retrieve rig frequency plus 
other features.
	I came close to good info in xlog, but not quite enough. The xlog Help file 
sent me to a Sourceforge FAQ website that scratched the surface, but not 
deeply enough.
	During another experiment, I discovered I could get grig to almost work by 
using sudo in the start-up command -- Must have been the port needed a little 
help although that is not for sure. It is hard to say if grig works with this 
rig, but some action was observed -- Just not complete.  Anyway, have been 
attempting to get some results as root.  I think I had gone to root before 
invoking verbose for rigctl.
	To say this is wearing on me is a true understatement.  I have spent many 
hours over some months trying to solve this dilemma and I am now sure the 
only way is to ask for instructions and plead for a few examples.
	There are no examples that I have found in numerous searches.  Then I found a 
comment by a developer that perhaps examples would be good.  I think that if 
you successfully write a program and it works well because you know how to 
make it make it work, that is all that is necessary.  Ah well, life.

	So I hope there is someone who has a handle on this who can help or direct me 
to a listing of "How to do it."  Thanks much for whatever you can do.

        Jack   KB7NO
