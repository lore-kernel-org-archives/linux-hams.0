From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: Patch to mheardd
Date: Sun, 16 Nov 2003 22:22:06 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311162222.06965.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_+p+t/EMDR/UPiHI"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--Boundary-00=_+p+t/EMDR/UPiHI
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

There was a problem with invalid packets: Especially, corrupted digipeater =
fields=20
may lead to overwriting of memory far beyond the record in question. This m=
ay have
security implications. In my case it led to denial of service because file-=
record
locations were overwritten with garbage and the daemon attempted to write
to these locations.=20

Now, with a sanity check of the digipeater field, the daemon now works corr=
ectly=20
though the USCC card here generates many bad packets.=20

73 de LA7ECA, Oyvind
--=20
Computer Science dept. University of Troms=F8,  ohanssen@acm.org,  Cell: +4=
7 9511 7457

--Boundary-00=_+p+t/EMDR/UPiHI
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mheardd.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mheardd.diff"

--- mheardd.orig.c	2003-11-16 21:52:10.000000000 +0100
+++ mheardd.c	2003-11-16 22:01:03.000000000 +0100
@@ -228,14 +228,14 @@
 				syslog(LOG_WARNING, "packet too short\n");
 			continue;
 		}
-
-		mheard = findentry((ax25_address *)(data + AXLEN), port);
-
+		
 		if (!ax25_validate(data + 0) || !ax25_validate(data + AXLEN)) {
 			if (logging)
 				syslog(LOG_WARNING, "invalid callsign on port %s\n", port);
 			continue;
 		}
+		
+		mheard = findentry((ax25_address *)(data + AXLEN), port);
 
 		memcpy(&mheard->entry.from_call, data + AXLEN, sizeof(ax25_address));
 		memcpy(&mheard->entry.to_call,   data + 0,     sizeof(ax25_address));
@@ -248,7 +248,7 @@
 		data += (AXLEN + AXLEN);
 		size -= (AXLEN + AXLEN);
 
-		while (!end) {
+		while (!end && mheard->entry.ndigis <= 7 && ax25_validate(data) ) {
 			memcpy(&mheard->entry.digis[mheard->entry.ndigis], data, sizeof(ax25_address));
 			mheard->entry.ndigis++;
 			
@@ -257,7 +257,12 @@
 			data += AXLEN;
 			size -= AXLEN;
 		}
-
+		if (!end) {
+		    if (logging)
+		        syslog(LOG_WARNING, "invalid digipeater field\n");
+                    continue; 
+		}
+		    
 		if (size == 0) {
 			if (logging)
 				syslog(LOG_WARNING, "packet too short\n");

--Boundary-00=_+p+t/EMDR/UPiHI--

