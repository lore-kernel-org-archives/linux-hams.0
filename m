From: "William McKeehan" <mckeehan@mckeehan.homeip.net>
Subject: Re: Problems using MKISS
Date: Fri, 16 Mar 2007 10:12:48 -0400 (EDT)
Message-ID: <2769.192.168.1.205.1174054368.squirrel@mckeehan.homeip.net>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
    <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
    <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
    <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
    <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
    <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
    <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
    <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
    <5abd436b0703151003j19c9a14eyf88f0c59f9ad26a4@mail.gmail.com>
    <65125.141.129.1.98.1173984825.squirrel@mckeehan.homeip.net>
    <dd22fa9c0703151157p46bcfca5se124aebe5fc18c91@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <dd22fa9c0703151157p46bcfca5se124aebe5fc18c91@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Stephen Brown Jr <stephen.brown75@gmail.com>

The link to remserial and net2kiss turns out to be exactly what I wanted.

I have a soundmodem TNC which is controlled by the AX.25 stack. digi_ned talks
to the ax.25 stack as does javaprssrvr.

Today I added net2kiss which talks to ax.25 and creates a virtual serial port;
the virtual serial port looks like a kiss TNC to anything that attaches.

Then I added the remserial to redirect that virtual serial port to another
machine. I connected Xastir to another virtual serial port created by
remserial.

So here's my setup.

Box 1 (server box)
Soundmodem/AX.25 (setup described in an earlier message)
net2kiss - net2kiss -a -i ax0 -s /tmp/net2kisslink &
remserial - remserial -d -p 23000 -s "9600 raw" /tmp/net2kisslink &

Box 2 (client box)
remserial - remserial -d -r 192.168.1.201 -p 23000 -l /dev/remserial1 /dev/ptmx &
Xastir - Serial KISS TNC connected to /dev/remserial1

Now if I could just get remserial to compile on cygwin I'd be very happy.
-- 
William McKeehan

> On 3/15/07, William McKeehan <mckeehan@mckeehan.homeip.net> wrote:
>>
>> Bill, this looks very good! I had not noticed this in the docs before and
>> the
>> solution presented in the FAQ did not work well for me, but the net2kiss
>> looks
>> like it may just get me what I want!
>>
>> Thanks!
>> --
>> William McKeehan
>>
>> On Thu, March 15, 2007 1:03 pm, Bill Vodall WA7NWP wrote:
>> >> > Is there a way to setup Xastir on one linux box and have it talk to
>> the
>> >> AX.25
>> >> > stack on a second box?
>> >
>> > Yes - this is actually taken from some of the Xastir docs..
>> >
>> >   http://nwp.ampr2.net/jnos/RemoteSerial
>> >
>> > As long as you're on one Linux box, it works best to KISSATTACH the
>> > external device and then multiple applications can all use the AX25
>> > device at the same time.  If you need to access it from an application
>> > that talks KISS but not Linux-AX25, then use the net2kiss command to
>> > bring the AX25 data to a virtual serial port.  That's how JNOS talks
>> > "packet" on a linux system.
>> >
>> > 73
>> > Bill - WA7NWP
>>
>

