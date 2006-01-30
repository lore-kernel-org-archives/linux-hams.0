From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 13:08:19 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0601301303330.7020@eskimo.com>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca> 
 <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com> 
 <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org> <1138629532.7628.2.camel@CO>
 <43DE5851.33E01B71@free.fr> <43DE7B4B.5040509@jnos.org>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43DE7B4B.5040509@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Mon, 30 Jan 2006, Bill Vodall WA7NWP wrote:

>
> Once kissattach has grabbed a serial port, it's apparently not possible
> to do the "echo's" or minicom operations to that port without killing
> the kissattach.

Here's a trick that somebody just tried with Xastir in order to
share a serial port with another application:


  "Running now ok with :

   tee /dev/ptyt0 /dev/ptyt1 < /dev/ttyS0 > /dev/null &

   I can have now 2 software : one attached to /dev/ttyt0 and the
   other one to ttyt1."


Interesting trick!  I have not done this myself, but suggested it to
him originally as something to try.

We have instructions in our docs for hooking to a serial port across
a network, but he's the first user that wanted more than one app
trying to talk to the same serial port.

Your mileage may vary.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
