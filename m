From: "Jeremy Utley" <jerutley@gmail.com>
Subject: Re: Lost password
Date: Wed, 25 Oct 2006 00:52:26 -0700
Message-ID: <d5d4185b0610250052h579ff3b0v7c033e8df7af5817@mail.gmail.com>
References: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
	 <00F60F1B-58E2-49E9-88F8-E6BE6CF210A5@oz.net>
	 <1161761094.9240.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1161761094.9240.5.camel@localhost>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

On 10/25/06, Robin Kauffman <robin@kauffmanfamily.org> wrote:
> Hi-
>         A more secure way to update your root password with a (Live|rescue)CD
> is to mount your root partition somewhere, chroot to it and then run
> 'passwd'.  Of course, this only works if you have one partition for both
> your /etc directory and /usr directory.  If not, you can always mount
> the respective partitions at their appropriate locations.
>         The advantage of this is that your machine never has a blank root
> password.
>
>                 -Robin K.


Still another possibility is to append "init=/bin/bash" to the kernel
line.  This will boot the system, and instead of starting sysvinit via
/sbin/init, will immediately execute a shell with an effective UID of
0.  Once that's done, remount the root partition read-write via "mount
-o remount,rw /"  use the passwd command to change the password, and
power-cycle the machine.

Jeremy, NW7JU
