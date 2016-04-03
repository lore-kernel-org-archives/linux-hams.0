From: Guido Trentalancia <iz6rdb@trentalancia.net>
Subject: Soundmodem patch for AFSK operation a low bit-rates (1/2)
Date: Sun, 03 Apr 2016 18:03:24 +0200
Message-ID: <1459699404.8591.23.camel@trentalancia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hello.

Here is the latest version of a set of two patches for the soundmodem
application that I have created to fix AFSK operation at bit-rates
lower than 1200 baud (e.g. 300 baud for HF packet radio or APRS).

Patch 1/2 follows:

This patch modifies the AFSK modulator in version 0.16 of the soundmode=
m
application as it appears to be problematic, in particular at 300 baud
(in general, it might be buggy for bitrates slower than 1200 baud,
although proper testing has not been carried out at other bitrates).

In other words, this patch should fix the AFSK modulator for the proble=
m
reported, for example, here:

- http://he.fi/archive/linux-hams/200608/0005.html
- http://marc.info/?l=3Dlinux-hams&m=3D129059468102018&w=3D2

This patch also introduces optional windowing functions (other than the
Hamming one) for experimentation, but at the moment they are completely
untested and they can only be selected during compilation. Finally, thi=
s
patch introduces tone filters at the receiver.

After applying this patch, the AFSK modulator should work normally at 3=
00
baud (or in general at bitrates less than 1200 baud) and the user shoul=
d
be able to select any value for the AFSK tone frequencies. Similar fixe=
s
are also introduced by this patch for the AFSK demodulator although, fo=
r
successful reception at 300 baud, longer RX filters might be needed.

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.net>
---
=A0afsk/modem.c |=A0=A0284 ++++++++++++++++++++++++++++++++++++++++++++=
+-------------------
=A01 file changed, 201 insertions(+), 83 deletions(-)

