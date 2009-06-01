From: Phil <phillor@telstra.com>
Subject: /dev/dsp busy
Date: Mon, 1 Jun 2009 10:59:15 +1000
Message-ID: <200906011059.15279.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thank you for reading this.

I've recently upgraded to Mandriva 2009.1 and now none of my 
Amateur Radio applications will run because /dev/dsp is busy. Yet, 
"fuser -v dev/dsp" shows that nothing is using the resource.

I've disabled Pulse Audio in case that was a problem and I don't have 
any sound applications sitting on the task bar. I had this problem four 
years ago and that was due to a music player sitting on the task bar.

The driver in use is: "intel HDA (snd_hda_intel [ALSA])"

Can anyone offer any suggestions?
 
-- 
Regards,
Phil
