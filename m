From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: mkiss, udev and kernel 2.6
Date: Thu, 11 Nov 2004 20:59:42 -0800
Message-ID: <d5d4185b0411112059129ce996@mail.gmail.com>
References: <4187BA73.2080908@ccr.jussieu.fr>
	 <000601c4c852$79768360$07001aac@adminqn>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000601c4c852$79768360$07001aac@adminqn>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

As I said in my original message to Bernard, it's not a hard thing. 
First, you have to make sure that BSD PTY support is in your kernel. 
Then, in your bootscripts, before you run the mkiss command to set up
the dual port TNC, create the 4 legacy PTY nodes into the /dev
filesystem.  You can find the correct major/minor numbers to use by
looking at devices.txt in the kernel source Doucmentation directory,
or looking at an old distro that has them set up already.  You'll need
4 device nodes:

/dev/ptyp0 - character device, major number 2, minor number 0
/dev/ptyp1 - character device, major number 2, minor number 1
/dev/ttyp0 - character device, major 3, minor 0
/dev/ttyp1 - character device, major 3, minor 1

Then, your mkiss command will look something like this:

mkiss -s 9600 /dev/ttyS0 /dev/ptyp0 /dev/ptyp1

and your kissattach commands will reference /dev/ttyp0 and /dev/ttyp1.
 On my Kam, when configured this way, /dev/ttyp0 ends up the VHF port,
and /dev/ttyp1 the HF port.

Hope this helps!

Jeremy, NW7JU (ex KF3EL)


On Thu, 11 Nov 2004 16:56:40 -0800, AA6QN <aa6qn@pacbell.net> wrote:
> I ported my Linux over to Gentoo and started off with devfs. I did try udev
> and it did not work for me. So, back to devfs and things are working once
> again. Let us know if you get it running.
> 
> 73,John AA6QN
> 
> 
> 
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bernard Pidoux
> Sent: Tuesday, November 02, 2004 8:49 AM
> To: unlisted-recipients:; no To-header on input
> Cc: linux-hams@vger.kernel.org
> Subject: mkiss, udev and kernel 2.6
> 
> Hi,
> 
> Does someone have an experience with mkiss and udev in 2.6 kernel ?
> 
> I need to use mkiss-kissattach to drive a dual port TNC 1200/9600 KPC9612.
> 
> However I don't see how to set up a master-slave pseudo tty system with
> udev.
> 
> Actually, I went through by instructing the kernel to load devfs at boot
> (append="devfs=mount... " in lilo.conf.
> 
> But Is there any other solution with udev alone (without devfs) ?
> 
> 73 de Bernard, f6bvp
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
