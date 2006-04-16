From: Alex Flinsch <avflinsch@att.net>
Subject: Re: Any glfer users?
Date: Sun, 16 Apr 2006 14:24:45 -0400
Message-ID: <190E15D0-BFED-42F9-9216-7E53F5E25366@att.net>
References: <44427B4F.5010009@rochester.rr.com>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44427B4F.5010009@rochester.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; delsp="yes	format=flowed"
To: Al Scanandoah <k2zn@rochester.rr.com>, linux-hams@vger.kernel.org


On Apr 16, 2006, at 1:13 PM, Al Scanandoah wrote:

>
> g_main.c: In function =91save_full_pixmap=92:
> g_main.c:1037: warning: pointer targets in passing argument 3 of =20
> =91write_jpeg_file=92 differ in signedness
> make[1]: *** [g_main.o] Error 1
> make[1]: Leaving directory `/home/al/glfer-0.3.4'
> make: *** [all] Error 2
> al@linux:~/glfer-0.3.4>
>
>
> Has anyone encountered this before?

This compiles just fine on my mandrake system... but I have seen this =20
error before
change the define of  write_jpeg_file in g_save_image.h and =20
g_save_image.c
from (char *filename, int quality, char *image_buffer, int =20
image_width, int image_height)
to     (char *filename, int quality, guchar *image_buffer, int =20
image_width, int image_height)

and it should work


--
Alex / AB2RC
avflinsch@att.net



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
