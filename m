From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] node and libax25io nonblocking
Date: Mon, 17 Feb 2003 21:56:08 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030217215608.A801@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: csmall@small.dropbear.id.au, tomi.manninen@hut.fi


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

I got a bit tired of waiting for a new node release....
The attached patches are against libax25-0.0.10 and node-0.3.0.
The libax25 patch is basicly the same I posted a while back with the buffer
check added and a few changes to axio_puts(), axio_gets() and
axio_getline().

	Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="libax25-nonblock.diff"

diff -ruN libax25-0.0.10/ChangeLog libax25-0.0.10.rxq/ChangeLog
--- libax25-0.0.10/ChangeLog	Thu Mar 28 23:09:15 2002
+++ libax25-0.0.10.rxq/ChangeLog	Fri Feb 14 00:00:57 2003
@@ -1,3 +1,6 @@
+	* libax25io handles nonblocking io correctly. (PE1RXQ)
+	  THIS BREAKS PRACTICLY EVERY APP USING THIS LIBRARY, FIX THEM!!!
+
 libax25 0.0.10
 
  	* Fixed byte counting in flush_obuf() (PE1RXQ)
diff -ruN libax25-0.0.10/ax25io.c libax25-0.0.10.rxq/ax25io.c
--- libax25-0.0.10/ax25io.c	Thu Mar 28 22:57:51 2002
+++ libax25-0.0.10.rxq/ax25io.c	Mon Feb 17 21:22:21 2003
@@ -33,6 +33,9 @@
 	if ((new = calloc(1, sizeof(ax25io))) == NULL)
 		return NULL;
 
+	if (paclen > AXBUFLEN)
+		paclen = AXBUFLEN;
+
 	new->ifd	= in;
 	new->ofd	= out;
 	new->eolmode	= EOLMODE_TEXT;
@@ -134,38 +137,24 @@
 static int flush_obuf(ax25io *p)
 {
 	int ret;
-	int count=0;
 
 	if (p->optr == 0)
 		return 0;
 
-	do {
-		if ((ret = write(p->ofd, p->obuf, p->optr < p->paclen ? p->optr : p->paclen)) < 0)
+	if ((ret = write(p->ofd, p->obuf, p->optr < p->paclen ? p->optr : p->paclen)) < 0)
 			return -1;
 
-		if (ret < p->optr)
-			memmove(p->obuf, &p->obuf[ret], p->optr - ret);
-		p->optr -= ret;
-		count += ret;
-
-		/* If buffer full block until there is room */
-		if (p->optr>=AXBUFLEN) {
-			fd_set fdset;
-
-			FD_ZERO(&fdset);
-			FD_SET(p->ofd, &fdset);
-			if (select(p->ofd+1, NULL, &fdset, NULL, NULL)<0)
-				return -1;
-		}
-	} while (p->optr>=AXBUFLEN);
+	if (ret && ret < p->optr)
+		memmove(p->obuf, &p->obuf[ret], p->optr - ret);
+	p->optr -= ret;
 
-	return count;
+	return ret;
 }
 
 int axio_flush(ax25io *p)
 {
 	int flushed=0;
-	fd_set fdset;
+	int ret;
 
 #ifdef HAVE_ZLIB_H
 	if (p->zptr) {
@@ -227,18 +216,23 @@
 #endif
 
 	while (p->optr) {
-		FD_ZERO(&fdset);
-		FD_SET(p->ofd, &fdset);
-		if (select(p->ofd+1, NULL, &fdset, NULL, NULL)<0)
+		/* Return on error or if zero bytes written */
+		if ((ret=flush_obuf(p))<=0)
 			return -1;
-		flushed+=flush_obuf(p);
+		flushed+=ret;
 	}
 
 	return flushed;
 }
 
-static int rsendchar(unsigned char c, ax25io *p)
+static int rsend(unsigned char *c, int len, ax25io *p)
 {
+	/* Don't go further until there is space */
+	if (p->paclen <= p->optr) {
+		if (flush_obuf(p)<=0)
+			return -1;
+	}
+
 #ifdef HAVE_ZLIB_H
 	if (p->zptr) {
 		struct compr_s *z = (struct compr_s *) p->zptr;
@@ -255,9 +249,8 @@
 		/*
 		 * One new character to input.
 		 */
-		z->char_buf = c;
-		z->zout.next_in = &z->char_buf;
-		z->zout.avail_in = 1;
+		z->zout.next_in = c;
+		z->zout.avail_in = len;
 		/*
 		 * Now loop until deflate returns with avail_out != 0
 		 */
@@ -298,18 +291,26 @@
 
 		} while (z->zout.avail_out == 0);
 
-		return c;
+		return len;
 	}
 #endif
 
-	p->obuf[p->optr++] = c;
+	if (p->optr+len<AXBUFLEN) {
+		memcpy(p->obuf+p->optr, c, len);
+		p->optr+=len;
+	} else {
+		errno=EAGAIN;
+		return -1;
+	}
 
-	if (p->optr >= p->paclen && flush_obuf(p) < 0)
+	if (p->optr >= p->paclen && flush_obuf(p) < 0) {
 		return -1;
+	}
 
-	return c;
+	return len;
 }
 
