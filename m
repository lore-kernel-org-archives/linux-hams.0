From: "Ben Gelb" <ben@gelbnet.com>
Subject: RE: ax25d and STDIN
Date: Sun, 29 Sep 2002 18:14:39 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000f01c26805$9daf6d00$0bc43e2c@ben>
References: <Pine.LNX.4.44.0209292103580.13963-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0209292103580.13963-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tpm@prkele.tky.hut.fi
Cc: linux-hams@vger.kernel.org

I think I am going to stick with my hack. It works fine for the amount
of data I will be inputting at a time (less than 80 chars) so I don't
forsee any problems. 

There is no real way to do a low-level read() in php, not that I am
aware of anyway, and the setbuf() family of functions doesn't exist.

Thanks for your help, perhaps I'll consider using C next time, but I
really want an uncompiled language so I can make changes quickly if
problems arise. I think I mentioned that before.

73 Ben

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Tomi Manninen
Sent: Sunday, September 29, 2002 2:27 PM
To: Ben Gelb
Cc: linux-hams@vger.kernel.org
Subject: Re: ax25d and STDIN

On 28 Sep 2002, Ben Gelb wrote:

> Using fread with a large length doesn't work, because EOF is never
found
> in stdin. So it just keeps waiting for the number of bytes specified.

Actually I Don't think it's EOF that is missed. You would expect to see
EOF only when the user disconnects. It's probably that the io stream is
fully buffered. Playing with the setbuf() family of functions (if 
available in php, perl or whatever you use, I don't know) might be a 
solution.

> I don't really understand why this works with the SEQPACKET
> consideration. I am definitely not getting the whole packet at once,
> yet, as I said, it does work.

Your code (which I believe in some form uses the libc stdio library)
buffers the reads and the actual low level read() is called with a
buffer
larger than what you specify. The default is probably the machine page
size. I think that's why it works.

I have found that the safest option is to directly use a low level
read() 
call and handle any buffering my self. I don't know if that is an option

for you however. So after all your hack might the best solution.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


