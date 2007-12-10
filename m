From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: Cloning Hard drives
Date: Mon, 10 Dec 2007 00:01:33 -0000
Message-ID: <005801c83abf$d3a3c8b0$0a00a8c0@jrws3>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Doug' <appld@sasktel.net>, linux-hams@vger.kernel.org

Yes, Ghost..

Norton Ghost (up to the 2005 version) will happily clone a Linux system.

Make a Ghost floppy on a Win machine with Ghost installed & boot from that,
or if you don't have a floppy drive on the target machine make the floppy
anyway then do a ghost copy (of anything) to DVD and opt to make it
bootable, copying from the Ghost floppy.

You can then boot Ghost from the DVD on the target machine.

After copying, you will have to reinstall Grub. Run the linux CD/DVD in
rescue mode, chroot to the mounted drive & run grub.
Then do 
find /grub/stage2
Which should return something like hd0,0
Enter
root(hd0,0)
setup(hd0)

(that's from memory, it should be approximately correct..)

The later versions of 'Ghost' are Windows-only in every sense, it must be a
version that allows itself to be put on a floppy disk.

You can also replicate a drive in Linux, but this is rather more complex.

Robert, G8TBF.


