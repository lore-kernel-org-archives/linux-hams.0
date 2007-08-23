From: "Tomi Manninen" <oh2bns@sral.fi>
Subject: Re: Gmfsk compile question
Date: Thu, 23 Aug 2007 10:51:31 +0300 (EEST)
Message-ID: <14976.194.100.23.17.1187855491.squirrel@webmail.nbl.fi>
References: <001501c7e542$72a22660$5745f50a@MOTORHOME>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001501c7e542$72a22660$5745f50a@MOTORHOME>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

Hi,

> I'm attempting to compile gmfsk-0.6 and this is an example of the error
> messages:
>
> dsp.h: In function ?void LowPass2(typeInp, LowPass2elem&, typeW, typeW,
> typeW)?:
> dsp.h:558: error: ?Out? was not declared in this scope
> dsp.h: In function ?void LowPass2(typeInp, LowPass2elem&,
> LowPass2weight&)?:

A known bug in 0.6 revealed by a newer compiler...

> checking dfftw.h usability... no
> checking dfftw.h presence... no
> checking for dfftw.h... no
> checking fftw.h usability... yes
> checking fftw.h presence... yes
> checking for fftw.h... yes

This is normal. Different distributions install fftw differently
so gmfsk checks for both styles.

> Quite likely I've overlooked something. Can anyone offer a suggestion?

My suggestion is to upgrade to 0.7pre1 (from gmfsk.connect.fi).
You get a few "new" modes as well.

-- 
Tomi Manninen / OH2BNS / KP20JF74

