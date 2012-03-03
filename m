From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: soundmodem 0.16: fix the AFSK modulator for 300 baud operation
 (was: RE: 300bps Packet)
Date: Sat, 03 Mar 2012 19:48:57 +0100
Message-ID: <1330800537.2224.11.camel@vortex>
References: <1330736067.25864.15.camel@vortex> <4F51E964.9080605@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4F51E964.9080605@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wharms@bfs.de
Cc: linux-hams@vger.kernel.org, t.sailer@alumni.ethz.ch

Summing things up...

I am now doing perfectly well both modulation and demodulation with the
combination of the following two patches.

This [1/2] patch modifies the AFSK modulator in version 0.16 of the
soundmodem application as it appears to be problematic in particular at
300 baud (in general, it might be buggy for bitrates lower than 1200
baud, although I have not done any testing at other bitrates).

In other words, this patch should fix the AFSK modulator for the problem
reported, for example, here:

- http://he.fi/archive/linux-hams/200608/0005.html
- http://marc.info/?l=linux-hams&m=129059468102018&w=2

I have also introduced optional windowing functions (other than the
Hamming one) for experimentation but at the moment they are completely
untested and they can only be selected during compilation.

After applying this patch, the AFSK modulator should work normally for
300 baud (or in general bitrates different/less than 1200 baud) and the
user should be able to select any AFSK tone frequencies from the
configuration file. Similar fixes are also introduced by this patch for
the AFSK demodulator, although for successful reception at 300 baud it
might also need longer RX filters that are eventually more robust
against overflows.

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.com>
---
 afsk/modem.c |  230 +++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 193 insertions(+), 37 deletions(-)

--- soundmodem-0.16-orig/afsk/modem.c	2012-02-29 20:31:24.356287000 +0100
+++ soundmodem-0.16/afsk/modem.c	2012-03-03 19:14:07.696345582 +0100
@@ -32,8 +32,71 @@
 #include "modem.h"
 #include "costab.h"
 
+/*
+ * IZ6RDB 29/02/2012: always use a minimum samplerate
+ * otherwise some sound cards, might not work well
+ * especially at bitrates lower than 1200 baud (such
+ * as 300 baud for HF).
+ *
+ * The value is defined in Hz and it should never be
+ * less than 9600 Hz to avoid problems, although the
+ * recommended value is 11025 Hz for most soundcards.
+ *
+ * Some cards, might even require that only their
+ * maximum allowed sampling rate of 48kHz is used
+ * (for example, according to online reports some
+ * embedded SiS 701x AC'97 controllers).
+ */
+#define MINIMUM_SAMPLERATE	11025
+
+/*
+ * IZ6RDB 01/03/2012: define different possible
+ * window types for the FIR filters and choose
+ * one of the available types:
+ * - NONE
+ * - HAMMING (window used up to version 0.16)
+ * - HANNING
+ * - BLACKMAN
+ * - WELCH (for weak signals)
+ */
+#define FIR_WINDOW	HAMMING
+
+/*
+ * IZ6RDB 01/03/2012: introduce a parameter
+ * called "bandwidth expansion factor", which
+ * is a real positive number slightly greater
+ * than unity (up to 2.0) that accounts for
+ * guard-bands and non-ideal filtering.
+ *
+ * This value is only used for estimating the
+ * required sampling rate.
+ *
+ * Values are usually between 1.125 and 1.4.
+ *
+ * The recommended value is 1.36.
+ */
+#define BANDWIDTH_EXPANSION_FACTOR	1.36
+
 /* --------------------------------------------------------------------- */
 
