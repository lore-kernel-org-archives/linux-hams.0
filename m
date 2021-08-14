From: Kevin Dawson <hal@kd.net.au>
Subject: Re: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Sat, 14 Aug 2021 10:23:56 +1000
Message-ID: <20210814002345.GA19994@auricle.kd>
References: <20210813112855.11170-1-paskripkin@gmail.com>
 <20210813145834.GC1931@kadam>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210813145834.GC1931@kadam>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On Fri, Aug 13, 2021 at 05:58:34PM +0300, Dan Carpenter wrote:
> On Fri, Aug 13, 2021 at 02:28:55PM +0300, Pavel Skripkin wrote:
> > Syzbot reported slab-out-of bounds write in decode_data().
> > The problem was in missing validation checks.
> > 
> > Syzbot's reproducer generated malicious input, which caused
> > decode_data() to be called a lot in sixpack_decode(). Since
> > rx_count_cooked is only 400 bytes and noone reported before,
> > that 400 bytes is not enough, let's just check if input is malicious
> > and complain about buffer overrun.
> > 
> > ...
> > 
> > diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
> > index fcf3af76b6d7..f4ffc2a80ab7 100644
> > --- a/drivers/net/hamradio/6pack.c
> > +++ b/drivers/net/hamradio/6pack.c
> > @@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
> >  		return;
> >  	}
> >  
> > +	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {
> 
> It should be + 2 instead of + 3.
> 
> We write three bytes.  idx, idx + 1, idx + 2.  Otherwise, good fix!

I would suggest that the statement be:

	if (sp->rx_count_cooked + 3 > sizeof(sp->cooked_buf)) {

or even, because it's a buffer overrun test:

	if (sp->rx_count_cooked > sizeof(sp->cooked_buf) - 3) {

This is because if there are three bytes being written, that is the number that should be obvious in the test.

I haven't looked at the surrounding code and there may be some other consideration why the "+ 2 >=" rather than "+ 3 >" (and from the description of "idx, idx + 1, idx + 2", I suspect it's visual consistency), so if that is important, feel free to adjust as required.

Thanks,
Kevin
