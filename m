From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Tue, 18 Feb 2003 23:35:27 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030218233527.K507@jeroen.pe1rxq.ampr.org>
References: <20030218001400.I801@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302180116370.1481-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+fexcqMh/evT6CrY"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0302180116370.1481-100000@oh2bns.ampr.org>; from tpm@prkele.tky.hut.fi on Tue, Feb 18, 2003 at 00:17:50 +0100
List-Id: <linux-hams.vger.kernel.org>
To: tpm@prkele.tky.hut.fi
Cc: csmall@small.dropbear.id.au, linux-hams@vger.kernel.org


--+fexcqMh/evT6CrY
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 2003.02.18 00:17:50 +0100 Tomi Manninen wrote:
> 
> Ok, could you please take those too, or better make the patch against the
> 
> CVS version (assuming the CVS version was updated) ?

Attached the same patch against what should have been in the CVS :)

btw getline changed a bit, the buffer is no longer global but in the ax25io
structure so each connection has its own (this is not a problem yet, but
might become one...)

	Jeroen
--+fexcqMh/evT6CrY
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="libax25-0.0.10-nonblock.diff"

diff -ruN libax25-0.0.10.oh2bns/ax25io.c libax25-0.0.10.merge/ax25io.c
--- libax25-0.0.10.oh2bns/ax25io.c	Tue Feb 18 23:30:34 2003
+++ libax25-0.0.10.merge/ax25io.c	Tue Feb 18 23:29:27 2003
@@ -44,6 +44,7 @@
 	new->ofd = out;
 	new->eolmode = EOLMODE_TEXT;
 	new->paclen = paclen;
+	new->gbuf_usage = 0;
 
 	strncpy(new->eol, eol, 3);
 	new->eol[3] = 0;
@@ -564,43 +565,55 @@
 
 /* --------------------------------------------------------------------- */
 
-char *axio_gets(char *buf, int buflen, ax25io *p)
+int axio_gets(char *buf, int buflen, ax25io *p)
 {
 	int c, len = 0;
 
 	while (len < (buflen - 1)) {
 		c = axio_getc(p);
 		if (c == -1) {
-			if (len > 0) {
-				buf[len] = 0;
-				return buf;
-			} else
-				return NULL;
+			return -len;
 		}
 		/* NUL also interpreted as EOL */
 		if (c == '\n' || c == '\r' || c == 0) {
 			buf[len] = 0;
-			return buf;
+			errno = 0;
+			return len;
 		}
 		buf[len++] = c;
 	}
 	buf[buflen - 1] = 0;
-	return buf;
+	errno = 0;
+	return len;
 }
 
 char *axio_getline(ax25io *p)
 {
-	static char buf[AXBUFLEN];
+	int ret;
 
-	return axio_gets(buf, AXBUFLEN, p);
+	ret = axio_gets(p->gbuf + p->gbuf_usage, AXBUFLEN - p->gbuf_usage, p);
+	if (ret > 0 || (ret == 0 && errno == 0)) {
+		p->gbuf_usage = 0;
+		return p->gbuf;
+	}
+	p->gbuf_usage += ret;
+	return NULL;
 }
 
 int axio_puts(const char *s, ax25io *p)
 {
+	int count=0;
+
 	while (*s)
-		if (axio_putc(*s++, p) == -1)
-			return -1;
-	return 0;
+		if (axio_putc(*s++, p) == -1) {
+			if (errno != EAGAIN)
+				return -1;
+			else
+				break;
+		} else {
+			count++;
+		}
+	return count;
 }
 
 /* --------------------------------------------------------------------- */
diff -ruN libax25-0.0.10.oh2bns/ax25io.h libax25-0.0.10.merge/ax25io.h
--- libax25-0.0.10.oh2bns/ax25io.h	Tue Feb 18 23:30:34 2003
+++ libax25-0.0.10.merge/ax25io.h	Tue Feb 18 23:28:44 2003
@@ -33,6 +33,8 @@
 	int paclen;		/* paclen                               */
 	unsigned char ibuf[AXBUFLEN];	/* input buffer			*/
 	unsigned char obuf[AXBUFLEN];	/* output buffer		*/
+	unsigned char gbuf[AXBUFLEN];	/* getline buffer		*/
+	int gbuf_usage;		/* getline buffer usage			*/
 	int iptr;		/* input pointer                        */
 	int optr;		/* output pointer                       */
 	void *zptr;		/* pointer to the compression struct	*/
@@ -73,7 +75,7 @@
 extern int axio_putc(int, ax25io *);
 
 extern char *axio_getline(ax25io *);
-extern char *axio_gets(char *, int, ax25io *);
+extern int axio_gets(char *, int, ax25io *);
 extern int axio_puts(const char *, ax25io *);
 
 extern int axio_printf(ax25io *, const char *, ...);

--+fexcqMh/evT6CrY--