+
 /* --------------------------------------------------------------------- */
 
 static int recv_ibuf(ax25io *p)
@@ -423,32 +424,25 @@
 
 int axio_putc(int c, ax25io *p)
 {
-	char *cp;
+	char cp;
 
 	if (p->telnetmode && c == IAC) {
-		if (rsendchar(IAC, p) == -1)
-			return -1;
-		return rsendchar(IAC, p);
+		static char iac[]={IAC, IAC};
+		return rsend(iac, 2, p);
 	}
 
 	if (c == INTERNAL_EOL) {
 		if (p->eolmode == EOLMODE_BINARY)
-			return rsendchar('\n', p);
+			return rsend("\n", 1, p);
 		else
-			for (cp = p->eol; *cp; cp++)
-				if (rsendchar(*cp, p) == -1)
-					return -1;
-		return 1;
+			return rsend(p->eol, strlen(p->eol), p);
 	}
 
-	if (p->eolmode == EOLMODE_TEXT && c == '\n') {
-		for (cp = p->eol; *cp; cp++)
-			if (rsendchar(*cp, p) == -1)
-				return -1;
-		return 1;
-	}
+	if (p->eolmode == EOLMODE_TEXT && c == '\n')
+		return rsend(p->eol, strlen(p->eol), p);
 
-	return rsendchar(c & 0xff, p);
+	cp=c&0xff;
+	return rsend(&cp, 1, p);
 }
 
 int axio_getc(ax25io *p)
@@ -500,28 +494,34 @@
 			 * ECHO and TRAPSIG).
 			 */
 			if (opt == TELOPT_LINEMODE && p->tn_linemode) {
-				rsendchar(IAC,                      p);
-				rsendchar(SB,                       p);
-				rsendchar(TELOPT_LINEMODE,          p);
-				rsendchar(LM_MODE,                  p);
-				rsendchar(MODE_EDIT | MODE_TRAPSIG, p);
-				rsendchar(IAC,                      p);
-				rsendchar(SE,                       p);
+				static char telopt_linemode[]={
+				    IAC,
+				    SB,
+				    TELOPT_LINEMODE,
+				    LM_MODE,
+				    MODE_EDIT | MODE_TRAPSIG,
+				    IAC,
+				    SE };
+				if (rsend(telopt_linemode, 7, p)<0)
+					return -1;
 			} else {
-				rsendchar(IAC,  p);
-				rsendchar(DONT, p);
-				rsendchar(opt,  p);
+				static char iac_dont[]={IAC, DONT, 0};
+				iac_dont[2]=opt;
+				if (rsend(iac_dont, 3, p)<0)
+					return -1;
 			}
 			axio_flush(p);
 			break;
 		case DO:
 			switch (opt) {
-			case TELOPT_SGA:
-				rsendchar(IAC,  p);
-				rsendchar(WILL, p);
-				rsendchar(opt,  p);
+			case TELOPT_SGA: {
+				static char iac_will[]={IAC, WILL, 0};
+				iac_will[2]=opt;
+				if (rsend(iac_will, 3, p)<0)
+					return -1;
 				axio_flush(p);
 				break;
+			}
 			case TELOPT_ECHO:
 				/*
 				 * If we want echo then just silently
@@ -530,13 +530,15 @@
 				if (p->tn_echo)
 					break;
 				/* Note fall-through */
-			default:
-				rsendchar(IAC,  p);
-				rsendchar(WONT, p);
-				rsendchar(opt,  p);
+			default: {
+				static char iac_wont[]={IAC, WONT, 0};
+				iac_wont[2]=opt;
+				if (rsend(iac_wont, 3, p)<0)
+					return -1;	
 				axio_flush(p);
 				break;
 			}
+			}
 			break;
 		case IAC:	/* Escaped IAC */
 			return IAC;
