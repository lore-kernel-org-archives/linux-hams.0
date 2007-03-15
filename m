From: "William McKeehan" <mckeehan@mckeehan.homeip.net>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 14:53:45 -0400 (EDT)
Message-ID: <65125.141.129.1.98.1173984825.squirrel@mckeehan.homeip.net>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
    <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
    <1173962835.1770.27.camel@CO>
    <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
    <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
    <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
    <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
    <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
    <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
    <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
    <5abd436b0703151003j19c9a14eyf88f0c59f9ad26a4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5abd436b0703151003j19c9a14eyf88f0c59f9ad26a4@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Vodall WA7NWP <wa7nwp@gmail.com>
Cc: linux-hams@vger.kernel.org, Stephen Brown Jr <stephen.brown75@gmail.com>

Bill, this looks very good! I had not noticed this in the docs before and the
solution presented in the FAQ did not work well for me, but the net2kiss looks
like it may just get me what I want!

Thanks!
-- 
William McKeehan

On Thu, March 15, 2007 1:03 pm, Bill Vodall WA7NWP wrote:
>> > Is there a way to setup Xastir on one linux box and have it talk to the
>> AX.25
>> > stack on a second box?
>
> Yes - this is actually taken from some of the Xastir docs..
>
>   http://nwp.ampr2.net/jnos/RemoteSerial
>
> As long as you're on one Linux box, it works best to KISSATTACH the
> external device and then multiple applications can all use the AX25
> device at the same time.  If you need to access it from an application
> that talks KISS but not Linux-AX25, then use the net2kiss command to
> bring the AX25 data to a virtual serial port.  That's how JNOS talks
> "packet" on a linux system.
>
> 73
> Bill - WA7NWP
