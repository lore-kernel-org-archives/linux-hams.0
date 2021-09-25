From: thomas@habets.se
Subject: Re: Unable to receive UI frames with DGRAM socket
Date: Sat, 25 Sep 2021 04:27:41 -0700
Message-ID: <CA+kHd+cavMi-_vvAoJTvc2EDUH7nbMOQ9QqVkx0TOh+KJOOpjA@mail.gmail.com>
References: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
 <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net> <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
 <CA+kHd+fZgoTd=H7wCOqTh1HS3Co-cydpQW5jf48Sv3z=ZdpL2A@mail.gmail.com> <bd512f69-976b-129c-b54b-f6ad8230dc89@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=in-reply-to:mime-version:references:from:date:message-id:subject:to
         :cc;
        bh=jmpEd3ko5Fxc4oOmXsxe6TKORaItYCGxlPaH6VD9doY=;
        b=W4LskNMN6KMF7JtY1hI8kmaeRuCi0KG8Ttx+oBMpVIfzLQSRKHh9t6mFzH0LIuqXil
         7k858rkyuDCRzSKQRDgGTlRcVdTiXnq5Xla9Gl/jxOp9R9OyQrjt3LkKiuGo44r4JPz+
         /jVsVXt2vJpAk9gX6O1KTo6x7eLVee0xQytCQ=
In-Reply-To: <bd512f69-976b-129c-b54b-f6ad8230dc89@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

On Fri, 24 Sep 2021 19:18:25 +0100, David Ranch <linux-hams@trinnet.net> said:
> I would recommend to start a discussion with the Linux
> AX.25 maintainer who would know better on a programmatic level:

Thanks, I'll do that.

> Ps.  It dawned on me that there is another approach to give non-root yet
> promiscuous AX.25 listening abilities in Linux:
>
>     ax25spyd:  https://salsa.debian.org/debian-hamradio-team/ax25spyd

Thanks. I had a look, and it seems that this is essentially a root
daemon that multiplexes AX.25 access through an API.

Note that I don't actually want promiscuous AX.25 listening. I just
want to bind() and then receive UI frames destined for that
address. Just like UDP.

If I understand that correctly then really the applications no longer
use AX.25 sockets, and I start wondering if it's even worth having
support for them in the kernel, as opposed to just having a KISS
multiplexer daemon plus a library.

I tried out ax25spyd and as expected I got:

socket(AF_INET, SOCK_PACKET, 0x300 /* IPPROTO_??? */) = -1 EPERM
(Operation not permitted)

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
