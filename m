From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Problem...
Date: Mon, 17 Mar 2003 21:43:49 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <03031721434901.01189@unix.pa3gcu>
References: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pontus Falk <pfalk@ax25.org>, linux-hams@vger.kernel.org

On Monday 17 March 2003 21:07, Pontus Falk wrote:
> Hi!
>
> I try to get the AX.25 functions to work on my Linux box, but I've go=
t
> some problems...
>
> I have compiled the kernel (2.4.18) according to the AX25 HOWTO. The =
new
> kernel boots fine. I have compiled and installed libax25-0.0.10.tar.g=
z,
> ax25-tools-0.0.8.tar.gz and ax25-apps-0.0.6.tar.gz according to the A=
X25
> HOWTO.
>
> I then edited the /etc/ax25/axports to look like
>
> ax0 SM0RUX-2 9600 255 7 144.950 MHz
> ax1 SM0RUX-7 9600 255 7 433.xxx MHz
> sl0 SM0RUX-11 38400 255 7 SLIP
>
> My TNC is a dual port KPC-4 connected to COM1.
>
> Then I enter "/usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq=
1"
> without any error messages (without any messages at all).
>
> The I enter "/usr/sbin/kissattach /dev/ttyq0 ax0 44.140.16.35" but ge=
t an
> error message like:
>
> kissattach: Error setting line dicipline: TIOCSETD: invalid argument
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?

And.?? Do you have "mkiss" support compiled into your kernel or is it a=
=20
module, ?? looks like its a module so you need to load the module befor=
ehand.

'modprobe mkiss'   ?????

If that fails then you possably do not have the required kernel configu=
ration.
Check /usr/src/linux/.config for MKISS you could try;

cat /usr/src/linux/.config | grep MKISS
You should get CONFIG_MKISS=3Dm or CONFIG_MKISS=3Dy if you get
# CONFIG_MKISS is not set
that means you dont have mkiss at all.

> Any ideas?
>
> Pontus/SM=D8RUX
>

--=20
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