@@ -574,43 +576,62 @@
 
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
-		/* NUL also interpreted as EOL */
+		/* NULL also interpreted as EOL */
 		if (c == '\n' || c == '\r' || c == 0) {
 			buf[len] = 0;
-			return buf;
+			errno=0;
+			return len;
 		}
 		buf[len++] = c;
 	}
 	buf[buflen - 1] = 0;
-	return buf;
+	errno=0;
+	return len;
 }
 
+static int buf_usage=0;
+static char buf[AXBUFLEN];
+
 char *axio_getline(ax25io *p)
 {
-	static char buf[AXBUFLEN];
-
-	return axio_gets(buf, AXBUFLEN, p);
+	int ret;
+	
+	ret=axio_gets(buf+buf_usage, AXBUFLEN-buf_usage, p);
+	if (ret > 0) {
+		buf_usage=0;
+		return buf;
+	}
+	if (ret==0 && errno==0) {
+		buf_usage=0;
+		return buf;
+	}
+	buf_usage+=ret;
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
+			if (errno!=EAGAIN)
+				return -1;
+			else
+				break;
+		} else {
+			count++;
+		}
+	return count;
 }
 
 /* --------------------------------------------------------------------- */
@@ -639,29 +660,34 @@
 }
 
 /* --------------------------------------------------------------------- */
+static char do_linemode[]={IAC, DO, TELOPT_LINEMODE};
 
-void axio_tn_do_linemode(ax25io *p)
+int axio_tn_do_linemode(ax25io *p)
 {
-	rsendchar(IAC,             p);
-	rsendchar(DO,              p);
-	rsendchar(TELOPT_LINEMODE, p);
+	if (rsend(do_linemode, 3, p)<0)
+		return -1;
 	p->tn_linemode = 1;
+	return 0;
 }
 
-void axio_tn_will_echo(ax25io *p)
+static char will_echo[]={IAC, WILL, TELOPT_ECHO};
+
+int axio_tn_will_echo(ax25io *p)
 {
-	rsendchar(IAC,         p);
-	rsendchar(WILL,        p);
-	rsendchar(TELOPT_ECHO, p);
+	if (rsend(will_echo, 3, p)<0)
+		return -1;
 	p->tn_echo = 1;
+	return 0;
 }
 
-void axio_tn_wont_echo(ax25io *p)
+static char wont_echo[]={IAC, WONT, TELOPT_ECHO};
+
+int axio_tn_wont_echo(ax25io *p)
 {
-	rsendchar(IAC,         p);
-	rsendchar(WONT,        p);
-	rsendchar(TELOPT_ECHO, p);
+	if (rsend(wont_echo, 3, p)<0)
+		return -1;
 	p->tn_echo = 0;
+	return 0;
 }
 
 /* --------------------------------------------------------------------- */
diff -ruN libax25-0.0.10/ax25io.h libax25-0.0.10.rxq/ax25io.h
--- libax25-0.0.10/ax25io.h	Tue Apr 10 03:54:09 2001
+++ libax25-0.0.10.rxq/ax25io.h	Mon Feb 17 20:55:18 2003
@@ -73,13 +73,13 @@
 extern int axio_putc(int, ax25io *);
 
 extern char *axio_getline(ax25io *);
