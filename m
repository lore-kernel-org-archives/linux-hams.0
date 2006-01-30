From: Oliver Hohlfeld <Oliver.Hohlfeld@web.de>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 22:07:15 +0100
Message-ID: <200601302207.16313.Oliver.Hohlfeld@web.de>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca> <43DE5851.33E01B71@free.fr> <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

> > echo -e "\300\377\300\r" >/dev/ttyS0
>
> I am not sure what the "\300\377\300\r" is doing for me, I know the
> numbers are equivelants to something, but they aren't decimal
> equivelants to ASCII characters, so what are they and where can I find
> a chart that can give me a listing of this type of thing?
 
You're right, the numbers above aren't decimal numbers. In fact these
are backslash-escaped characters whose ASCII code is NNN (octal) (see
man echo for further details) - whereas NNN is the representation of
the ASCII code to base 8 (Octal). There're lots of calculators available
which let you convert those numbers between different bases, such as
8 and 10 (used in this example).

By using such a calculator you will get the following results:
300 = 192 and 377 = 255. The letter representation might look more
familiar to you.

The last escaped r is just a carriage return.

Cheers,
Oliver

-- 
Oliver Hohlfeld | DO1FDK | http://www.ohohlfeld.com
http://dk0td.afthd.tu-darmstadt.de/~do1fdk/ | www.ohohlfeld.com/gpgkey.txt
                 - long long ago; /* in a galaxy far far away */ -
                  - I am not a bug I am a undocumented feature -
