From: "Pontus Falk" <pfalk@ax25.org>
Subject: RE: Linux Newbie with Compiling Problems...
Date: Tue, 25 Feb 2003 20:09:35 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3748.213.66.253.108.1046200175.squirrel@www.ax25.org>
References: <01C2DC36.D1A6A7E0.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2DC36.D1A6A7E0.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi!

>        I used 'make xconfig' . It had many many options for IDE devic=
es.
>
> The kernel put on the disk by the Linux install did not include a con=
fig
>  file. So, I had no "blueprint" to tweak. This meant I had to guess a=
t
> the  configuration settings to use. I may have guessed wrong, or the
> compiler  may have a bug, or ?, or ? or ?

I'm not so experienced, but I would try the following.

make mrproper
make menuconfig (mark the options as mentioned in AX25-HOWTO)
make dep
make clean

make the changes in the Makefile file

make bzImage
make modules
make modules_install
make install

reboot and try the new kernel

Regards,

Pontus/SM=D8RUX


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
