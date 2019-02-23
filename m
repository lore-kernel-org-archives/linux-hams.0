From: Ivan Ivanov <qmastery16@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] net: ax25: Fix multiple blank lines warning
Date: Sat, 23 Feb 2019 16:17:36 +0300
Message-ID: <CAAaskFCUXvPjTZXY_k1zohpVc-ij6sUoB4EcrsYRKU+ortXf4Q@mail.gmail.com>
References: <20190223111751.14620-1-jbi.octave@gmail.com> <20190223125932.GC16686@kroah.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1aAfqZjHxXsssZRn+4PHuxoy59COYe9T0gXkqPq5kys=;
        b=iRZ2KmnkpLNVCCOXcrkSkGi0IIgL4V1pbzS7IvHo20S9g2r10lID+TKhHZTV5MOFbB
         OpkgJ9B/0NAA/hRG2kujVMpW/yXu4X2I59msCSROJJJBnI2Ngma62R4qpPAUlSZHcrJz
         NiVRsQxXkFm5xju9p4TxeliS6fYk2ulNCuKOLdB9CtppzL5YKxT3ItgGwfAV+shgWo0Z
         /8tmmYeuHTaCAzCPKATYhcqDaicaogl6s0Zr0t8BBwS5Jxo6eRKVEU7JXDjwMhdFd68l
         GU8c9w3vcAVI30rrMgPuoLXho5LAHhQ5UONa4JtVQBgRs2DStuKsQOzhbfOA5WmyAD0B
         Rj2A==
In-Reply-To: <20190223125932.GC16686@kroah.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jules Irenge <jbi.octave@gmail.com>, Greg KH <greg@kroah.com>, jreuter@yaina.de, linux-hams@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, davem@davemloft.net, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com

as usual, Outreachy is doing stiuupid almost-useless commits like
remove two blank lines or fix a tiny typo. They are trying hard to
pretend that they are useful by doing many lame patches like this,
while promoting their SJW madness, anti-male sieexism and anti-white
riaacism. But with the lame stuff like this patch, they are failing
miserably. Maybe hire a ghostwriter (from NSA) to write some drivers
for you?

P.S. and no I am not going to write them for you because I disagree
with your Ci0ck of Conduct and now have to write from anonymous
account

On Sat, Feb 23, 2019, Greg KH <greg@kroah.com> wrote:
>
> On Sat, Feb 23, 2019 at 11:17:51AM +0000, Jules Irenge wrote:
> > Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> > ---
> >  net/ax25/af_ax25.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> > index 5048790a75f6..2da349b7854a 100644
> > --- a/net/ax25/af_ax25.c
> > +++ b/net/ax25/af_ax25.c
> > @@ -49,8 +49,6 @@
> >  #include <net/ip.h>
> >  #include <net/arp.h>
> >
> > -
> > -
> >  HLIST_HEAD(ax25_list);
> >  DEFINE_SPINLOCK(ax25_list_lock);
>
> Why are you doing outreachy application patches in net/?  We only accept
> them in drivers/staging/  Always start there first.
>
> thanks,
>
> greg k-h
