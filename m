From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: patch for ax25tools and kernel 2.6
Date: Sat, 11 Dec 2004 20:13:55 +0100
Message-ID: <41BB46F3.1030201@ccr.jussieu.fr>
References: <20041208182942.482B54122B2@mail.n1uro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090803030503010106090103"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041208182942.482B54122B2@mail.n1uro.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: xfbb@f6fbb.org, linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090803030503010106090103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Brian wrote:
> Greetings;
> 
> I see in last month's archives some questions were raised about the 
> 2.6 series kernels, one was on MDK 10.1... but I saw no 
> answers/replies about the subject.
> 
I am working on the question of udev and kernel 2.6
I think I have a solution with /dev/ptmx and /dev/pts/0 ... 4
See ptmx manual (man ptmx for explanations).

By the way. I have just made a patch including my previous one and the 
patch taking into account the missing file soundmodem.h for 
ax25-tools-0.0.8 and kernel 2.6.

I thought it could be more convenient to have only one patch to apply on
ax25-tool-0.0.8 in order to make compilation under kernel 2.6.8.x fine.

First, download ax25-tools-0.0.8.tar.gz from sourceforge.net or another 
mirror site into say, /usr/local/src/ax25
cd into this directory
Then tar xvfz ax25-tools-0.0.8.tar.gz
Then patch -p0 < ax25-tool-0.0.8-kernel-2.6.diff (the name of my 
attached patch)
an cd toax25-tools-0.0.8
./configure
make
make install
and you are done with all ax25 tools installed into /usr/local/sbin

73 de Bernard,f6bvp

--------------090803030503010106090103
Content-Type: text/x-patch;
 name="ax25-tools-0.0.8-kernel-2.6.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25-tools-0.0.8-kernel-2.6.diff"

diff -ruN ax25-tools-0.0.8/ax25/axspawn.c ax25-tools-0.0.8.orig/ax25/axspawn.c
--- ax25-tools-0.0.8/ax25/axspawn.c	2004-12-11 19:25:19.681229030 +0100
+++ ax25-tools-0.0.8.orig/ax25/axspawn.c	2004-12-11 19:24:56.419922026 +0100
@@ -124,7 +124,7 @@
 #include <paths.h>
 #include <errno.h>
 #include <syslog.h>
-#include <time.h>
+#include <sys/time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
diff -ruN ax25-tools-0.0.8/hdlcutil/hdrvcomm.c ax25-tools-0.0.8.orig/hdlcutil/hdrvcomm.c
--- ax25-tools-0.0.8/hdlcutil/hdrvcomm.c	2004-12-11 19:25:19.690229535 +0100
+++ ax25-tools-0.0.8.orig/hdlcutil/hdrvcomm.c	2004-12-11 19:24:56.425922363 +0100
@@ -48,14 +48,7 @@
 #include "hdrvcomm.h"
 #include "usersmdiag.h"
 #include <net/if_arp.h>
-
-#ifdef __GLIBC__
-#include <net/ethernet.h>
-#else
 #include <linux/if_ether.h>
-#endif
-#include <netinet/in.h>
-
 #include <linux/if_packet.h>
 #ifndef SOL_PACKET
 #define SOL_PACKET  263
diff -ruN ax25-tools-0.0.8/hdlcutil/hdrvcomm.h ax25-tools-0.0.8.orig/hdlcutil/hdrvcomm.h
--- ax25-tools-0.0.8/hdlcutil/hdrvcomm.h	2004-12-11 19:25:09.318646812 +0100
+++ ax25-tools-0.0.8.orig/hdlcutil/hdrvcomm.h	2004-12-11 19:24:56.425922363 +0100
@@ -42,7 +42,7 @@
 
 #ifdef HDRVC_KERNEL
 #include <linux/hdlcdrv.h>
-#include "soundmodem.h"
+#include <linux/soundmodem.h>
 #include <linux/baycom.h>
 #endif /* HDRVC_KERNEL */
 
diff -ruN ax25-tools-0.0.8/hdlcutil/soundmodem.h ax25-tools-0.0.8.orig/hdlcutil/soundmodem.h
--- ax25-tools-0.0.8/hdlcutil/soundmodem.h	2004-12-11 19:25:09.326647261 +0100
+++ ax25-tools-0.0.8.orig/hdlcutil/soundmodem.h	1970-01-01 01:00:00.000000000 +0100
@@ -1,90 +0,0 @@
-/*
- * The Linux soundcard driver for 1200 baud and 9600 baud packet radio
- * (C) 1996-1998 by Thomas Sailer, HB9JNX/AE4WA
- */
-
-#ifndef _SOUNDMODEM_H
-#define _SOUNDMODEM_H
-
-/* -------------------------------------------------------------------- */
-/*
- * structs for the IOCTL commands
- */
-
-struct sm_debug_data {
-	unsigned int int_rate;
-	unsigned int mod_cycles;
-	unsigned int demod_cycles;
-	unsigned int dma_residue;
-};
-
-struct sm_diag_data {
-	unsigned int mode;
-	unsigned int flags;
-	unsigned int samplesperbit;
-	unsigned int datalen;
-	short *data;
-};
-
-struct sm_mixer_data {
-	unsigned int mixer_type;
-	unsigned int sample_rate;
-	unsigned int bit_rate;
-	unsigned int reg;
-	unsigned int data;
-};
-
-struct sm_config {
-	int hardware;
-	int mode;
-};
-
-struct sm_ioctl {
-	int cmd;
-	union {
-		struct sm_config cfg;
-		struct sm_diag_data diag;	
-		struct sm_mixer_data mix;
-		struct sm_debug_data dbg;
-	} data;
-};
-
-/* -------------------------------------------------------------------- */
-
-/*
- * diagnose modes
- */
-#define SM_DIAGMODE_OFF            0
-#define SM_DIAGMODE_INPUT          1
-#define SM_DIAGMODE_DEMOD          2
-#define SM_DIAGMODE_CONSTELLATION  3
-
-/*
- * diagnose flags
- */
-#define SM_DIAGFLAG_DCDGATE    (1<<0)
-#define SM_DIAGFLAG_VALID      (1<<1)
-
-/*
- * mixer types
- */
-#define SM_MIXER_INVALID       0
-#define SM_MIXER_AD1848        0x10
-#define SM_MIXER_CRYSTAL       0x11
-#define SM_MIXER_CT1335        0x20
-#define SM_MIXER_CT1345        0x21
-#define SM_MIXER_CT1745        0x22
-
-/*
- * ioctl values
- */
-#define SMCTL_DIAGNOSE         0x82
-#define SMCTL_GETMIXER         0x83
-#define SMCTL_SETMIXER         0x84
-#define SMCTL_GETDEBUG         0x85
-
-/* -------------------------------------------------------------------- */
-
-#endif /* _SOUNDMODEM_H */
-
-/* --------------------------------------------------------------------- */
diff -ruN ax25-tools-0.0.8/kiss/net2kiss.c ax25-tools-0.0.8.orig/kiss/net2kiss.c
--- ax25-tools-0.0.8/kiss/net2kiss.c	2004-12-11 19:25:19.699230041 +0100
+++ ax25-tools-0.0.8.orig/kiss/net2kiss.c	2004-12-11 19:24:56.433922812 +0100
@@ -49,8 +49,6 @@
 #include <sys/socket.h>
 #include <net/if.h>
 
-#include <netinet/in.h>
-
 #ifdef __GLIBC__
 #include <net/ethernet.h>
 #else

--------------090803030503010106090103--
