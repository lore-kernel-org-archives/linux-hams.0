From: Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [PATCH v2] net/rose: Fix to not accept on connected socket
Date: Tue, 24 Jan 2023 18:28:54 -0800
Message-ID: <20230125022854.69146-1-kuniyu@amazon.com>
References: <20230125020809.67989-1-kuniyu@amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674613752; x=1706149752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5yENitLhmnB5lcFwq2NGFvsRR9PFM2iW0iudgDkY0c0=;
  b=XjZz2YlVE2fCSJWZyjgXJ6h68of+n7HFh/EutWhFG7aTq95DU1t34Zg4
   aD9WNjSFImuWvIRe24RSsfMqehxv0Z4MtP1SL1fEajp6JAQm6wlPFkda5
   vAHXTqs5y6rEu1JAh2fCOsm0ZZoCsaU/oe4/f+XhkgFGHrvy/srDdIumk
   E=;
In-Reply-To: <20230125020809.67989-1-kuniyu@amazon.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: v4bel@theori.io
Cc: kuniyu@amazon.com, davem@davemloft.net, edumazet@google.com, imv4bel@gmail.com, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

From:   Kuniyuki Iwashima <kuniyu@amazon.com>
Date:   Tue, 24 Jan 2023 18:08:09 -0800
> From:   Hyunwoo Kim <v4bel@theori.io>
> Date:   Mon, 23 Jan 2023 11:40:20 -0800
> > If listen() and accept() are called on a rose socket
> > that connect() is successful, accept() succeeds immediately.
> > This is because rose_connect() queues the skb to
> > sk->sk_receive_queue, and rose_accept() dequeues it.

Same comment for the netrom patch here.
https://lore.kernel.org/netdev/20230125014347.65971-1-kuniyu@amazon.com/

The skb which the problematic accept() dequeues is created by
sendmsg(), not connect(), right ?


> > 
> > This creates a child socket with the sk of the parent
> > rose socket, which can cause confusion.
> > 
> > Fix rose_listen() to return -EINVAL if the socket has
> > already been successfully connected, and add lock_sock
> > to prevent this issue.
> > 
> > Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
> 
> Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
> 
> 
> > ---
> >  net/rose/af_rose.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> > index 36fefc3957d7..ca2b17f32670 100644
> > --- a/net/rose/af_rose.c
> > +++ b/net/rose/af_rose.c
> > @@ -488,6 +488,12 @@ static int rose_listen(struct socket *sock, int backlog)
> >  {
> >  	struct sock *sk = sock->sk;
> >  
> > +	lock_sock(sk);
> > +	if (sock->state != SS_UNCONNECTED) {
> > +		release_sock(sk);
> > +		return -EINVAL;
> > +	}
> > +
> >  	if (sk->sk_state != TCP_LISTEN) {
> >  		struct rose_sock *rose = rose_sk(sk);
> >  
> > @@ -497,8 +503,10 @@ static int rose_listen(struct socket *sock, int backlog)
> >  		memset(rose->dest_digis, 0, AX25_ADDR_LEN * ROSE_MAX_DIGIS);
> >  		sk->sk_max_ack_backlog = backlog;
> >  		sk->sk_state           = TCP_LISTEN;
> > +		release_sock(sk);
> >  		return 0;
> >  	}
> > +	release_sock(sk);
> >  
> >  	return -EOPNOTSUPP;
> >  }
> > -- 
> > 2.25.1