-extern char *axio_gets(char *, int, ax25io *);
+extern int axio_gets(char *, int, ax25io *);
 extern int axio_puts(const char *, ax25io *);
 
 extern int axio_printf(ax25io *, const char *, ...);
 
-extern void axio_tn_do_linemode(ax25io *);
-extern void axio_tn_will_echo(ax25io *);
-extern void axio_tn_wont_echo(ax25io *);
+extern int axio_tn_do_linemode(ax25io *);
+extern int axio_tn_will_echo(ax25io *);
+extern int axio_tn_wont_echo(ax25io *);
 
 #endif _AX25IO_H

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="node-0.3.0-nonblock.diff"

diff -ruN node-0.3.0/HISTORY node-0.3.0.rxq/HISTORY
--- node-0.3.0/HISTORY	Mon Jul  5 19:35:49 1999
+++ node-0.3.0.rxq/HISTORY	Fri Feb 14 00:03:26 2003
@@ -1,3 +1,6 @@
+			- Fixed Nonblocking response for new libax25io.
+			  (PE1RXQ)
+
 0.3.0   05 Jul 1999	- Initial version using the new dynamic libax25.
 			- Moved the IO code to libax25.
 
diff -ruN node-0.3.0/extcmd.c node-0.3.0.rxq/extcmd.c
--- node-0.3.0/extcmd.c	Sun Jun  6 22:24:34 1999
+++ node-0.3.0.rxq/extcmd.c	Fri Feb 14 00:03:26 2003
@@ -49,8 +49,9 @@
 {
 	ax25io *iop;
 	int pipe_in[2], pipe_out[2];
-	int pid, c;
-	fd_set fdset;
+	int pid, cn=0, cp=0;
+	fd_set fdset, fdsetno;
+	int pend_nodew=0, pend_nodef=0, pend_pipew=0, pend_pipef=0;
 
 	if (pipe(pipe_in) == -1) {
 		node_perror("pipe_extcmd: pipe_in", errno);
@@ -102,31 +103,66 @@
 	}
 	while (1) {
 		FD_ZERO(&fdset);
+		FD_ZERO(&fdsetno);
 		FD_SET(STDIN_FILENO, &fdset);
 		FD_SET(pipe_out[0], &fdset);
-		if (select(32, &fdset, 0, 0, 0) == -1) {
+		if (pend_nodew || pend_nodef)
+			FD_SET(NodeIo->ofd, &fdsetno);
+		if (pend_pipew || pend_pipef)
+			FD_SET(iop->ofd, &fdsetno);
+		if (select(32, &fdset, &fdsetno, 0, 0) == -1) {
 			node_perror("pipe_extcmd: select", errno);
 			break;
 		}
-		if (FD_ISSET(STDIN_FILENO, &fdset)) {
+		/* Try to write pending char to pipe */
+		if (FD_ISSET(iop->ofd, &fdsetno)) {
+			if (axio_putc(cn, iop) != -1)
+				pend_pipew=0;
+			else if (errno != EAGAIN)
+				break;
+		}
+		if (FD_ISSET(STDIN_FILENO, &fdset) && !pend_pipew) {
 			alarm(ConnTimeout);
-			while((c = axio_getc(NodeIo)) != -1)
-				axio_putc(c, iop);
+			while((cn = axio_getc(NodeIo)) != -1)
+				if (axio_putc(cn, iop)==-1 && errno==EAGAIN) {
+					pend_pipew=1;
+					break;
+				}
 			if (errno != EAGAIN)
 				break;
 		}
-		if (FD_ISSET(pipe_out[0], &fdset)) {
+		if (FD_ISSET(NodeIo->ofd, &fdsetno)) {
+			if (axio_putc(cp, NodeIo) != -1)
+				pend_pipew=0;
+			else if (errno != EAGAIN)
+				break;
+		}
+		if (FD_ISSET(pipe_out[0], &fdset) && !pend_nodew) {
 			alarm(ConnTimeout);
-			while((c = axio_getc(iop)) != -1)
-				axio_putc(c, NodeIo);
+			while((cp = axio_getc(iop)) != -1)
+				if (axio_putc(cp, NodeIo)==-1 && errno==EAGAIN) {
+					pend_nodew=1;
+					break;
+				}
 			if (errno != EAGAIN) {
                                 if (errno)
                                         node_msg("%s", strerror(errno));
                                 break;
 			}
 		}
-		axio_flush(NodeIo);
-		axio_flush(iop);
+		if (axio_flush(NodeIo)==-1) {
+			if (errno==EAGAIN)
+				pend_nodef=1;
+			else
+				break;
+		} else
+			pend_nodef=0;
+		if (axio_flush(iop)==-1) {
+			if (errno==EAGAIN)
+				pend_pipef=1;
+			else
+				break;
+		}
 	}
 	axio_end(iop);
 end:
diff -ruN node-0.3.0/gateway.c node-0.3.0.rxq/gateway.c
--- node-0.3.0/gateway.c	Sun Jun  6 22:24:34 1999
+++ node-0.3.0.rxq/gateway.c	Mon Feb 17 01:19:22 2003
@@ -272,7 +272,18 @@
 	}
 	User.dl_type = family;
 	node_msg("Trying %s... Type <RETURN> to abort", print_dl(&User));
-	axio_flush(NodeIo);
+	while (axio_flush(NodeIo)==-1) {
+		if (errno!=EAGAIN) {
+			close(fd);
+			return NULL;
+		}
+		FD_ZERO(&write_fdset);
+		FD_SET(NodeIo->ofd, &write_fdset);
+		if (select(NodeIo->ofd+1, 0, &write_fdset, 0, 0)==-1) {
+			close(fd);
+			return NULL;
+		}
+	}
 	User.state = STATE_TRYING;
 	update_user();
 	/*
@@ -335,7 +346,18 @@
 			 escape < 32 ? "CTRL-" : "",
 			 escape < 32 ? (escape + 'A' - 1) : escape);
 
-	axio_flush(NodeIo);
+	while (axio_flush(NodeIo)==-1) {
+		if (errno!=EAGAIN) {
+			close(fd);
+			return NULL;
+		}
+		FD_ZERO(&write_fdset);
+		FD_SET(NodeIo->ofd, &write_fdset);
+		if (select(NodeIo->ofd+1, 0, &write_fdset, 0, 0)==-1) {
+			close(fd);
+			return NULL;
+		}
+	}
 	log(L_GW, "Connected to %s", print_dl(&User));
 	if ((riop = axio_init(fd, fd, paclen, eol)) == NULL) {
 		node_perror("connect_to: Initializing I/O failed", errno);
@@ -352,9 +374,10 @@
 int do_connect(int argc, char **argv)
 {
 	ax25io *riop;
-	int c, family, stay, escape, compress;
-	fd_set fdset;
+	int c, family, stay, escape, compress, cp=0, cn=0;
+	fd_set fdset, fdsetno;
 	char *connstr = NULL;
+	int pend_pipew=0, pend_pipef=0, pend_nodew=0, pend_nodef=0, pend_getline=0;
 
 	stay = ReConnectTo;
 	if (!strcasecmp(argv[argc - 1], "s")) {
@@ -406,7 +429,15 @@
 		axio_tnmode(riop, 1);
 	if (connstr) {
 		axio_printf(riop, "%s\n", connstr);
-		axio_flush(riop);
+		while (axio_flush(riop)==-1) {
+			if (errno!=EAGAIN)
+				return 0;
+			FD_ZERO(&fdset);
+			FD_SET(riop->ofd, &fdset);
+			if (select(riop->ofd+1, 0, &fdset, 0, 0)==-1) {
+				return 0;
+			}
+		}
 	}
 	/*
 	 * If eol conventions are compatible, switch to binary mode,
@@ -421,16 +452,30 @@
 	}
 	while (1) {
 		FD_ZERO(&fdset);
+		FD_ZERO(&fdsetno);
 		FD_SET(riop->ifd, &fdset);
 		FD_SET(STDIN_FILENO, &fdset);
-		if (select(32, &fdset, 0, 0, 0) == -1) {
+		if (pend_nodew || pend_nodef)
+			FD_SET(NodeIo->ofd, &fdsetno);
+		if (pend_pipew || pend_pipef)
+			FD_SET(riop->ofd, &fdsetno);
+		if (select(32, &fdset, &fdsetno, 0, 0) == -1) {
 			node_perror("do_connect: select", errno);
 			break;
 		}
-		if (FD_ISSET(riop->ifd, &fdset)) {
+		if (FD_ISSET(NodeIo->ofd, &fdsetno)) {
+			if (axio_putc(cp, NodeIo) != -1)
+				pend_nodew=0;
+			else if (errno != EAGAIN)
+				break;
+		}
+		if (FD_ISSET(riop->ifd, &fdset) && !pend_nodew) {
 			alarm(ConnTimeout);
-			while((c = axio_getc(riop)) != -1)
-				axio_putc(c, NodeIo);
+			while((cp = axio_getc(riop)) != -1)
+				if (axio_putc(cp, NodeIo)==-1 && errno==EAGAIN) {
+					pend_nodew=1;
+					break;
+				}
 			if (errno != EAGAIN) {
 				switch (errno) {
 				case 0:
@@ -451,25 +496,52 @@
 				break;
 			}
 		}
-		if (FD_ISSET(STDIN_FILENO, &fdset)) {
+		if (FD_ISSET(riop->ofd, &fdsetno)) {
+			if (axio_putc(cn, riop) != -1)
+				pend_pipew=0;
+			else if (errno != EAGAIN)
+				break;
+		}
+		if (FD_ISSET(STDIN_FILENO, &fdset) && pend_getline) {
+			if (axio_getline(NodeIo))
+				pend_getline=0;
+		}
+		if (FD_ISSET(STDIN_FILENO, &fdset) && !pend_pipew && !pend_getline) {
 			alarm(ConnTimeout);
-			while((c = axio_getc(NodeIo)) != -1) {
-				if (escape != -1 && c == escape)
+			while((cn = axio_getc(NodeIo)) != -1) {
+				if (escape != -1 && cn == escape)
 					break;
-				axio_putc(c, riop);
+				if (axio_putc(cn, riop)==-1 && errno==EAGAIN) {
+					pend_pipew=1;
+					break;
+				}
 			}
-			if (escape != -1 && c == escape) {
+			if (escape != -1 && cn == escape) {
 				axio_eolmode(NodeIo, EOLMODE_TEXT);
-				axio_getline(NodeIo);
-				break;
+				if (!axio_getline(NodeIo))
+					pend_getline=1;
+				else
+					break;
 			}
 			if (errno != EAGAIN) {
 				stay = 0;
 				break;
 			}
 		}
-		axio_flush(riop);
-		axio_flush(NodeIo);
+		if (axio_flush(riop)==-1) {
+			if (errno==EAGAIN)
+				pend_pipef=1;
+			else
+				break;
+		} else
+			pend_pipef=0;
+		if (axio_flush(NodeIo)==-1) {
+			if (errno==EAGAIN)
+				pend_nodef=1;
+			else
+				break;
+		} else
+			pend_nodef=0;
 	}
 	axio_end(riop);
 	log(L_GW, "Disconnected from %s", print_dl(&User));
@@ -488,6 +560,7 @@
 	ax25io *riop;
 	int c;
 	char *name, *addr[3], *cp;
+	fd_set fdset;
 
 	if (argc < 2) {
 		name = "";
@@ -507,9 +580,26 @@
 		if (fcntl(riop->ifd, F_SETFL, 0) == -1)
 			node_perror("do_finger: fcntl - fd", errno);
 		axio_printf(riop, "%s\n", name);
-		axio_flush(riop);
+		while (axio_flush(riop)==-1) {
+			if (errno!=EAGAIN)
+				break;
+			FD_ZERO(&fdset);
+			FD_SET(riop->ofd, &fdset);
+			if (select(riop->ofd+1, 0, &fdset, 0, 0)==-1)
+				break;
+		}
 		while((c = axio_getc(riop)) != -1)
-			axio_putc(c, NodeIo);
+			if (axio_putc(c, NodeIo)==-1) {
+				if (errno!=EAGAIN)
+					break;
+				FD_ZERO(&fdset);
+				FD_SET(NodeIo->ofd, &fdset);
+				/* This is one way traffic, we are just going
+				   to sit and wait until we can send again */
+				if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+					break;
+				axio_putc(c, NodeIo);
+			}
 		axio_end(riop);
 		node_msg("Reconnected to %s", HostName);
 	}
@@ -615,7 +705,14 @@
 		return 0;
 	}
 	node_msg("Pinging %s... Type <RETURN> to abort", inet_ntoa(to.sin_addr));
