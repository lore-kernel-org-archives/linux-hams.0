From: "Pontus Falk" <pfalk@ax25.org>
Subject: RE: Linux Newbie with Compiling Problems...
Date: Wed, 26 Feb 2003 07:56:53 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4132.213.66.253.108.1046242613.squirrel@www.ax25.org>
References: <01C2DCFB.BA1D9C80.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2DCFB.BA1D9C80.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi Don,

=46irst of all I have to tell you that you don't use a valid Internet e=
-mail
address. Maybe the address is accessible from you radio lan, but not fr=
om
Sweden, so please change asap so I can mail you direct and not via the
mailing list..!

> Ok on all the stuff above here, I have been doing this. But what is t=
his
> next one ?  Do I actually type :
>
> make the changes in the Makefile file
>
> Or do I look into the Makefile file, and based on what is in there I
> type make x etc?

OK, have you read the HOWTO file about compiling a kernel?

No, you dont type "make the changes in the Makefile file". Open the
Makefile in four favourite editor, and look for a line starting with
"EXTRAVERSION =3D ". Change it to look something like "EXTRAVERSION =3D
ownkernel" and save the file...

Then, go for "make bzImage"...

But first, change you e-mail address or update your entry in the ampr.o=
rg
domain file... Very annoying not being able to send an e-mail direct to
you!

Regards,

Pontus/SM=D8RUX

> I have not been able to get past the:
> make bzImage
> so far.
>
> make modules
> make modules_install
> make install
>
> reboot and try the new kernel
>
> Regards,
>
> Pontus/SMORUX
>
>
> 73, Don...



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
