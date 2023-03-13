From: Dan Carpenter <error27@gmail.com>
Subject: Re: Backport to LTR?
Date: Mon, 13 Mar 2023 07:23:16 +0300
Message-ID: <32c65d90-6917-467e-9902-0d85c0a80b90@kili.mountain>
References: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
 <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678681402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pa+J7kxb6xmphZHzA8aRN14EiK0ndFLTEDLd/WMUn9Q=;
        b=SJxvfvZDU/EjO7YZqTZgJ8xYLjfgXJcRzZiiGpiDOKT87d6+My+1BJye8wNSg8uCwr
         DnqOFQ1iVI7CTz6LOFtcYsiGD/uVBFhhwWNwza84FKvRbmLS/jaFF2Ub/ik4EZDFAG2x
         9V/H+n+11FLC3k69HRBMgJr4r9IiLIpwEgqQfx5xEDiBkvITNYmwPfZxTEO7y01+UExn
         M0cn61A1coJrurzfRAep/Uvq02wxjjR5prVG2jM3FkgA2vczgD2V32LActZ3/qsEzBem
         TQZwEKbUYXdH70szobH5UyDPqGMiRfjK6uCk8p3YurAMktRKB9LbejMFXd/HH8ficl6n
         rJ+w==
Content-Disposition: inline
In-Reply-To: <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

On Sun, Mar 12, 2023 at 11:05:54AM -0700, David Ranch wrote:
> 
> Hello Chris,
> 
> I think this post covers your question:
> 
> https://unix.stackexchange.com/questions/715465/how-to-submit-patches-and-fixes-to-lts-linux-kernels
> 

That's the general rules, but networking stable patches need to be
approved by the networking maintainers so make sure you add the
following CCs.

M:      "David S. Miller" <davem@davemloft.net>
M:      Eric Dumazet <edumazet@google.com>
M:      Jakub Kicinski <kuba@kernel.org>
M:      Paolo Abeni <pabeni@redhat.com>
L:      netdev@vger.kernel.org

regards,
dan carpenter

