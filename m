From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: problems with soundmodem (userspace)
Date: Tue, 08 Jun 2004 19:08:53 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40C5F2A5.8010603@alumni.ethz.ch>
References: <20040607203614.30352.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040607203614.30352.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Platt <dplatt@radagast.org>
Cc: psionic@psionic.de, linux-hams@vger.kernel.org

Dave Platt wrote:

> -  Sound-card resampling problems.  Many modern PCs use sound

This is in fact a big problem. While soundmodem does have the resampling
code and is able to use any sampling rate above a certain minimum required
for the mode, some driver emulation layers interfere with this. ALSAs OSS
emulation layer is a culprit here, it's also quite buggy.

I've put a soundmodem version with a rather experimental native Alsa API
on http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.9.tar.gz

Tom
