From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Gmfsk 0.6beta3 segmentation fault with Mandrake 10
Date: Sat, 13 Mar 2004 15:02:45 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1079182965.1271.1.camel@oh2bns.ampr.org>
References: <4052C5F5.8070903@home.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-HCA07p+L6/su1igW6eGi"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4052C5F5.8070903@home.se>
List-Id: <linux-hams.vger.kernel.org>
To: =?ISO-8859-1?Q?P=E4r?= <perpetum@home.se>
Cc: Linux Hams <linux-hams@vger.kernel.org>


--=-HCA07p+L6/su1igW6eGi
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-03-13 at 10:27, P=E4r wrote:

> Has anyone tried getting gmfsk to work with Mandrake 10 ?
> It compiles and installs nicely but when I try to run it crashes
> after the initial wizard. It will present a nice "segmentation
> fault" every time now.  Any hints ?

This seems to happen with certain versions of Gnome libs. Please
try the attached patch.

--=20
Tomi Manninen / OH2BNS / KP20ME04

--=-HCA07p+L6/su1igW6eGi
Content-Disposition: attachment; filename=gmfsk-modes.patch
Content-Type: text/x-patch; name=gmfsk-modes.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

diff -ruN gmfsk-0.6beta3.orig/src/main.c gmfsk-0.6beta3/src/main.c
--- gmfsk-0.6beta3.orig/src/main.c	2004-02-20 02:29:28.000000000 +0200
+++ gmfsk-0.6beta3/src/main.c	2004-03-13 14:59:28.000000000 +0200
@@ -688,37 +688,37 @@
 		switch (trx_get_mode()) {
 		default:
 		case MODE_MFSK16:
-			w = find_menu_item("Mode/MFSK16");
+			w = find_menu_item("_Mode/MFSK16");
 			break;
 		case MODE_MFSK8:
-			w = find_menu_item("Mode/MFSK8");
+			w = find_menu_item("_Mode/MFSK8");
 			break;
 		case MODE_RTTY:
-			w = find_menu_item("Mode/RTTY");
+			w = find_menu_item("_Mode/RTTY");
 			break;
 		case MODE_THROB1:
-			w = find_menu_item("Mode/THROB (1 throb/s)");
+			w = find_menu_item("_Mode/THROB (1 throb/s)");
 			break;
 		case MODE_THROB2:
-			w = find_menu_item("Mode/THROB (2 throbs/s)");
+			w = find_menu_item("_Mode/THROB (2 throbs/s)");
 			break;
 		case MODE_THROB4:
-			w = find_menu_item("Mode/THROB (4 throbs/s)");
+			w = find_menu_item("_Mode/THROB (4 throbs/s)");
 			break;
 		case MODE_BPSK31:
-			w = find_menu_item("Mode/PSK31 (BPSK)");
+			w = find_menu_item("_Mode/PSK31 (BPSK)");
 			break;
 		case MODE_QPSK31:
-			w = find_menu_item("Mode/PSK31 (QPSK)");
+			w = find_menu_item("_Mode/PSK31 (QPSK)");
 			break;
 		case MODE_PSK63:
-			w = find_menu_item("Mode/PSK63");
+			w = find_menu_item("_Mode/PSK63");
 			break;
 		case MODE_MT63:
-			w = find_menu_item("Mode/MT63");
+			w = find_menu_item("_Mode/MT63");
 			break;
 		case MODE_FELDHELL:
-			w = find_menu_item("Mode/FELDHELL");
+			w = find_menu_item("_Mode/FELDHELL");
 			break;
 		}
 

--=-HCA07p+L6/su1igW6eGi--