--- soundmodem-0.16-orig/afsk/modem.c	2004-04-13 17:44:40.000000000 +02=
00
+++ soundmodem-0.16/afsk/modem.c	2016-02-05 15:41:36.282279870 +0100
@@ -6,6 +6,9 @@
=A0 *=A0=A0=A0=A0=A0=A0Copyright (C) 1998-2000, 2003
=A0 *=A0=A0=A0=A0=A0=A0=A0=A0Thomas Sailer <t.sailer@alumni.ethz.ch>
=A0 *
+ *=A0=A0=A0=A0=A0=A0Copyright (C) 2012, 2016
+ *=A0=A0=A0=A0=A0=A0=A0=A0Guido Trentalancia <iz6rdb@trentalancia.net>
+ *
=A0 *=A0=A0=A0=A0=A0=A0This program is free software; you can redistrib=
ute it and/or modify
=A0 *=A0=A0=A0=A0=A0=A0it under the terms of the GNU General Public Lic=
ense as published by
=A0 *=A0=A0=A0=A0=A0=A0the Free Software Foundation; either version 2 o=
f the License, or
@@ -32,11 +35,85 @@
=A0#include "modem.h"
=A0#include "costab.h"
=A0
+#define max(a, b) (((a) > (b)) ? (a) : (b))
+
+/* Rx FIR Filter parameters */
+
+/*
+ * Rx FIR Filter length is normally equal
+ * to 16. Longer filters require more CPU.
+ */
+#define RXFILTLEN=A0=A0=A0=A0=A0=A0=A016
+
+#define RXFILTOVERBITS	3
+
+#define RXFILTOVER=A0=A0=A0=A0=A0=A0(1<<(RXFILTOVERBITS))
+#define RXFILTFIDX(x)=A0=A0=A0(((x)>>(16-(RXFILTOVERBITS)))&(RXFILTOVE=
R-1))
+#define RXFILTFSAMP(x)=A0=A0((x)>>16)
+
=A0/* -----------------------------------------------------------------=
---- */
=A0
+/*
+ * IZ6RDB 10/01/2016
+ * Force the use of a minimum value for the sampling
+ * rate, because otherwise some sound cards might=A0
+ * not work properly, when using the old OSS (i.e.
+ * "soundcard") driver and bitrates slower than 1200
+ * baud (such as 300 baud for HF).
+ *
+ * The Alsa driver does not suffer this limitation
+ * and should be preferred.
+ *
+ * Higher values require more CPU time.
+ *
+ * The recommended minimum value is 11025 Hz for most
+ * sound cards.
+ */
+#define MINIMUM_SAMPLERATE	11025
+
+/*
+ * IZ6RDB 01/03/2012: define different possible
+ * window types for the FIR filters and choose
+ * one of the available types:
+ * - NONE (minimum transition width)
+ * - HAMMING (window used up to version 0.16)
+ * - HANNING (low transition width)
+ * - BLACKMAN (maximum stopband attenuation)
+ */
+#define	NONE		0
+#define	HAMMING		1
+#define	HANNING		2
+#define	BLACKMAN	3
+
+#define	FIR_WINDOW	HAMMING
+
+/* -------------------------------------------------------------------=
-- */
+
+#ifdef FIR_WINDOW
+#if (FIR_WINDOW =3D=3D NONE)
+#define WINDOW_FUNCTION(x)	no_window(x)
+#define TRANSITION_WIDTH_CONST	0.92
+#elif (FIR_WINDOW =3D=3D HAMMING)
+#define WINDOW_FUNCTION(x)	hamming_window(x)
+#define TRANSITION_WIDTH_CONST	3.32
+#elif (FIR_WINDOW =3D=3D HANNING)
+#define WINDOW_FUNCTION(x)	hanning_window(x)
+#define TRANSITION_WIDTH_CONST	3.11
+#elif (FIR_WINDOW =3D=3D BLACKMAN)
+#define WINDOW_FUNCTION(x)	blackman_window(x)
+#define TRANSITION_WIDTH_CONST	5.565
+#else
+#error "A valid FIR Window must be selected !"
+#endif
+#else // default to Hamming window
+#define WINDOW_FUNCTION(x)	hamming_window(x)
+#define TRANSITION_WIDTH_CONST	3.32
+#endif
+
=A0struct modstate {
=A0	struct modemchannel *chan;
-	unsigned int bps, f0, f1, notdiff, maxbitlen;
+	unsigned int samplerate;
+	unsigned int bps, f0, f1, notdiff;
=A0	unsigned int bitinc, bitph;
=A0	unsigned int dds, ddsinc[2];
=A0	unsigned int bit;
@@ -53,7 +130,10 @@ static const struct modemparams modparam
=A0static void *modconfig(struct modemchannel *chan, unsigned int *samp=
lerate, const char *params[])
=A0{
=A0	struct modstate *s;
-=09
+	unsigned int freq;
+	unsigned int required_samplerate;
+	unsigned int f_carrier, df;
+
=A0	if (!(s =3D malloc(sizeof(struct modstate))))
=A0		logprintf(MLOG_FATAL, "out of memory\n");
=A0	s->chan =3D chan;
@@ -63,22 +143,36 @@ static void *modconfig(struct modemchann
=A0			s->bps =3D 100;
=A0		if (s->bps > 9600)
=A0			s->bps=3D 9600;
-	} else
-		s->bps =3D 1200;
-	if (params[1]) {
+	}
+	if (params[1])
=A0		s->f0 =3D strtoul(params[1], NULL, 0);
-		if (s->f0 > s->bps * 4)
-			s->f0 =3D s->bps * 4;
-	} else
-		s->f0 =3D 1200;
-	if (params[2]) {
+	if (params[2])
=A0		s->f1 =3D strtoul(params[2], NULL, 0);
-		if (s->f1 > s->bps * 4)
-			s->f1 =3D s->bps * 4;
-	} else
-		s->f1 =3D 2200;
=A0	s->notdiff =3D params[3] ? !strtoul(params[3], NULL, 0) : 0;
-	*samplerate =3D 8 * s->bps;
+
+	/* Swap symbol frequencies, if necessary */
+	if (s->f0 > s->f1) {
+		freq =3D s->f0;
+		s->f0 =3D s->f1;
+		s->f1 =3D freq;
+	}
+
+	/* Calculate the (audio) carrier frequency */
+	f_carrier =3D (s->f0 + s->f1)/2;
+
+	/* Calculate symbol spacing */
+	df =3D abs(s->f1 - s->f0);
+
+	/* Nyquist criteria (minimum sampling rate) */
+	required_samplerate =3D 2 * f_carrier + df + 2 * s->bps;
+
+	/*
+	=A0* Make sure that the sampling rate is at least
+	=A0* equal to the minimum recommended value.
+	=A0*/
+	*samplerate =3D max(required_samplerate, MINIMUM_SAMPLERATE);
+	s->samplerate =3D *samplerate;
+
=A0	return s;
=A0}
=A0
@@ -86,16 +180,18 @@ static void modinit(void *state, unsigne
=A0{
=A0	struct modstate *s =3D (struct modstate *)state;
=A0
-	s->maxbitlen =3D (samplerate + s->bps - 1) / s->bps;
=A0	s->bitinc =3D (s->bps << 16) / samplerate;
=A0	s->ddsinc[0] =3D (s->f0 << 16) / samplerate;
=A0	s->ddsinc[1] =3D (s->f1 << 16) / samplerate;
=A0	s->bit =3D 0;
+	s->dds =3D 0;
+	s->bitph =3D 0;
=A0}
=A0
=A0static void modsendbits(struct modstate *s, unsigned int bits, unsig=
ned int nrsyms)
=A0{
-=A0=A0=A0=A0=A0=A0=A0=A0int16_t sbuf[512];
+=A0=A0=A0=A0=A0=A0=A0=A0unsigned int bufsize =3D ((s->samplerate*512)/=
48000)%2 =3D=3D 0 ? ((s->samplerate*512)/48000) : ((s->samplerate*512)/=
48000) + 1;
+=A0=A0=A0=A0=A0=A0=A0=A0int16_t sbuf[bufsize];
=A0=A0=A0=A0=A0=A0=A0=A0=A0int16_t *sptr =3D sbuf, *eptr =3D sbuf + siz=
eof(sbuf)/sizeof(sbuf[0]);
=A0
=A0=A0=A0=A0=A0=A0=A0=A0=A0while (nrsyms > 0) {
@@ -145,20 +241,9 @@ struct modulator afskmodulator =3D {
=A0
=A0/* -----------------------------------------------------------------=
---- */
=A0
-#define max(a, b) (((a) > (b)) ? (a) : (b))
-
-/* RxFilter */
-#define WINDOWEXPAND=A0=A01.5
-#define RXFILTLEN=A0=A0=A0=A0=A0=A0=A016
-#define RXFILTOVERBITS=A0=A0=A03
-#define RXFILTOVER=A0=A0=A0=A0=A0=A0(1<<(RXFILTOVERBITS))
-#define RXFILTFIDX(x)=A0=A0=A0(((x)>>(16-(RXFILTOVERBITS)))&(RXFILTOVE=
R-1))
-#define RXFILTFSAMP(x)=A0=A0((x)>>16)
-
=A0struct demodstate {
=A0	struct modemchannel *chan;
=A0	unsigned int bps, f0, f1, notdiff, firlen;
-=A0=A0=A0=A0=A0=A0=A0=A0unsigned int srate;
=A0=A0=A0=A0=A0=A0=A0=A0=A0unsigned int rxbits;
=A0=A0=A0=A0=A0=A0=A0=A0=A0unsigned int rxphase;
=A0=A0=A0=A0=A0=A0=A0=A0=A0unsigned int rxphinc;
@@ -201,40 +286,50 @@ static const struct modemparams demodpar
=A0
=A0static void *demodconfig(struct modemchannel *chan, unsigned int *sa=
mplerate, const char *params[])
=A0{
-	struct demodstate *s;
-	unsigned int f;
+=A0=A0=A0=A0=A0=A0=A0=A0struct demodstate *s;
+=A0=A0=A0=A0=A0=A0=A0=A0unsigned int freq;
+=A0=A0=A0=A0=A0=A0=A0=A0unsigned int required_samplerate;
+=A0=A0=A0=A0=A0=A0=A0=A0unsigned int f_carrier, df;
+
+=A0=A0=A0=A0=A0=A0=A0=A0if (!(s =3D malloc(sizeof(struct demodstate)))=
)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0logprintf(MLOG_FATAL, =
"out of memory\n");
+=A0=A0=A0=A0=A0=A0=A0=A0s->chan =3D chan;
+=A0=A0=A0=A0=A0=A0=A0=A0if (params[0]) {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s->bps =3D strtoul(par=
ams[0], NULL, 0);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (s->bps < 100)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
s->bps =3D 100;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (s->bps > 9600)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
s->bps=3D 9600;
+=A0=A0=A0=A0=A0=A0=A0=A0}
+=A0=A0=A0=A0=A0=A0=A0=A0if (params[1])
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s->f0 =3D strtoul(para=
ms[1], NULL, 0);
+=A0=A0=A0=A0=A0=A0=A0=A0if (params[2])
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s->f1 =3D strtoul(para=
ms[2], NULL, 0);
+=A0=A0=A0=A0=A0=A0=A0=A0s->notdiff =3D params[3] ? !strtoul(params[3],=
 NULL, 0) : 0;
+
+=A0=A0=A0=A0=A0=A0=A0=A0/* Swap symbol frequencies, if necessary */
+=A0=A0=A0=A0=A0=A0=A0=A0if (s->f0 > s->f1) {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0freq =3D s->f0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s->f0 =3D s->f1;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0s->f1 =3D freq;
+=A0=A0=A0=A0=A0=A0=A0=A0}
=A0
-	if (!(s =3D malloc(sizeof(struct demodstate))))
-		logprintf(MLOG_FATAL, "out of memory\n");
-	s->chan =3D chan;
-	if (params[0]) {
-		s->bps =3D strtoul(params[0], NULL, 0);
-		if (s->bps < 100)
-			s->bps =3D 100;
-		if (s->bps > 9600)
-			s->bps=3D 9600;
-	} else
-		s->bps =3D 1200;
-	if (params[1]) {
-		s->f0 =3D strtoul(params[1], NULL, 0);
-		if (s->f0 > s->bps * 4)
-			s->f0 =3D s->bps * 4;
-	} else
-		s->f0 =3D 1200;
-	if (params[2]) {
-		s->f1 =3D strtoul(params[2], NULL, 0);
-		if (s->f1 > s->bps * 4)
-			s->f1 =3D s->bps * 4;
-	} else
-		s->f1 =3D 2200;
-	s->notdiff =3D params[3] ? !strtoul(params[3], NULL, 0) : 0;
-	f =3D s->f0;
-	if (s->f1 > f)
-		f =3D s->f1;
-	f +=3D s->bps/2;
-	f =3D (2*f) + (f >> 1);
-	*samplerate =3D f;
-	return s;
+=A0=A0=A0=A0=A0=A0=A0=A0/* Calculate the (audio) carrier frequency */
+=A0=A0=A0=A0=A0=A0=A0=A0f_carrier =3D (s->f0 + s->f1)/2;
+
+=A0=A0=A0=A0=A0=A0=A0=A0/* Calculate symbol spacing */
+=A0=A0=A0=A0=A0=A0=A0=A0df =3D abs(s->f1 - s->f0);
+
+=A0=A0=A0=A0=A0=A0=A0=A0/* Nyquist criteria (minimum sampling rate) */
+=A0=A0=A0=A0=A0=A0=A0=A0required_samplerate =3D 2 * f_carrier + df + 2=
 * s->bps;
+
+=A0=A0=A0=A0=A0=A0=A0=A0/*
+=A0=A0=A0=A0=A0=A0=A0=A0=A0* Make sure that the sampling rate is at le=
ast
+=A0=A0=A0=A0=A0=A0=A0=A0=A0* equal to the minimum recommended value.
+=A0=A0=A0=A0=A0=A0=A0=A0=A0*/
+=A0=A0=A0=A0=A0=A0=A0=A0*samplerate =3D max(required_samplerate, MINIM=
UM_SAMPLERATE);
+
+=A0=A0=A0=A0=A0=A0=A0=A0return s;
=A0}
=A0
=A0static int demfilter(struct demodstate *state, const int16_t *val, u=
nsigned int phase)
@@ -317,7 +412,6 @@ static void demod8bits(struct demodstate
=A0=A0=A0=A0=A0=A0=A0=A0=A0s->rxphase +=3D phase;
=A0}
=A0
-
=A0static void demoddemodulate(void *state)
=A0{
=A0	struct demodstate *s =3D (struct demodstate *)state;
@@ -355,18 +449,28 @@ static void demoddemodulate(void *state)
=A0=A0=A0=A0=A0=A0=A0=A0=A0}
=A0}
=A0
-static inline double sinc(double x)
+/*
+ * The Hamming window was the only window
+ * available in the original version.
+ */
+static inline double no_window(double x)
+{
+	return 1;
+}
+
+static inline double hamming_window(double x)
=A0{
-=A0=A0=A0=A0=A0=A0=A0=A0double arg =3D x * M_PI;
+=A0=A0=A0=A0=A0=A0=A0=A0return 0.54+0.46*cos((2*M_PI)*x);
+}
=A0
-=A0=A0=A0=A0=A0=A0=A0=A0if (arg =3D=3D 0)
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 1;
-=A0=A0=A0=A0=A0=A0=A0=A0return sin(arg) / arg;
+static inline double hanning_window(double x)
+{
+=A0=A0=A0=A0=A0=A0=A0=A0return 0.5+0.5*cos((2*M_PI)*x);
=A0}
=A0
-static inline double hamming(double x)
+static inline double blackman_window(double x)
=A0{
-=A0=A0=A0=A0=A0=A0=A0=A0return 0.54-0.46*cos((2*M_PI)*x);
+=A0=A0=A0=A0=A0=A0=A0=A0return 0.42+0.5*cos((2*M_PI)*x)+0.08*cos((4*M_=
PI)*x);
=A0}
=A0
=A0static void demodinit(void *state, unsigned int samplerate, unsigned=
 int *bitrate)
@@ -376,24 +480,39 @@ static void demodinit(void *state, unsig
=A0=A0=A0=A0=A0=A0=A0=A0=A0float f0i[RXFILTLEN*RXFILTOVER];
=A0=A0=A0=A0=A0=A0=A0=A0=A0float f1r[RXFILTLEN*RXFILTOVER];
=A0=A0=A0=A0=A0=A0=A0=A0=A0float f1i[RXFILTLEN*RXFILTOVER];
-=A0=A0=A0=A0=A0=A0=A0=A0double ph0, ph1, w, tscale;
+=A0=A0=A0=A0=A0=A0=A0=A0double ph0, ph1, w;
+=A0=A0=A0=A0=A0=A0=A0=A0float index, scaled_index;
=A0=A0=A0=A0=A0=A0=A0=A0=A0float max, max0, max1, max2, max3;
=A0=A0=A0=A0=A0=A0=A0=A0=A0unsigned int i, j;
=A0
-	tscale =3D (float)s->bps / (float)samplerate / RXFILTOVER / WINDOWEXP=
AND;
-=A0=A0=A0=A0=A0=A0=A0=A0ph0 =3D 2.0 * M_PI * (float)s->f0 / (float)sam=
plerate / RXFILTOVER;
-=A0=A0=A0=A0=A0=A0=A0=A0ph1 =3D 2.0 * M_PI * (float)s->f1 / (float)sam=
plerate / RXFILTOVER;
+=A0=A0=A0=A0=A0=A0=A0=A0ph0 =3D 2.0 * M_PI * (float)s->f0 / (float)sam=
plerate;
+=A0=A0=A0=A0=A0=A0=A0=A0ph1 =3D 2.0 * M_PI * (float)s->f1 / (float)sam=
plerate;
=A0=A0=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < RXFILTLEN * RXFILTOVER; i+=
+) {
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0w =3D i * tscale;
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (w > 1)
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
w =3D 0;
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0else
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
w =3D hamming(w);
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f0r[i] =3D w * cos(ph0=
 * i);
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f0i[i] =3D w * sin(ph0=
 * i);
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f1r[i] =3D w * cos(ph1=
 * i);
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f1i[i] =3D w * sin(ph1=
 * i);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0index =3D i - (RXFILTL=
EN * RXFILTOVER)/2.0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0scaled_index =3D index=
 / RXFILTOVER;
+
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0w =3D WINDOW_FUNCTION(=
scaled_index / RXFILTLEN);
+
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (index =3D=3D 0) {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f0r[i] =3D w * cos(ph0 * scaled_index) * s->bps / samplerate;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f0i[i] =3D w * sin(ph0 * scaled_index) * s->bps / samplerate;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f1r[i] =3D w * cos(ph1 * scaled_index) * s->bps / samplerate;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f1i[i] =3D w * sin(ph1 * scaled_index) * s->bps / samplerate;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0} else {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f0r[i] =3D w * cos(ph0 * scaled_index) * sin(M_PI * scaled_index * s->b=
ps / samplerate) / M_PI / scaled_index;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f0i[i] =3D w * sin(ph0 * scaled_index) * sin(M_PI * scaled_index * s->b=
ps / samplerate) / M_PI / scaled_index;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f1r[i] =3D w * cos(ph1 * scaled_index) * sin(M_PI * scaled_index * s->b=
ps / samplerate) / M_PI / scaled_index;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
f1i[i] =3D w * sin(ph1 * scaled_index) * sin(M_PI * scaled_index * s->b=
ps / samplerate) / M_PI / scaled_index;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
+=A0=A0=A0=A0=A0=A0=A0=A0}
+
+=A0=A0=A0=A0=A0=A0=A0=A0if (RXFILTLEN % 2 =3D=3D 0) {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f0r[0] =3D 0.0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f0i[0] =3D 0.0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f1r[0] =3D 0.0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f1i[0] =3D 0.0;
=A0=A0=A0=A0=A0=A0=A0=A0=A0}
+
=A0=A0=A0=A0=A0=A0=A0=A0=A0/* determine maximum */
=A0=A0=A0=A0=A0=A0=A0=A0=A0max =3D 0;
=A0=A0=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < RXFILTOVER; i++) {
@@ -427,7 +546,6 @@ static void demodinit(void *state, unsig
=A0			s->f.f32.f1r[RXFILTOVER-1-i][j] =3D f1r[j*RXFILTOVER+i];
=A0			s->f.f32.f1i[RXFILTOVER-1-i][j] =3D f1i[j*RXFILTOVER+i];
=A0		}
-=A0=A0=A0=A0=A0=A0=A0=A0s->srate =3D samplerate;
=A0=A0=A0=A0=A0=A0=A0=A0=A0s->rxphinc =3D ((samplerate << 16) + s->bps =
/ 2) / s->bps;
=A0	*bitrate =3D s->bps;
=A0}
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
