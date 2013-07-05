From: Cathryn Mataga <cathryn@junglevision.com>
Subject: [PATCH] xfbbd: Run the same data files on 64-bit
Date: Fri, 05 Jul 2013 14:20:39 -0700
Message-ID: <51D738A7.1010505@junglevision.com>
References: <4CE0313C.3080804@upmc.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000308000404060309060809"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CE0313C.3080804@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000308000404060309060809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm moving my ham radio server up to 64-bit Fedora 18.  So I'm fixing 
issues as I hit them.

This is against fbbsrc.705e.  When compiled for 64 bits, the code was 
corrupting all my 32-bit data files.
I think this is right, that the binary data files should be the same 
between 32 and 64 bit compiles.

After applying this patch, I see my user names and messages correctly 
after copying data from my old 32-bit install to a new 64-bit install.

I haven't made any patches in awhile so if anything is wrong let me know.


--------------000308000404060309060809
Content-Type: text/plain; charset=windows-1252;
 name="fbbsrc.705e.sixtyfour.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fbbsrc.705e.sixtyfour.patch"

--- /home/cathryn/fbbsrc.705e/include/fbb_serv.h	2013-03-16 10:00:56.000000000 -0400
+++ /home/cathryn/fbbsrc.705e.sixtyfour/include/fbb_serv.h	2013-07-05 16:26:01.814157699 -0400
@@ -31,7 +31,7 @@
 
 #ifndef	_fbb_serv
 #define	_fbb_serv
-
+#define fbb_long int
 /* #define FORTIFY */
 
 #ifdef __LINUX__
@@ -655,8 +655,8 @@
 	uchar free;
 	uchar changed;
 	ushort seen;
-	long last_modif __a2__;
-	long last_seen __a2__;
+	fbb_long last_modif __a2__;
+	fbb_long last_seen __a2__;
 	char first_homebbs[41];
 	char secnd_homebbs[41];
 	char first_zip[9];
@@ -669,7 +669,6 @@
 /*
  * Structures et blocs de messages
  */
-
 typedef struct
 {
 	long nmess;
@@ -733,7 +732,7 @@
 	char indcnx[6];
 	uchar port;
 	uchar voie;
-	long datcnx __a2__;
+	fbb_long datcnx __a2__;
 	short tpscnx;
 }
 statis;
@@ -767,17 +766,17 @@
 
 	indicat indic;				/* 8  Callsign */
 	indicat relai[8];			/* 64 Digis path */
-	long lastmes __a2__;		/* 4  Last L number */
-	long nbcon __a2__;			/* 4  Number of connexions */
-	long hcon __a2__;			/* 4  Last connexion date */
-	long lastyap __a2__;		/* 4  Last YN date */
+	fbb_long lastmes __a2__;		/* 4  Last L number */
+	fbb_long nbcon __a2__;			/* 4  Number of connexions */
+	fbb_long hcon __a2__;			/* 4  Last connexion date */
+	fbb_long lastyap __a2__;		/* 4  Last YN date */
 	ushort flags;				/* 2  Flags */
 	ushort on_base;				/* 2  ON Base number */
 
 	uchar nbl;					/* 1  Lines paging */
 	uchar lang;					/* 1  Language */
 
-	long newbanner __a2__;		/* 4  Last Banner date */
+	fbb_long newbanner __a2__;		/* 4  Last Banner date */
 	ushort download;			/* 2  download size (KB) = 100 */
 	char free[20];				/* 20 Reserved */
 	char theme;					/* 1  Current topic */
@@ -802,7 +801,7 @@
 {
 	char mode;
 	char fbid[13];
-	long numero __a2__;
+	fbb_long numero __a2__;
 }
 bidfwd;
 
@@ -850,9 +849,9 @@
 {								/* Longueur = 194 octets */
 	char type;
 	char status;
-	long numero __a2__;
-	long taille __a2__;
-	long date __a2__;
+	fbb_long numero __a2__;
+	fbb_long taille __a2__;
+	fbb_long date __a2__;
 	char bbsf[7];
 	char bbsv[41];
 	char exped[7];
@@ -861,11 +860,11 @@
 	char titre[61];
 	char bin;
 	char free[5];
-	long grpnum __a2__;
+	fbb_long grpnum __a2__;
 	ushort nblu;
-	long theme __a2__;
-	long datesd __a2__;
-	long datech __a2__;
+	fbb_long theme __a2__;
+	fbb_long datesd __a2__;
+	fbb_long datech __a2__;
 	char fbbs[NBMASK];
 	char forw[NBMASK];
 }
@@ -921,12 +920,12 @@
 	double a0 __a2__;
 	double n0 __a2__;
 	double q3 __a2__;
-	long k0 __a2__;
+	fbb_long k0 __a2__;
 	double f1 __a2__;
 	double v1 __a2__;
 	short pas;
-	long maj __a2__;
-	long cat __a2__;			/* Catalog Number - anciennement vide  */
+	fbb_long maj __a2__;
+	fbb_long cat __a2__;			/* Catalog Number - anciennement vide  */
 	short libre[4];
 }
 satel;
@@ -1230,8 +1229,8 @@
 	char nomfic[LABEL_FIC];
 	char label[LABEL_NOM];
 	char owner[LABEL_OWN];
-	long index;
-	long date_creation;
+	fbb_long index;
+	fbb_long date_creation;
 	char free[24];
 }
 Rlabel;							/* 160 bytes */

--------------000308000404060309060809--
