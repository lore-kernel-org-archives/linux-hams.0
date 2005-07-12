From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 12:11:50 -0700
Message-ID: <42D415F6.6040400@jnos.org>
References: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>	 <MAEBLGENFLMMCIMBCMPOMEJKCKAA.la6gha@robenel.com> <d5d4185b050712115164b44321@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <d5d4185b050712115164b44321@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org



Jeremy Utley wrote:
> On 7/12/05, Robert Eliassen <la6gha@robenel.com> wrote:
> 
>>Is TCP/IP often (always?) encapsulated in NetROM or similar protocols over
>>AX.25, or is it possible (implemented somewhere) to send IP-packets right in
>>AX.25's payload? The routing has to be figured out some way...
> 
> 
>>From what I remember, both are possible.  TCP/IP can be encapsulated
> into the payload of an AX.25 frame, or it can also be a part of netrom
> communication. 

That's correct.   With TCP/IP on packet, 40 of the 256 bytes are 
overhead.  Putting it on Netrom adds another 20 bytes.   The real killer 
is that all the ACK packets have the same (40 or 60 bytes) of overhead.

Bytes?  What are bytes these days?   Time to download another 2.4 GB 
file off the Tivo.

Bill
