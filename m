From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: kissattach/kissnetd versus ptyq ttyq and ptmx/pts
Date: Thu, 6 Jul 2006 16:20:44 +0100
Message-ID: <001801c6a10f$c33b1b90$2800a8c0@office>
References: <44AB6C66.4050000@junglevision.com>
Reply-To: <raj@jrw.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44AB6C66.4050000@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Cathryn Mataga' <cathrynm@junglevision.com>
Cc: linux-hams@vger.kernel.org

 
> In my original Linux ham radio setup, I had the following...
> 
> /sbin/kissnetd -f 1064 /dev/ptyq3 /dev/ptyq4& sleep 4 
> /sbin/kissattach -l /dev/ttyq3 lb1 192.168.0.2& 
> /sbin/kissattach -l /dev/ttyq4 lb2 192.168.0.3&
> 
> for creating the loopback device.
> 
> Seems that in Fedora 4 ptyq3 and ttyq3 don't exist anymore.  
> I tried using MAKENODE ptyq3 and ttyq3 to create these device 
> files, but I don't think they're working?  I get this error.
> 
> kissattach: open: No such device or address
> 
> I've been googling the pseudo terminals for Linux and it 
> seems that the new way is with ptmx/pts and ptyq3 and ttyq3 
> are the old style.  But I'm not sure, will kissattach works 
> with these? Or is there a way to get ptyq3 ttyq3 working in Fedora 5?
> 
> What's the right way to go about this, these days?
> -

Hi, 
I'm running AX25 on a Centos 4.3 system with kernel 2.6.16 and it works
well.

You can enable the pty devices in the kernel config under 
Device Drivers > Character Devices > Legacy (BSD) PTY Support

One oddity I found with the original Centos/Redhat kernel was the extra
serial ports I have installed appeared at high numbers for some reason
(something like /dev/ttyS44 / 45 / 54 / 55)

I used the latest release kernel from kernel.org and this put them back
normal sequence from ttyS0 - ttyS5. It also made the whole system rather
more stable, I think the Redhat kernel is a bit behind with the AX25
updates.

Robert Jenkins, G8TBF.

