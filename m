From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 07:41:03 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com> 
 <45F8566D.10206@wa7v.com>  <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
  <1173962835.1770.27.camel@CO>  <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
  <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com> 
 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
 <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Stephen Brown Jr <stephen.brown75@gmail.com>, linux-hams@vger.kernel.org

On Thu, 15 Mar 2007, Chuck Hast wrote:

> I was looking at Xastir docs and it appears that it will work with the ax25
> stack.

Yes.  It'll work with the AX.25 stack -or- with the "soundmodem"
driver set up as a serial KISS TNC -or- with a KISS TNC on a direct
serial port -or- with a non-KISS TNC on a direct serial port.

Of course the only way to share TNC's with other apps is to use the
AX.25 stack.

Xastir has a "View->Incoming Data" dialog so you can see whether
packets are coming in at all once you set up an AX.25 interface in
Xastir and enable it.

You'll also have to do "chmod 4755 /usr/local/bin/xastir" as root in
order to give Xastir the proper privileges to open an AX.25
networking port.  Xastir drops privileges to normal user level
unless it's messing with ports where it needs root privilege.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
