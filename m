From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ax25d and STDIN
Date: Sun, 29 Sep 2002 21:26:51 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209292103580.13963-100000@oh2bns.ampr.org>
References: <1033190393.2665.53.camel@ben>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1033190393.2665.53.camel@ben>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Gelb <ben@gelbnet.com>
Cc: linux-hams@vger.kernel.org

On 28 Sep 2002, Ben Gelb wrote:

> Using fread with a large length doesn't work, because EOF is never found
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
buffers the reads and the actual low level read() is called with a buffer
larger than what you specify. The default is probably the machine page
size. I think that's why it works.

I have found that the safest option is to directly use a low level read() 
call and handle any buffering my self. I don't know if that is an option 
for you however. So after all your hack might the best solution.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

