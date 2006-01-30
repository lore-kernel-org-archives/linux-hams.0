From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 22:39:53 +0200
Message-ID: <1138653593.2833.4.camel@oh2bns.ampr.org>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
	 <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
	 <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
	 <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr>
	 <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2006-01-30 at 22:30, Douglas Cole wrote:

> I am not sure what the "\300\377\300\r" is doing for me, I know the
> numbers are equivelants to something, but they aren't decimal
> equivelants to ASCII characters, so what are they and where can I find
> a chart that can give me a listing of this type of thing?
> I have found a listing of "normal" ASCII character codes but they
> don't show 300 or 377 ...

man echo:

...
       \NNN   the character whose ASCII code is NNN (octal)
...

-- 
Tomi Manninen / OH2BNS / KP20JF74

