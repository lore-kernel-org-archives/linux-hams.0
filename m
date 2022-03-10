From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ax25: Fix memory leaks caused by ax25_cb_del()
Date: Thu, 10 Mar 2022 16:05:08 +0300
Message-ID: <20220310130508.GG3315@kadam>
References: <20220309150608.112090-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=1kHZYehAREvDVGmPYHLTPxvX7nD62cl/SnzRNkFuTx8=;
 b=HBoNeJil5eTg0ZYHfZdD7jDtmuJeTCfgIveTW+j2VQ+ymsEDhP0IK6do0FakhhsFawUG
 m0RgZrmYB9/nV1XD3g9CHWcDQUUt5B8AXpW/OsoEs+On9+m37rFfiWg1mzJRvWt72E8J
 HBcEp5XRz5YB42WiMBZb1osQWVTiNhEA+Tq6zPWWedkRMsy5Py39DW7Ih8llUy4M1vlM
 5V4wq3Kq6Bb4PAs3Zd4eLIk2TRjvYv3XVTP4yhrJU9WYv2gN1rPiB4wJ7LUb8HhJMNVy
 zIZ5ocOGs4vpSvgzNQ7XFqwKnk15Eb6IIp69iBfE+G5KFfItW/qnlBaOG5qxmu9mVi/J Lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kHZYehAREvDVGmPYHLTPxvX7nD62cl/SnzRNkFuTx8=;
 b=qZ4rl24RBInWYVP5WdDQMgpo9nke5VXOUJ6HW/4rRkQvjGrpXaCLd5NZWRmqdx77mVdpxy4upvairIHoZ9GlLrhhMFXV5RU6vtwIF2GJ4oRIQSlW0hIcfKK3Foy/OunRPdfpXMTYDf5yKWf52teb1jhcreWOMhw/U2wkm/RncYQ=
Content-Disposition: inline
In-Reply-To: <20220309150608.112090-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, thomas@osterried.de

This is a very frustrating patch because you make a lot of unnecessary
white space changes and you didn't run checkpatch on your patch.

The whole approach feels like the wrong thing...

I have read your commit message, but I don't understand why we can't
just use normal refcounting.  It sounds like there is a layering
violation somewhere?

Even if we go with this approach ->kill_flag and ->bind_flag should be
booleans.  It makes no sense to have a unsigned long where only BIT(2)
can be set.

regards,
dan carpenter

