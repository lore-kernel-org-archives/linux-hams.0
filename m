From: "f6bvp@free" <f6bvp@free.fr>
Subject: Re: [PATCH] ax25tools mheard : don't display empty records
Date: Wed, 07 Aug 2013 12:06:57 +0200
Message-ID: <52021C41.4010506@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org> <5201391F.40607@free.fr> <20130807081754.GE18314@x-berg.in-berlin.de>
Reply-To: f6bvp@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20130807081754.GE18314@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

Hello Thomas,

As you know mheard is a user application included in ax25tools package.
It is not part of Linux kernel.

Here is a diff of ax25tools/ax25/mheard.c

73 de Bernard, f6bvp


Index: ax25/mheard.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- ax25/mheard.c       (r=E9vision 109)
+++ ax25/mheard.c       (copie de travail)
@@ -68,7 +68,8 @@
                         call =3D ax25_ntoa(&pr->entry.from_call);
                         if ((s =3D strstr(call, "-0")) !=3D NULL)
                                 *s =3D '\0';
-                       printf("%-10s %-5s %5d   %s\n",
+                       if (pr->entry.count !=3D 0)
+                               printf("%-10s %-5s %5d   %s\n",
                                 call, pr->entry.portname,=20
pr->entry.count, lh);
                         break;
                 case 1:
@@ -91,7 +92,8 @@
                         }
                         if (pr->entry.ndigis >=3D 4)
                                 strcat(buffer, ",...");
-                       printf("%-70s %-5s\n",
+                       if (pr->entry.count !=3D 0)
+                               printf("%-70s %-5s\n",
                                 buffer, pr->entry.portname);
                         break;
                 case 2:
@@ -102,14 +104,16 @@
                         call =3D ax25_ntoa(&pr->entry.from_call);
                         if ((s =3D strstr(call, "-0")) !=3D NULL)
                                 *s =3D '\0';
-                       printf("%-10s %-5s %5d %5d %5d  %s  %s\n",
+                       if (pr->entry.count !=3D 0)
+                               printf("%-10s %-5s %5d %5d %5d %s  %s\n=
",
                                 call, pr->entry.portname,=20
pr->entry.iframes, pr->entry.sframes, pr->entry.uframes, fh, lh);
                         break;
                 case 3:
                         call =3D ax25_ntoa(&pr->entry.from_call);
                         if ((s =3D strstr(call, "-0")) !=3D NULL)
                                 *s =3D '\0';
-                       printf("%-10s %-5s %5d %5s ",
+                       if (pr->entry.count !=3D 0) {
+                               printf("%-10s %-5s %5d %5s ",
                                 call, pr->entry.portname,=20
pr->entry.count, types[pr->entry.type]);
                         if (pr->entry.mode & MHEARD_MODE_ARP)
                                 printf(" ARP");
@@ -136,6 +140,7 @@
                         if (pr->entry.mode & MHEARD_MODE_UNKNOWN)
                                 printf(" Unknown");
                         printf("\n");
+                       }
                         break;
         }
  }


Le 07/08/2013 10:17, Thomas Osterried a =E9crit :
> Hello Bernard,
>
> please send us a diff for the official tree.
>
> vy 73,
> 	- Thomas  dl9sau
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
