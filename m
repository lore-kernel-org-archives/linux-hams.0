From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] ax25_cb refcounting & waitqueue usage
Date: Wed, 9 Jul 2003 00:52:15 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030709005215.A219@jeroen.pe1rxq.ampr.org>
References: <20030706192734.E4454@jeroen.pe1rxq.ampr.org> <20030707133710.GJ1820@conectiva.com.br> <20030707192340.A219@jeroen.pe1rxq.ampr.org> <20030707172503.GC5292@conectiva.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030707172503.GC5292@conectiva.com.br>; from acme@conectiva.com.br on Mon, Jul 07, 2003 at 19:25:04 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

On 2003.07.07 19:25:04 +0200 Arnaldo Carvalho de Melo wrote:

> so may I suggest that you use the same arquitecture of list handling in
> struct
> sock? i.e. use hlist and have a ax25_cb_add, ax25_cb_del{_init} that does
> the
> refcounting, etc, so that it "looks like" what we have for struct sock
> and that
> way a casual ax25 hacker can take advantage of what he learnt from
> studying
> struct sock handling? I plan to attack the list searching problem in a
> general
> way, i.e. abstracting more the search in a bsearch(3) way, using inlines
> and
> macros so that all the protocols have a more consistent implementation.

Good idea...

I now have the first ax25 stack with hlists running on my test system...
It needs some cleaning up (some old junk commented out at the moment and I
need to rename some functions to be more descriptive) which will probably
happen in the next few days.
I also removed the bpq header length stuff in the skb allocation, it now
uses the hard_header_length of the network device... The stack should not
have to now which devices there might possibly be.

Jeroen

