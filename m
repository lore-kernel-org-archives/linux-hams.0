From: Aleksandar Ilic <ailic@gmx.net>
Subject: Re: ANNOUNCE: gMFSK v0.5
Date: Fri, 11 Jul 2003 23:25:24 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307112325.24591.ailic@gmx.net>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org> <20030420023708.GA22988@silly.cloud.net.au> <3F0F1E43.9030500@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F0F1E43.9030500@pi8zaa.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Friday 11 July 2003 22:29, Arno Verhoeven wrote:
> > Neat! Compiled easily on Debian and I'll upload the package shortly.
> It doesn't on my machine (Slackware 9.0). If tried with both fftw-3.0 and
> 2.1.5 but in both cases configure gives an error.
>
> configure: error: FFTW libraries not found!!!
>
> Does anybody know a way how to solve this?

It works here on Slack 9.
Grep your /etc/ld.so.cache to be sure libfft is in it.
When I compiled fft-2.1.3, it was necessary to :
./configure --enable-shared
or libraries was not cached.

kindly,
Alek
-- 
  73 de YU1IS  -=-  ICQ# 62419462