-	axio_flush(NodeIo);
+	while (axio_flush(NodeIo)==-1) {
+		if (errno!=EAGAIN)
+			return 0;
+		FD_ZERO(&fdset);
+		FD_SET(NodeIo->ofd, &fdset);
+		if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+			return 0;
+	}
 	strncpy(User.dl_name, hp->h_name, 31);
 	User.dl_name[31] = 0;
 	User.dl_type = AF_INET;
diff -ruN node-0.3.0/node.c node-0.3.0.rxq/node.c
--- node-0.3.0/node.c	Sun Jun  6 22:24:34 1999
+++ node-0.3.0.rxq/node.c	Mon Feb 17 01:18:42 2003
@@ -90,6 +90,7 @@
 	int paclen;
 	FILE *fp;
 	int invalid_cmds = 0;
+	fd_set fdset;
 
 	signal(SIGALRM, signal_handler);
 	signal(SIGTERM, signal_handler);
@@ -170,7 +171,14 @@
 #endif
 	if (User.ul_type == AF_INET) {
 		axio_tnmode(NodeIo, 1);
-		axio_tn_do_linemode(NodeIo);
+		while (axio_tn_do_linemode(NodeIo)==-1) {
+			if (errno!=EAGAIN)
+				return 1;
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ofd, &fdset);
+			if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+				return 1;
+		}
 	}
 	init_nodecmds();
 	if (read_config() == -1) {
@@ -192,9 +200,22 @@
 	login_user();
 	if (User.call[0] == 0) {
 		nprintf("\n%s (%s)\n\nlogin: ", VERSION, HostName);
-		axio_flush(NodeIo);
+		while (axio_flush(NodeIo)==-1) {
+			if (errno!=EAGAIN)
+				return 1;
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ofd, &fdset);
+			if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+				return 1;
+		}
 		alarm(300L);			/* 5 min timeout */
-		if ((p = axio_getline(NodeIo)) == NULL)
+		while ((p = axio_getline(NodeIo)) == NULL && errno==EAGAIN) {
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ifd, &fdset);
+			if (select(NodeIo->ifd+1, &fdset, 0, 0, 0)==-1)
+				return 1;
+		}
+		if (p == NULL)
 			logout("User disconnected");
 		alarm(0L);
 		strncpy(User.call, p, 9);
