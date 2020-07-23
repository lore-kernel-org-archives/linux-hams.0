From: David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Prevent
 out-of-bounds read in ax25_sendmsg()
Date: Wed, 22 Jul 2020 18:07:23 -0700 (PDT)
Message-ID: <20200722.180723.102622644879670834.davem@davemloft.net>
References: <20200722160512.370802-1-yepeilin.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20200722160512.370802-1-yepeilin.cs@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: yepeilin.cs@gmail.com
Cc: jreuter@yaina.de, ralf@linux-mips.org, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peilin Ye <yepeilin.cs@gmail.com>
Date: Wed, 22 Jul 2020 12:05:12 -0400

> Checks on `addr_len` and `usax->sax25_ndigis` are insufficient.
> ax25_sendmsg() can go out of bounds when `usax->sax25_ndigis` equals to 7
> or 8. Fix it.
> 
> It is safe to remove `usax->sax25_ndigis > AX25_MAX_DIGIS`, since
> `addr_len` is guaranteed to be less than or equal to
> `sizeof(struct full_sockaddr_ax25)`
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Applied.
