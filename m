From: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds read
 in ax25_connect()
Date: Thu, 23 Jul 2020 11:13:55 -0400
Message-ID: <20200723151355.GA412829@PWN>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200723142814.GQ2549@kadam>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xCacgrFd+CeqplPw/FPP7QZv3RakcaPw1XtaPxtRK50=;
        b=FQMxms0gk4BtYkF+Y6xdMqkO0brMc/N8YVyqawJqvFtfXFvc046VUcsbgj+WOdAm1T
         WUDKxyAUhmQfN6W5fvASZTemKcusm7wHucBr94ZycBwuW9w6iKnCRn/WLUGVxcbtfb1M
         mNMnDldvsYdph8NM8+YjqrHdeMTlRkPbN2/ISI2FZwZKcS5ef88aWR2tSm4t+FO+2X1J
         f5xbnGbQz8HmhCfGkMBNQoL9hGsD5oddptelhjP5eovSQ6awnHSRxTfWRooTEAoGMlrk
         8BmHSiQGEnEmvw+nWZEAt6SsUWwpJ2MVmgl5VGhMMNjioMtsYGA3ye9KbkB6lkTaVzRC
         QH/A==
Content-Disposition: inline
In-Reply-To: <20200723142814.GQ2549@kadam>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 23, 2020 at 05:28:15PM +0300, Dan Carpenter wrote:
> On Wed, Jul 22, 2020 at 11:19:01AM -0400, Peilin Ye wrote:
> > Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
> > ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
> > equals to 7 or 8. Fix it.
> > 
> > This issue has been reported as a KMSAN uninit-value bug, because in such
> > a case, ax25_connect() reaches into the uninitialized portion of the
> > `struct sockaddr_storage` statically allocated in __sys_connect().
> > 
> > It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
> > `addr_len` is guaranteed to be less than or equal to
> > `sizeof(struct full_sockaddr_ax25)`.
> > 
> > Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  net/ax25/af_ax25.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> > index fd91cd34f25e..ef5bf116157a 100644
> > --- a/net/ax25/af_ax25.c
> > +++ b/net/ax25/af_ax25.c
> > @@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
> >  	if (addr_len > sizeof(struct sockaddr_ax25) &&
> >  	    fsa->fsa_ax25.sax25_ndigis != 0) {
> >  		/* Valid number of digipeaters ? */
> > -		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
> > +		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
> > +		    addr_len < sizeof(struct sockaddr_ax25) +
> > +		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
> 
> The "sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis" can have an
> integer overflow so you still need the
> "fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS" check.

Thank you for fixing this up! I did some math but I didn't think of
that. Will be more careful when removing things.

Peilin Ye