@@ -215,13 +236,39 @@
 	} else if (strcmp(pw, "*") != 0) {
 		nputs("Password: ");
 		if (User.ul_type == AF_INET) {
-			axio_tn_will_echo(NodeIo);
+			while (axio_tn_will_echo(NodeIo)==-1) {
+				if (errno!=EAGAIN)
+					return 1;
+				FD_ZERO(&fdset);
+				FD_SET(NodeIo->ofd, &fdset);
+				if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+					return 1;
+			}
 			axio_eolmode(NodeIo, EOLMODE_BINARY);
 		}
-		axio_flush(NodeIo);
-		p = axio_getline(NodeIo);
+		while (axio_flush(NodeIo)==-1) {
+			if (errno!=EAGAIN)
+				return 1;
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ofd, &fdset);
+			if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+				return 1;
+		}
+		while ((p = axio_getline(NodeIo)) == NULL && errno==EAGAIN) {
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ifd, &fdset);
+			if (select(NodeIo->ifd+1, &fdset, 0, 0, 0)==-1)
+				return 1;
+		}
 		if (User.ul_type == AF_INET) {
-			axio_tn_wont_echo(NodeIo);
+			while (axio_tn_wont_echo(NodeIo)==-1) {
+				if (errno!=EAGAIN)
+					return 1;
+				FD_ZERO(&fdset);
+				FD_SET(NodeIo->ofd, &fdset);
+				if (select(NodeIo->ofd+1, 0,&fdset, 0, 0)==-1)
+					return 1;
+			}
 			axio_eolmode(NodeIo, EOLMODE_TEXT);
 			nputs("\n");
 		}
