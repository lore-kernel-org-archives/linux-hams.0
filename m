From: Nick Papadonis <nick@coelacanth.com>
Subject: soundmodem + i810_audio?
Date: Sun, 02 Jun 2002 23:56:47 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <m3lm9xdngg.fsf@coelacanth.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Has anyone successfully tested soundmodem-0.6 with i810_audio in
kernel v2.4.18?  I'm running into problems given this configuration.

Soundmodem is having problems in 'audioio.c' when trying to set
SNDCTL_DSP_STEREO (see below code segment).  sndparam != 0 after the
ioctl, and soundmodem bails.

I attempted commenting the below code segment out.  Using a previously working soundmodem.conf I ran soundmodem.  The PTT
line signals, however I'm only hearing quick beeps out of the
speakers.  The sound doesn't resemble AFSK 1200.

Any ideas?  Thanks

- Nick


        sndparam = 0;   /* we want only 1 channel */
        if (ioctl(audioio->audiofd, SNDCTL_DSP_STEREO, &sndparam) == -1) {
                logprintf(MLOG_ERROR, "audio: Error, cannot set the channel number\n");
		close(audioio->audiofd);
		free(audioio);
                return NULL;
        }
        if (sndparam != 0) {
                logprintf(MLOG_ERROR, "audio: Error, cannot set the channel number to 1\n");

