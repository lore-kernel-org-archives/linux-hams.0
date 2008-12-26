From: Dave Platt <dplatt@radagast.org>
Subject: soundmodem patch for ALSA compatibility issues
Date: Thu, 25 Dec 2008 19:23:35 -0800
Message-ID: <49544E37.9000506@radagast.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_firewall-32500-1230261816-0001-2"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_firewall-32500-1230261816-0001-2
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Attached is the latest version I've worked up of a patch to the
soundmodem "alsaio.c" interface code.  It corrects (or compensates
for) a number of problems I've encountered in using the soundmodem
with a SignaLink USB sound interface, and which I suspect might also
affect other USB sound adapters.

The changes are as follows:

[1] The list of four "hw:" device IDs suggested by soundmodemconfig has
     been expanded, to include the corresponding "plughw:" devices. These
     refer to the same underlying hardware, but connect to the device via
     an ALSA plugin which can perform sample-rate conversion.

     Relevance: some (many?) USB sound adapters support different sets of
     sample rates for their input and output channels... and some even
     have completely disjoint rate sets (i.e. there's no single sample
     rate available for both input and output).  Currently, the AFSK
     soundmodem (at least) can't deal with devices whose drivers don't
     return the same sample rates in both directions.  Using "plughw:"
     gets around the problem, by doing software sample-rate conversion
     where necessary and allowing the soundmodem to use whatever
     interface sample rate it requests.  The "plughw:" rate converter
     seems to work well... unlike the one in the kernel OSS compatibility
     layer, which (in my experience) can corrupt the audio data rather
     badly.

[2] I've added error handling logic in the transmit and receive routines
     to deal with an EPIPE error, which indicates a transmit data
     underrun or a receive overrun.  These were very common (and fatal)
     on my system.  I suspect that input overruns are likely to affect
     anyone who uses a full-duplex sound card/driver on a half-duplex
     radio channel.

[3] I've added a bit of additional trace information to a few of the
     error-logging printouts, and added suppression for the "file
     descriptor is in the wrong state" error which can be expected
     to occur frequently in the end-of-transmit routine (this routine
     will tend to try to start the receive channel when it's already
     running... a harmless error which I don't think needs to be
     reported).

[4] Moved a couple of variables inside the #ifdef'ed block which
     uses them, in order to avoid a compile-time "unused variable"
     warning if this code isn't enabled.

This patch is against the alsaio.c routine which was distributed
in the Debian distro of soundmodem-0.10.  IIRC it does not reflect
any of the other patches against 0.10 that have been floating
around (but I could be wrong about that).

This patch is, of course, offered under the same GPL v2 terms as
the code it modifies.

Happy Holidays, all!


--=_firewall-32500-1230261816-0001-2
Content-Type: text/x-patch; name="alsaio-patch.diff"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="alsaio-patch.diff"

--- soundmodem-0.10/soundcard/alsaio.c	2004-04-13 08:05:51.000000000 -0700
+++ soundmodem-0.10-alsapatch/soundcard/alsaio.c	2008-12-25 19:02:02.000000000 -0800
@@ -75,7 +75,7 @@
 
 struct modemparams ioparams_alsasoundcard[] = {
 	{ "device", "ALSA Audio Driver", "Path name of the audio (soundcard) driver", "hw:0,0", MODEMPAR_COMBO, 
-	  { c: { { "hw:0,0", "hw:1,0", "hw:2,0", "hw:3,0" } } } },
+	  { c: { { "hw:0,0", "plughw:0,0", "hw:1,0", "plughw:1,0", "hw:2,0", "plughw:2,0", "hw:3,0", "plughw:3,0" } } } },
         { "halfdup", "Half Duplex", "Force operating the Sound Driver in Half Duplex mode", "0", MODEMPAR_CHECKBUTTON },
 	{ "capturechannelmode", "Capture Channel", "Capture Channel", "Mono", MODEMPAR_COMBO, 
 	  { c: { { "Mono", "Left", "Right" } } } },
@@ -348,21 +348,23 @@
 
 	err = snd_pcm_drain(audioio->playback_handle);
 	if (err < 0)
-		logprintf(MLOG_ERROR, "snd_pcm_drain: %s", snd_strerror(err));
+		logprintf(MLOG_ERROR, "snd_pcm_drain in iotxend: %s", snd_strerror(err));
 	if (!(audioio->flags & CAP_HALFDUPLEX))
 		return;
 	err = snd_pcm_start(audioio->capture_handle);
-	if (err < 0)
-		logprintf(MLOG_ERROR, "snd_pcm_start: %s", snd_strerror(err));
+	if (err < 0 && err != -EBADFD)
+		logprintf(MLOG_ERROR, "snd_pcm_start in iotxend: %s", snd_strerror(err));
 }
 
 static inline void iotxstart(struct audioio_unix *audioio)
 {
 	int err;
-
+	if (snd_pcm_prepare(audioio->playback_handle) < 0) {
+		logprintf(MLOG_ERROR, "Error preparing tx.\n");
+	}
 	err = snd_pcm_start(audioio->playback_handle);
 	if (err < 0)
-		logprintf(MLOG_ERROR, "snd_pcm_start: %s", snd_strerror(err));
+		logprintf(MLOG_ERROR, "snd_pcm_start in iotxstart: %s", snd_strerror(err));
 }
 
 /* ---------------------------------------------------------------------- */
@@ -390,6 +392,12 @@
 	if (!audioio->playback_handle)
 		return;
 	err = snd_pcm_writei(audioio->playback_handle, p, nr);
+	if (err == -EPIPE) {
+		if (snd_pcm_prepare(audioio->capture_handle) < 0) {
+			logprintf(MLOG_ERROR, "Error preparing tx.\n");
+		}
+		err = snd_pcm_writei(audioio->playback_handle, p, nr);
+	}
 	if (err < 0) {
 		logprintf(MLOG_ERROR, "audio: snd_pcm_writei: %s", snd_strerror(err));
 		return;
@@ -449,6 +457,12 @@
 		if (!audioio->capture_handle)
 			logerr(MLOG_FATAL, "audio: read: capture handle NULL");
 		i = snd_pcm_readi(audioio->capture_handle, ibuf, sizeof(ibuf)/sizeof(ibuf[0])/2);
+		if (i == -EPIPE) {
+			if (snd_pcm_prepare(audioio->capture_handle) < 0) {
+				logprintf(MLOG_ERROR, "Error preparing rx.\n");
+			}
+			i = snd_pcm_readi(audioio->capture_handle, ibuf, sizeof(ibuf)/sizeof(ibuf[0])/2);
+		}
 		if (i < 0)
 			logprintf(MLOG_FATAL, "audio: snd_pcm_readi: %s", snd_strerror(i));
 		if (!i) {
@@ -560,10 +574,10 @@
 static void iotransmitstop(struct audioio *aio)
 {
 	struct audioio_unix *audioio = (struct audioio_unix *)aio;
-	short sbuf[256];
-	unsigned int i, j;
 
 #if 0
+	short sbuf[256];
+	unsigned int i, j;
 	/* add 20ms tail */
 	i = audioio->samplerate / 50;
 	memset(sbuf, 0, sizeof(sbuf));

--=_firewall-32500-1230261816-0001-2--