+#ifdef FIR_WINDOW
+#if (FIR_WINDOW == NONE)
+#define WINDOW_FUNCTION(x)	no_window(x)
+#elif (FIR_WINDOW == HAMMING)
+#define WINDOW_FUNCTION(x)	hamming_window(x)
+#elif (FIR_WINDOW == HANNING)
+#define WINDOW_FUNCTION(x)	hanning_window(x)
+#elif (FIR_WINDOW == BLACKMAN)
+#define WINDOW_FUNCTION(x)	blackman_window(x)
+#elif (FIR_WINDOW == WELCH)
+#define WINDOW_FUNCTION(x)	welch_window(x)
+#else
+#error "A valid FIR Window must be selected !"
+#endif
+#else // default to Hamming window
+#define WINDOW_FUNCTION(x)	hamming_window(x)
+#endif
+
 struct modstate {
 	struct modemchannel *chan;
 	unsigned int bps, f0, f1, notdiff, maxbitlen;
@@ -53,6 +116,9 @@ static const struct modemparams modparam
 static void *modconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
 {
 	struct modstate *s;
+	unsigned int bandwidth, expanded_bandwidth;
+	unsigned int min_samplerate, optimized_samplerate;
+	unsigned int f_carrier;
 	
 	if (!(s = malloc(sizeof(struct modstate))))
 		logprintf(MLOG_FATAL, "out of memory\n");
@@ -63,22 +129,45 @@ static void *modconfig(struct modemchann
 			s->bps = 100;
 		if (s->bps > 9600)
 			s->bps= 9600;
-	} else
-		s->bps = 1200;
-	if (params[1]) {
+	}
+	if (params[1])
 		s->f0 = strtoul(params[1], NULL, 0);
-		if (s->f0 > s->bps * 4)
-			s->f0 = s->bps * 4;
-	} else
-		s->f0 = 1200;
-	if (params[2]) {
+	if (params[2])
 		s->f1 = strtoul(params[2], NULL, 0);
-		if (s->f1 > s->bps * 4)
-			s->f1 = s->bps * 4;
-	} else
-		s->f1 = 2200;
 	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
-	*samplerate = 8 * s->bps;
+
+	/*
+	 * Calculate the bandwidth of the baseband (audio) signal:
+	 * basically this is the highest frequency of the two
+	 * possible tones.
+	 */
+	bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
+
+	/*
+	 * Calculate the expanded bandwidth (with guard-bands)
+	 * to get a better estimate.
+	 */
+	expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
+
+	/* Nyquist criteria (minimum sampling rate) */
+	min_samplerate = 2 * expanded_bandwidth;
+
+	/* Calculate the (audio) carrier frequency */
+	f_carrier = (s->f0 + s->f1)/2;
+
+	/* Calculate intermediate operating point sampling rate */
+	optimized_samplerate = 4 * f_carrier;
+	if (optimized_samplerate > min_samplerate)
+		min_samplerate = optimized_samplerate;
+
+	/*
+	 * Make sure that the minimum recommended sampling
+	 * rate for the soundcard is exceeded.
+	 */
+	if (min_samplerate < MINIMUM_SAMPLERATE)
+		min_samplerate = MINIMUM_SAMPLERATE;
+
+	*samplerate = min_samplerate;
 	return s;
 }
 
@@ -147,10 +236,28 @@ struct modulator afskmodulator = {
 
 #define max(a, b) (((a) > (b)) ? (a) : (b))
 
-/* RxFilter */
+/* Rx FIR Filter parameters */
+
+/*
+ * Rx FIR Filter window expansion parameter
+ * is normally equal to 1.5.
+ */
 #define WINDOWEXPAND  1.5
+
+/*
+ * Rx FIR Filter length is normally equal
+ * to 16.
+ */
 #define RXFILTLEN       16
-#define RXFILTOVERBITS   3
+
+/*
+ * Rx FIR Filter length is normally equal
+ * to 16. This parameter should represent
+ * the minimum wordlength to avoid
+ * overflow.
+ */
+#define RXFILTOVERBITS	3
+
 #define RXFILTOVER      (1<<(RXFILTOVERBITS))
 #define RXFILTFIDX(x)   (((x)>>(16-(RXFILTOVERBITS)))&(RXFILTOVER-1))
 #define RXFILTFSAMP(x)  ((x)>>16)
@@ -202,7 +309,9 @@ static const struct modemparams demodpar
 static void *demodconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
 {
 	struct demodstate *s;
-	unsigned int f;
+	unsigned int bandwidth, expanded_bandwidth;
+	unsigned int min_samplerate, optimized_samplerate;
+	unsigned int f_carrier;
 
 	if (!(s = malloc(sizeof(struct demodstate))))
 		logprintf(MLOG_FATAL, "out of memory\n");
@@ -213,27 +322,45 @@ static void *demodconfig(struct modemcha
 			s->bps = 100;
 		if (s->bps > 9600)
 			s->bps= 9600;
-	} else
-		s->bps = 1200;
-	if (params[1]) {
+	}
+	if (params[1])
 		s->f0 = strtoul(params[1], NULL, 0);
-		if (s->f0 > s->bps * 4)
-			s->f0 = s->bps * 4;
-	} else
-		s->f0 = 1200;
-	if (params[2]) {
+	if (params[2])
 		s->f1 = strtoul(params[2], NULL, 0);
-		if (s->f1 > s->bps * 4)
-			s->f1 = s->bps * 4;
-	} else
-		s->f1 = 2200;
 	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
-	f = s->f0;
-	if (s->f1 > f)
-		f = s->f1;
-	f += s->bps/2;
-	f = (2*f) + (f >> 1);
-	*samplerate = f;
+
+        /*
+         * Calculate the bandwidth of the baseband (audio) signal:
+         * basically this is the highest frequency of the two
+         * possible tones.
+         */
+        bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
+
+	/*
+	 * Calculate the expanded bandwidth (with guard-bands)
+	 * to get a better estimate.
+	 */
+        expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
+
+        /* Nyquist criteria (minimum sampling rate) */
+        min_samplerate = 2 * expanded_bandwidth;
+
+	/* Calculate the (audio) carrier frequency */
+	f_carrier = (s->f0 + s->f1)/2;
+
+	/* Calculate intermediate operating point sampling rate */
+	optimized_samplerate = 4 * f_carrier;
+	if (optimized_samplerate > min_samplerate)
+		min_samplerate = optimized_samplerate;
+
+	/*
+	 * Make sure that the minimum recommended sampling
+	 * rate for the soundcard is exceeded.
+	 */
+	if (min_samplerate < MINIMUM_SAMPLERATE)
+		min_samplerate = MINIMUM_SAMPLERATE;
+
+	*samplerate = min_samplerate;
 	return s;
 }
 
