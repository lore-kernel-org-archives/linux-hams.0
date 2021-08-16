From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Mon, 16 Aug 2021 10:13:16 +0300
Message-ID: <20210816071316.GF1931@kadam>
References: <20210813112855.11170-1-paskripkin@gmail.com>
 <20210813145834.GC1931@kadam>
 <20210814002345.GA19994@auricle.kd>
 <1021b8cb-e763-255f-1df9-753ed2934b69@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=G19JHkDUNFtEm3udHiVlL6OEVCXuD4KqRGzyuMjkmhA=;
 b=ONs+q30IFB19mGxc7f+Yb/Vx7LlXxeJgO0X/WnGPMwARw3D/qm6JbVqt+BxsURRl85Gv
 6gPQQyZr65iXX+57+7Hkocdot4zQVPcq/CWmSe5HbFoymBstZ9ECAxtCHUtFmUvqFgs8
 ui8jEbqeOHr4eScto/hS/SWb7xSTCDKEIMxZeRXPLQkT6jzhYdyKxapFsNmmipiiJSGD
 K/4iZJOx9nUJjvzr20bMDhkNQ1JN09bhBKTBeUE+JVZeJ1GIhJX/u9Uc0exDRYxT6Vax
 fALn9XWpJoeUydKEzQahlXa5aODlE0zRLJ1/R1ne7DTRJoY5ETq+wgXuKOe6dAT3PJ4A Ew== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=G19JHkDUNFtEm3udHiVlL6OEVCXuD4KqRGzyuMjkmhA=;
 b=Wyuw+SEZ+Y2FuPP4VQymljj/vwKVy5sAoNjV56KHwhO7mzstikZN+szzvZRwnPA1MhEs
 Ll+G6anFashbOtaRuL1TR9gIvudCx6aJPRAqW4gL7tQbKOvdlP6BFFOR9AGQKGK8dk7i
 OZjwpT3HpPXxMhlts5pbxx3aFJqhVDvK4EWEcgW3mbnFZnh+TIYURkbf/JZZTAjcQeNL
 9qThmaLpvdTigl/aMDsIxjLq4WF/oqYEjG8kDPYpigDx2xEJ813yLs+qZHF3EFHu8Dst
 LrJ+YzQJacDhq8aBVpTS1KMxaJvtK0bz0MdjNawSbeJScozGU38nff+tfl35+lXm/qBD Dw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G19JHkDUNFtEm3udHiVlL6OEVCXuD4KqRGzyuMjkmhA=;
 b=sSsTGgZfQtRxTb+CnmGLOttLoBzjDXQUdwcZkDkmDwl4MFWqandRI1Ee3eAjFdS/yzT7If6aUg5v0ea9fDX8fIuX1aiiHmQnZM0LjQbT4cAakbNXIdxH6lmxgouvM/9knxkYIqf4+Qa4MaTXGnDCs1Cld/OBwD9cAd7yhDPZ/Bk=
Content-Disposition: inline
In-Reply-To: <1021b8cb-e763-255f-1df9-753ed2934b69@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Kevin Dawson <hal@kd.net.au>, ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On Sat, Aug 14, 2021 at 05:17:44PM +0300, Pavel Skripkin wrote:
> On 8/14/21 3:23 AM, Kevin Dawson wrote:
> > On Fri, Aug 13, 2021 at 05:58:34PM +0300, Dan Carpenter wrote:
> > > On Fri, Aug 13, 2021 at 02:28:55PM +0300, Pavel Skripkin wrote:
> > > > Syzbot reported slab-out-of bounds write in decode_data().
> > > > The problem was in missing validation checks.
> > > > > Syzbot's reproducer generated malicious input, which caused
> > > > decode_data() to be called a lot in sixpack_decode(). Since
> > > > rx_count_cooked is only 400 bytes and noone reported before,
> > > > that 400 bytes is not enough, let's just check if input is malicious
> > > > and complain about buffer overrun.
> > > > > ...
> > > > > diff --git a/drivers/net/hamradio/6pack.c
> > > b/drivers/net/hamradio/6pack.c
> > > > index fcf3af76b6d7..f4ffc2a80ab7 100644
> > > > --- a/drivers/net/hamradio/6pack.c
> > > > +++ b/drivers/net/hamradio/6pack.c
> > > > @@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
> > > >  		return;
> > > >  	}
> > > >  > +	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {
> > > 
> > > It should be + 2 instead of + 3.
> > > 
> > > We write three bytes.  idx, idx + 1, idx + 2.  Otherwise, good fix!
> > 
> > I would suggest that the statement be:
> > 
> > 	if (sp->rx_count_cooked + 3 > sizeof(sp->cooked_buf)) {
> > 
> > or even, because it's a buffer overrun test:
> > 
> > 	if (sp->rx_count_cooked > sizeof(sp->cooked_buf) - 3) {
> > 
> 
> Hmm, I think, it will be more straightforward for someone not aware about
> driver details.
> 
> @Dan, can I add your Reviewed-by tag to v3 and what do you think about
> Kevin's suggestion?
> 

I don't care.  Sure.  I'm also fine with leaving it as is.  I've been
using "idx + 2 >= sizeof()" enough recently that it has become an idiom
for me.  But that's probably a bias on my part.

I guess "idx + 3 > sizeof()" is probably the most readable.  Moving
the + 3 to the other side would prevent integer overflows but we're not
concerned about that here and no need to over engineer things if it
hurts readability.

regards,
dan carpenter

