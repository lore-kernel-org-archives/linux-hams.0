From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Usermode Soundmodem
Date: Mon, 26 Jul 2004 11:58:10 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41052A12.7040503@utoronto.ca>
References: <20040725183329.90335.qmail@web52604.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040725183329.90335.qmail@web52604.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello all,

Just to mention, I recently set up the usermode soundmodem on Linux 
2.6.6 and when configuring my kernel I noticed that a new option was 
available under the ALSA settings - OSS PCM (Digital Audio) API.  This 
basically gives a /dev/dsp device which plugs right into ALSA.  So far, 
the usermode soundmodem software is working really well with this setup, 
on a Soundblaster Live even.  Something worth trying?

73's
Dave
VA3BHF
