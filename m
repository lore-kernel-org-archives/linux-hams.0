From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] ax25: Fix ax25_cb refcounting in ax25_ctl_ioctl
Date: Fri, 25 Sep 2009 12:10:47 -0700 (PDT)
Message-ID: <20090925.121047.58190989.davem@davemloft.net>
References: <20090925131038.GA14778@ff.dom.local>
	<20090925134052.GA1661@linux-mips.org>
	<20090925183504.GA3307@del.dom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20090925183504.GA3307@del.dom.local>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jarkao2@gmail.com
Cc: ralf@linux-mips.org, f6bvp@free.fr, bernard.pidoux@upmc.fr, netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: Jarek Poplawski <jarkao2@gmail.com>
Date: Fri, 25 Sep 2009 20:35:04 +0200

> On Fri, Sep 25, 2009 at 02:40:52PM +0100, Ralf Baechle DL5RB wrote:
>> > [PATCH] ax25: Fix ax25_cb refcounting in ax25_ctl_ioctl
>> > 
>> > Use ax25_cb_put after ax25_find_cb in ax25_ctl_ioctl.
>> > 
>> > Reported-by: Bernard Pidoux F6BVP <f6bvp@free.fr>
>> > Signed-off-by: Jarek Poplawski <jarkao2@gmail.com>
>> 
>> Reviewed-by: Ralf Baechle <ralf@linux-mips.org>
>> 
> Thanks for reviewing,

Applied.
