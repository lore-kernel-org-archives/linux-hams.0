From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Re: [PATCH net V4 1/2] ax25: Fix refcount leaks caused by
 ax25_cb_del()
Date: Tue, 15 Mar 2022 17:19:05 +0300
Message-ID: <20220315141905.GB1841@kadam>
References: <20220315015403.79201-1-duoming@zju.edu.cn>
 <20220315102657.GX3315@kadam>
 <15e4111b.5339.17f8deb1f24.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=hq6ofKC/WmplhDPhfQFIp+LSpb8/m8ARTe1zr6I4hDg=;
 b=CMgCTVI/Zux1ednO8+XNhC1dUwsfTUGvx54/dtPmJNvlyDEIBvKr+GuF8MfiC5kjnpU7
 5cxjfIhAyXwmwrUVYDMNQpKYQyzMJ1kCjFPbNn3lEOQyEgsRB0RfOrSAa1gtkT+JMPR5
 OEimvH2uemG173vuyAcpAv8L8fvdtRtCQsuLX0fErbHIgWx949a61yI22itzjaTJLHuZ
 ZLmyKWRrgidZ+gOBsOGVhIg++juEZ153RoqwDRomR0ul/0zrzPcf0+dxbY+yinRA8wme
 gQ+peOIqjHmF6bDdaVe4GXYmVxqako2dYlHJX3ct1f5/CuhSzfgNLqiB8vtm9V2AfAfH cQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hq6ofKC/WmplhDPhfQFIp+LSpb8/m8ARTe1zr6I4hDg=;
 b=Kl3NcupZ8C++Iej/ETdfn+7X/YZkwWUD4YoYuZeCCkRvBcvpx4bz6kwPCiYl2oDFYvGNqiRpL8dUdjNDC3fuMglhlVbUVxmgPwlxKUCNOtdqyprm93RRhoBvKWe/jazM9Z2z68cExqZ+rsmNy/DqB1lsmsN3/QSELyty0XUXwI8=
Content-Disposition: inline
In-Reply-To: <15e4111b.5339.17f8deb1f24.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?5ZGo5aSa5piO?= <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, thomas@osterried.de

On Tue, Mar 15, 2022 at 10:11:10PM +0800, 周多明 wrote:
> Hello,
> 
> On Tue, 15 Mar 2022 13:26:57 +0300, Dan Carpenter wrote:
> > I'm happy that this is simpler.  I'm not super happy about the
> > if (sk->sk_wq) check.  That seems like a fragile side-effect condition
> > instead of something deliberate.  But I don't know networking so maybe
> > this is something which we can rely on.
> 
> The variable sk->sk_wq is the address of waiting queue of sock, it is initialized to the 
> address of sock->wq through the following path:
> sock_create->__sock_create->ax25_create()->sock_init_data()->RCU_INIT_POINTER(sk->sk_wq, &sock->wq).
> Because we have used sock_alloc() to allocate the socket in __sock_create(), sock or the address of
> sock->wq is not null.
> What`s more, sk->sk_wq is set to null only in sock_orphan().
> 
> Another solution:
> We could also use sk->sk_socket to check. We set sk->sk_socket to sock in the following path:
> sock_create()->__sock_create()->ax25_create()->sock_init_data()->sk_set_socket(sk, sock).
> Because we have used sock_alloc() to allocate the socket in __sock_create(), sock or sk->sk_socket
> is not null.
> What`s more, sk->sk_socket is set to null only in sock_orphan().
> 
> I will change the if (sk->sk_wq) check to if(sk->sk_socket) check, because I think it is 
> easier to understand.
> 
> > When you sent the earlier patch then I asked if the devices in
> > ax25_kill_by_device() were always bound and if we could just use a local
> > variable instead of something tied to the ax25_dev struct.  I still
> > wonder about that.  In other words, could we just do this?
> > 
> > diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> > index 6bd097180772..4af9d9a939c6 100644
> > --- a/net/ax25/af_ax25.c
> > +++ b/net/ax25/af_ax25.c
> > @@ -78,6 +78,7 @@ static void ax25_kill_by_device(struct net_device *dev)
> >  	ax25_dev *ax25_dev;
> >  	ax25_cb *s;
> >  	struct sock *sk;
> > +	bool found = false;
> >  
> >  	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
> >  		return;
> > @@ -86,6 +87,7 @@ static void ax25_kill_by_device(struct net_device *dev)
> >  again:
> >  	ax25_for_each(s, &ax25_list) {
> >  		if (s->ax25_dev == ax25_dev) {
> > +			found = true;
> >  			sk = s->sk;
> >  			if (!sk) {
> >  				spin_unlock_bh(&ax25_list_lock);
> > @@ -115,6 +117,11 @@ static void ax25_kill_by_device(struct net_device *dev)
> >  		}
> >  	}
> >  	spin_unlock_bh(&ax25_list_lock);
> > +
> > +	if (!found) {
> > +		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
> > +		ax25_dev_put(ax25_dev);
> > +	}
> >  }
> 
> If we just use ax25_dev_device_up() to bring device up without using ax25_bind(),
> the "found" flag could be false when we enter ax25_kill_by_device() and the refcounts 
> underflow will happen. So we should use two additional variables.

That answers my question.  Thank you.

> 
> If we use additional variables to fix the bug, I think there is a problem.

So the v3 patch was buggy?

Why was this not explained under the --- cut off line?

regards,
dan carpenter

