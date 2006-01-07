From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gmfsk compile
Date: Sat, 07 Jan 2006 22:13:35 +0200
Message-ID: <1136664815.2407.3.camel@oh2bns.ampr.org>
References: <43BFCBEA.7090009@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43BFCBEA.7090009@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard <richard.bown@blueyonder.co.uk>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 2006-01-07 at 16:10, richard wrote:

> gmsk-0.6

> dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, typeW, typeW, typeW)':
> dsp.h:558: error: 'Out' was not declared in this scope
> dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, LowPass2weight&)':
> dsp.h:565: error: 'Weigth' was not declared in this scope
> dsp.h:566: error: 'Out' was not declared in this scope
> make[3]: *** [dsp.o] Error 1
> make[3]: Leaving directory `/home/richard/HamApps/gmfsk-0.6/src/mt63'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/home/richard/HamApps/gmfsk-0.6/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/richard/HamApps/gmfsk-0.6'
> make: *** [all] Error 2

This is a bug in the MT63 code (*). It's fixed in 0.7pre1 which I would 
recommend for everyone. From the feedback it seems 0.7pre1 is just as
stable as 0.6 if not better. And you get a few new goodies with it.
Go to http://gmfsk.connect.fi/ to get it.

/Tomi

*) Yes, it's compiler dependent but I think it was somewhere around
GCC 3.4 when this became visible...

-- 
Tomi Manninen / OH2BNS / KP20JF74

