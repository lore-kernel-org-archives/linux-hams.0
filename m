From: =?ISO-8859-1?Q?Rub=E9n_Navarro_Huedo?= <eb5esx@eb5esx.ampr.org>
Subject: Kissattach after change to 2.6.12
Date: Fri, 24 Jun 2005 13:06:58 +0200
Message-ID: <4C3202C2-0B97-4486-9DE7-D01C3F95C449@eb5esx.ampr.org>
Mime-Version: 1.0 (Apple Message framework v730)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Hello friends:
After change from 2.6.11 to 2.6.12:

linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?
linux:/etc/init.d# modprobe mkiss
linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?

Any help?
A lot of thank's

----------
Rub=E9n Navarro Huedo
eb5esx@eb5esx.ampr.org


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
