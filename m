From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: xfbbd patch for satellite characteristics
Date: Tue, 27 Jul 2004 22:46:32 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4106DB48.7030303@ccr.jussieu.fr>
References: <OKEALBPJHMFOPCCCKAICIEDDCNAA.ian@bultitude.org> <40D920F7.9090507@telia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040109090701080605050305"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40D920F7.9090507@telia.com>
List-Id: <linux-hams.vger.kernel.org>
To: xfbb@f6fbb.org, linux-hams <linux-hams@vger.kernel.org>
Cc: f6bvp@amsat.org, Liste fbb <fbb@f6fbb.org>

This is a multi-part message in MIME format.
--------------040109090701080605050305
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I have written a small patch for xfbbd BBS trajovl.c source file.
When applied it will add an asterix displayed after the satellite number 
in satellite submenu List only when a satellite documentation file is 
present. Otherwise, the field will be left blank.

This will be usefull for users who want to consult the satellites 
characteristic files that contain satellite documentations coming from 
the most recent AMSAT ANS bulletins (if the sysop has included the 
satdoc housekeeping utility I wrote for this usage). See here the 
different versions of SATDOC for DOS, Win32, Linux

http://ftp.lip6.fr/jussieu/labos/physio/

Here follows the patch trajovl.diff

73's de Bernard, f6bvp



--------------040109090701080605050305
Content-Type: text/plain;
 name="trajovl.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="trajovl.diff"

--- trajovl.c	Tue Jul 27 18:54:40 2004
+++ trajovl.c	Tue Jul 27 18:50:48 2004
@@ -504,6 +504,8 @@
 	int i = 0;
 	satel bufsat;
 	FILE *fptr;
+	char satstr[80];
+	FILE *fptr2;
 
 	cr ();
 	fptr = ouvre_sat ();
@@ -511,6 +513,13 @@
 	{
 		sprintf (varx[0], "%3d", i++);
 		sprintf (varx[1], "%-17s", bufsat.dd);
+		sprintf (satstr, "sat\\%ld.sat", bufsat.cat);
+		if ((fptr2 = fbb_fopen( d_disque (satstr),"r+b")) != NULL)
+		{
+			strcat (varx[0]," *");
+		} else
+        	strcat (varx[0],"  ");
+
 		texte (T_TRJ + 39);
 		if ((i % 3) == 0)
 			cr_cond ();

--------------040109090701080605050305--
