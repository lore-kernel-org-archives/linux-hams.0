From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v4] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Sat, 2 Jul 2022 12:01:08 -0700
Message-ID: <20220702120108.32985427@kernel.org>
References: <20220629104941.26351-1-duoming@zju.edu.cn>
        <20220701194155.5bd61e58@kernel.org>
        <1bbd2137.23c51.181bdcb792f.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656788470;
        bh=HnMLOMngzYmCfv9EoA0IJZhKk3NgHhd9m1LNgCBIWS4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NgaX6wCFSwp+Ev/pL19Xb7/YByiLCukMuQAUwJVLOtjvQBUUE+xOHCj1/UgJ/0uaN
         QvjPByZv8zCljFvQk6+YQCyBD3jAZAdQQyKAdHdD+xrwsOmxboUf6/4he2yYCBGTPP
         1wYKW0OS7+X6hqWQMSSeex38CEBdbtsq6ojiZdZN/kPFkyRu3KcmtpnhuG2RuY8MRd
         MB0lMhtMV9r3Yusv8Kqw7biNmmP9zSnecxvQZ2KsurVZWKpn1NwemPaysET5t1GFI4
         sl02Zl97IVj+s5JjGZqGDgGSvD1U+QGiXD6Ot0Q/jATK+tn9G2pG9n8MHHqK3Tou2c
         T2xFVllkI8M/Q==
In-Reply-To: <1bbd2137.23c51.181bdcb792f.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: duoming@zju.edu.cn
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com

On Sat, 2 Jul 2022 15:23:57 +0800 (GMT+08:00) duoming@zju.edu.cn wrote:
> > On Wed, 29 Jun 2022 18:49:41 +0800 Duoming Zhou wrote:  
> > > When the link layer connection is broken, the rose->neighbour is
> > > set to null. But rose->neighbour could be used by rose_connection()
> > > and rose_release() later, because there is no synchronization among
> > > them. As a result, the null-ptr-deref bugs will happen.
> > > 
> > > One of the null-ptr-deref bugs is shown below:
> > > 
> > >     (thread 1)                  |        (thread 2)
> > >                                 |  rose_connect
> > > rose_kill_by_neigh              |    lock_sock(sk)
> > >   spin_lock_bh(&rose_list_lock) |    if (!rose->neighbour)
> > >   rose->neighbour = NULL;//(1)  |
> > >                                 |    rose->neighbour->use++;//(2)  
> >   
> > >  		if (rose->neighbour == neigh) {  
> > 
> > Why is it okay to perform this comparison without the socket lock,
> > if we need a socket lock to clear it? Looks like rose_kill_by_neigh()
> > is not guaranteed to clear all the uses of a neighbor.  
> 
> I am sorry, the comparision should also be protected with socket lock.
> The rose_kill_by_neigh() only clear the neighbor that is passed as
> parameter of rose_kill_by_neigh(). 

Don't think that's possible, you'd have to drop the neigh lock every
time.

> > > +			sock_hold(s);
> > > +			spin_unlock_bh(&rose_list_lock);
> > > +			lock_sock(s);
> > >  			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
> > >  			rose->neighbour->use--;  
> > 
> > What protects the use counter?  
> 
> The use coounter is protected by socket lock.

Which one, the neigh object can be shared by multiple sockets, no?
