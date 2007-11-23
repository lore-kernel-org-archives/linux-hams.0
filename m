From: Thomas Sailer <sailer@sailer.dynip.lugs.ch>
Subject: Re: Sound card programming for LINUX.
Date: Fri, 23 Nov 2007 12:42:58 +0100
Message-ID: <1195818178.5090.35.camel@xbox360>
References: <4746B373.5000009@btinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4746B373.5000009@btinternet.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geoff Bagley <geoff.bagley@btinternet.com>
Cc: LINUX-HAMS <linux-hams@vger.kernel.org>

> Can the erratic timing of a multi-task system be overcome,  perhaps by  
> altering "nice" numbers ?

If you just want to write a demodulator (which doesn't need low latency,
just no missing samples), you don't need to play with any scheduler, it
will just work (if you have enough memory, and don't send your machine
into swap death).

Just avoid ALSA's OSS compatibility layer, it is broken for DSP stuff.
Use ALSA directly.

If you need low latency, you can use the POSIX 4 API (i.e.
sched_setscheduler and friends).

73,
Tom
HB9JNX / AE4WA


