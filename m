From: "William McKeehan" <mckeehan@mckeehan.homeip.net>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 11:07:59 -0400 (EDT)
Message-ID: <29463.141.129.1.98.1173971279.squirrel@mckeehan.homeip.net>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
    <45F8566D.10206@wa7v.com>
    <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
    <1173962835.1770.27.camel@CO>
    <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
    <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
    <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
    <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
    <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
    <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
    <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: Stephen Brown Jr <stephen.brown75@gmail.com>, linux-hams@vger.kernel.org

Well, the box with the AX.25 stack and TNC does not have the memory to run
Xastir (or X windows for that matter). So running Xastir there and enabling
the server port is not an option for me.
-- 
William McKeehan

On Thu, March 15, 2007 11:04 am, Curt, WE7U wrote:
> On Thu, 15 Mar 2007, William McKeehan wrote:
>
>> Is there a way to setup Xastir on one linux box and have it talk to the
>> AX.25
>> stack on a second box?
>
> Yes.  You'd turn on "Interface->Enable Server Ports" on the Xastir
> instance running on the system with the AX.25 stack.  This makes a
> TCP/IP port available which the other Xastir can connect to.
>
> You'd also need to enable gating of your packets through that system
> to the RF interfaces via the ~/.xastir/data/nws-stations.txt file.
> Enter the callsign-SSID of the remote Xastir station on a separate
> line in that file.
>
> I don't recall whether you'd have to enable igating on the Xastir
> interface and globally on the File->Configure->Defaults dialog as
> well.  Test it and see.  In any case I'm running a wireless laptop
> at home sometimes with Xastir, gating to RF via another Xastir on
> the desktop which is hooked to the TNC.  Same basic setup as what
> you're asking about.
>
> --
> Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
> "Lotto:    A tax on people who are bad at math." -- unknown
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"
>