@@ -243,7 +290,14 @@
 	put_prompt();
 	log(L_LOGIN, "%s @ %s logged in", User.call, User.ul_name);
 	while (1) {
-		axio_flush(NodeIo);
+		while (axio_flush(NodeIo)==-1) {
+			if (errno!=EAGAIN)
+				return 1;
+			FD_ZERO(&fdset);
+			FD_SET(NodeIo->ofd, &fdset);
+			if (select(NodeIo->ofd+1, 0, &fdset, 0, 0)==-1)
+				return 1;
+		}
 		User.state = STATE_IDLE;
 		time(&User.cmdtime);
 		update_user();
@@ -251,6 +305,13 @@
 		if ((p = axio_getline(NodeIo)) == NULL) {
 			if (errno == EINTR)
 				continue;
+			if (errno == EAGAIN) {
+				FD_ZERO(&fdset);
+				FD_SET(NodeIo->ifd, &fdset);
+				if (select(NodeIo->ifd+1, &fdset, 0, 0, 0)==-1)
+					return 1;
+				continue;
+			}
 			logout("User disconnected");
 		}
 		alarm(IdleTimeout);
diff -ruN node-0.3.0/nodeusers.c node-0.3.0.rxq/nodeusers.c
--- node-0.3.0/nodeusers.c	Sun Jun  6 22:24:34 1999
+++ node-0.3.0.rxq/nodeusers.c	Mon Feb 17 01:13:58 2003
@@ -67,11 +67,21 @@
 		fprintf(stderr, "nodeusers: axio_init failed\r\n");
 		return 1;
 	}
