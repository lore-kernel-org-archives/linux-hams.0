From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Packet at the physical level
Date: Thu, 18 Sep 2003 21:08:54 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030918210854.C8025@jeroen.pe1rxq.ampr.org>
References: <memo.20030918184842.4613A@rovoreed.compulink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <memo.20030918184842.4613A@rovoreed.compulink.co.uk>; from rovoreed@cix.co.uk on Thu, Sep 18, 2003 at 20:48:00 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rovoreed@cix.co.uk
Cc: linux-hams@vger.kernel.org

On 2003.09.18 20:48:00 +0200 Mike Davies wrote:
> 
> 	I'm trying to find out what happens at the physical level with 
> Ax25 packet. I've tried looking at the source code but either I'm looking
> 
> in the wrong place, or I don't understand.

Most of the linux drivers (excluding soundmodem and a litle bit of baycom)
don't deal with the physical aspects...

> 	I'm assuming tones of 1200Hz and 2200Hz for 1200bps
> 
> 	I have several questions concerning transmission.
> 	
> 	1) Am I right in thinking that the tone changes every time a zero
> 
> bit is sent, and not changed when a 1 bit is sent? If so, what tone 
> frequency do I start with (for the first zero bit in the $7E frame start 
> octet)

You are right, its called NRZI (non-return zero inverted)
You can start however you want.... This also implies that the first zero of
the flag can't be the very first bit you receive... More then one flag or a
previous frame is needed.
 
> 	2) Which order are the bits sent ? LSB or MSB first ?

LSB first

> 	3) What is the polynomial for the frame check CRC. I have seen
> two 
> quoted, x^16 + x^12 + x^5 + 1 and also x^16 + X^15 + x^2 + 1 which is 
> right, or is it something else ?

Don't know that either... google?

> 	4) Given that one of the tones is the same as the baud rate, i.e.
> 
> one complete cycle for one bit, does it matter where in the cycle I start
> 
> the tone ?

No, but the output must be continuous (ie as you put in 5 the phase at the
end of a bit is the same as the phase at the beginning of the next bit
regardless which frequencies they have.

> 	5) I'm assuming there is no phase shift between bits. Is this 
> correct ?
> 


Hope this helps,

Jeroen

