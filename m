From: "Pontus Falk" <pfalk@ax25.org>
Subject: Problem...
Date: Mon, 17 Mar 2003 22:07:40 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi!

I try to get the AX.25 functions to work on my Linux box, but I've got
some problems...

I have compiled the kernel (2.4.18) according to the AX25 HOWTO. The ne=
w
kernel boots fine. I have compiled and installed libax25-0.0.10.tar.gz,
ax25-tools-0.0.8.tar.gz and ax25-apps-0.0.6.tar.gz according to the AX2=
5
HOWTO.

I then edited the /etc/ax25/axports to look like

ax0 SM0RUX-2 9600 255 7 144.950 MHz
ax1 SM0RUX-7 9600 255 7 433.xxx MHz
sl0 SM0RUX-11 38400 255 7 SLIP

My TNC is a dual port KPC-4 connected to COM1.

Then I enter "/usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1"
without any error messages (without any messages at all).

The I enter "/usr/sbin/kissattach /dev/ttyq0 ax0 44.140.16.35" but get =
an
error message like:

kissattach: Error setting line dicipline: TIOCSETD: invalid argument
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?

Any ideas?

Pontus/SM=D8RUX


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