@@ -317,7 +444,6 @@ static void demod8bits(struct demodstate
         s->rxphase += phase;
 }
 
-
 static void demoddemodulate(void *state)
 {
 	struct demodstate *s = (struct demodstate *)state;
@@ -364,11 +490,41 @@ static inline double sinc(double x)
         return sin(arg) / arg;
 }
 
-static inline double hamming(double x)
+/*
+ * The Hamming window is the original one (used
+ * exclusively up to version 0.16).
+ * From version 0.17 optional windows different
+ * from the Hamming window have been introduced,
+ * so that they can be changed and tested in
+ * order to try achieving reduced passband
+ * ripples at the expense of slower passband to
+ * stopband roll-off.
+ */
+static inline double no_window(double x)
+{
+	return 1;
+}
+
+static inline double hamming_window(double x)
 {
         return 0.54-0.46*cos((2*M_PI)*x);
 }
 
+static inline double hanning_window(double x)
+{
+        return 0.5-0.5*cos((2*M_PI)*x);
+}
+
+static inline double blackman_window(double x)
+{
+        return 0.42-0.5*cos((2*M_PI)*x)+0.08*cos((4*M_PI)*x);
+}
+
+static inline double welch_window(double x)
+{
+	return 1.0-pow((2*x-1),2);
+}
+
 static void demodinit(void *state, unsigned int samplerate, unsigned int *bitrate)
 {
 	struct demodstate *s = (struct demodstate *)state;
@@ -388,7 +544,7 @@ static void demodinit(void *state, unsig
                 if (w > 1)
                         w = 0;
                 else
-                        w = hamming(w);
+			w = WINDOW_FUNCTION(w);
                 f0r[i] = w * cos(ph0 * i);
                 f0i[i] = w * sin(ph0 * i);
                 f1r[i] = w * cos(ph1 * i);

This [2/2] patch might be useful for successful reception at 300 baud.

It uses longer RX filters and it also makes them supposedly more
robust against overflows.

It hasn't been extensively tested and setups are all different,
but it has helped me considerably in using soundmodem at 300 baud.

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.com>
---
 afsk/modem.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- soundmodem-0.16-fix-samplerate/afsk/modem.c	2012-03-03 19:14:53.748535161 +0100
+++ soundmodem-0.16-fix-samplerate-and-rxfilters/afsk/modem.c	2012-03-03 19:16:34.066638207 +0100
@@ -59,7 +59,7 @@
  * - BLACKMAN
  * - WELCH (for weak signals)
  */
-#define FIR_WINDOW	HAMMING
+#define FIR_WINDOW	WELCH
 
 /*
  * IZ6RDB 01/03/2012: introduce a parameter
@@ -248,7 +248,7 @@ struct modulator afskmodulator = {
  * Rx FIR Filter length is normally equal
  * to 16.
  */
-#define RXFILTLEN       16
+#define RXFILTLEN       48
 
 /*
  * Rx FIR Filter length is normally equal
@@ -256,7 +256,7 @@ struct modulator afskmodulator = {
  * the minimum wordlength to avoid
  * overflow.
  */
-#define RXFILTOVERBITS	3
+#define RXFILTOVERBITS	5
 
 #define RXFILTOVER      (1<<(RXFILTOVERBITS))
 #define RXFILTFIDX(x)   (((x)>>(16-(RXFILTOVERBITS)))&(RXFILTOVER-1))

In the first patch I have also considered a few kind comments from
Walter Harms to improve the style a little bit when defining the
optional window selection.

I cannot spend much time in further revisions and also I am now
perfectly happy with the performance that I am achieving, but feel free
to introduce further improvements and/or apply bits or the whole thing
directly into new releases if you feel doing the right thing.

I just hope it helps quickly sorting out the issue for other people that
were also experiencing problems with using soundmodem at 300 baud...

Regards,

Guido IZ6RDB

