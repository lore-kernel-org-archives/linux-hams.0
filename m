From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Cloning Hard drives"
Date: Mon, 10 Dec 2007 07:07:48 -0600
Message-ID: <20071210130748.GP10742@mail.networksplus.net>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca> <59028.202.37.96.11.1197237999.squirrel@gilks.ath.cx>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <59028.202.37.96.11.1197237999.squirrel@gilks.ath.cx>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* Robin Gilks <g8ecj@gilks.org> [2007 Dec 10 00:33 -0600]:
> 
> > Is there a way to clone or ghost a Linux hard drive??

I've had good luck using rsync and KNOPPIX for such a task.  For
example, I've used the following to copy installed partitions from an
older laptop to its replacement and likewise when upgrading hard
drives.

Boot both machines with KNOPPIX (version doesn't seem to be critical as
I've used everything from Version 3.8.1 to 5.1.1).  The "remote" machine
is the one that will be receiving the data and the "source" machine has
the current data (I have copied data from a failing drive using this
method to my desktop, then back from the desktop to the laptop).  I'll
assume that the machines are network connected and the remote is 
192.168.0.1 and the source is 192.168.0.2.  If you're on a switch with
DHCP, your addresses will be different.

On the remote machine once booted into KDE:

Open a Konsole session
su
passwd admin            # This is necessary since ssh needs a password
mount target partition on /mnt/hdaX
rsync --daemon
/etc/init.d/ssh start

On the source machine (also booted into KDE):

Open a Konsole session
su
mount target partition on /mnt/hdaX
rsync -avHx /mnt/hdaX 192.168.0.1:/mnt/hdaX
# you'll be prompyed for the apssword of the remote machine, enter
# admin as assigned above.  Answer 'yes' to accept ssh key

Note that on the rsync command line on the source machine, a trailing
slash is significant.  Without a slash, the file layout will be put
into the root of the partition, with a slash the file structure will
appear under the preceding directory before the slash.  Experiment.

Also, installing Grub or LILO on a clean drive may be problematic. 
I've solved this a couple of ways.  Since I use my laptop for
experimentation, I had installed KNOPPIX to the hard drive in its own
partition and was able to boot into my copied Debian partition by
fixing /boot/grub/menu.lst.  I've also used the Debian install disk for
Etch in "rescue" mode to place Grub in the MBR after pointing it to the
copied partition with /boot/grub/menu.lst.

I hope these notes help.

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          |  Successfully Microsoft
  Amateur radio exams; ham radio; Linux info @  | free since January 1998.
             http://www.qsl.net/n0nb/           |  "Debian, the choice of
             My Kawasaki KZ-650 SR @            |     a GNU generation!"
        http://www.networksplus.net/n0nb/       |   http://www.debian.org