-	if (inet && axio_getline(NodeIo) == NULL) {
-		if (logging)
-			syslog(LOG_ERR, "axio_getline: %m");
-		axio_end(NodeIo);
-		return 1;
+	if (inet) {
+		while (axio_getline(NodeIo) == NULL) {
+			if (errno==EAGAIN) {
+				fd_set fdset;
+			
+				FD_ZERO(&fdset);
+				FD_SET(NodeIo->ifd, &fdset);
+				select(NodeIo->ifd+1, &fdset, 0, 0, 0);
+				continue;
+			}
+			if (logging)
+				syslog(LOG_ERR, "axio_getline: %m");
+			axio_end(NodeIo);
+			return 1;
+		}
 	}
 	n = user_count();
 	nprintf("\n%s - %d user%s.\n\n", VERSION, n, n == 1 ? "" : "s");
diff -ruN node-0.3.0/util.c node-0.3.0.rxq/util.c
--- node-0.3.0/util.c	Wed Apr 21 22:38:43 1999
+++ node-0.3.0.rxq/util.c	Fri Feb 14 00:12:03 2003
@@ -15,7 +15,15 @@
 
 int nputs(const char *str)
 {
-	return axio_puts(str, NodeIo);
+	int i=0, ret;
+	
+	while (i<strlen(str)) {
+		ret=axio_puts(str+i, NodeIo);
+		if (ret==-1)
+			return -1;
+		i+=ret;
+	}
+	return 0;
 }
 
 int nprintf(const char *fmt, ...)

--AWniW0JNca5xppdA--

