From: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds read
 in ax25_connect()
Date: Thu, 23 Jul 2020 11:15:48 -0400
Message-ID: <20200723151548.GB412829@PWN>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200722.175714.1713497446730685740.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KyocJ093PD2YbzDHrbxPUouVLOVe2BF7XP9Bhi4fh1o=;
        b=tSaAtD1GxyjwJ2PveArLh3Q+zJiVlHY6dLhLVtfSYNs73jjvOW8FF2WUoYGV52TyF5
         w8aPxeDiojYhblWMBFz02zV1w6Xd1ml0awr2xDX/AFPMteUXKTsIak19BG96adtMz3MO
         5ZHY6tGyTtyoEeWRR78YZFU6j4sJCYTOQVV+qs+z5KdElgT+chPzvvtap+zIlyfcrQKa
         w5xF7uvPrCfBQazolZFSFxVgYNIV8pNwTRSwqvbrkDvsgfPy70jBTm28ZHkRFaKhnoFj
         xlDMrAlsRVRRsS3e01/MPCvlTb+GBwj7HY8moxVImB/lcRbD2h+XAOWOlY8Dj1oOc9QC
         MM9A==
Content-Disposition: inline
In-Reply-To: <20200722.175714.1713497446730685740.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: jreuter@yaina.de, ralf@linux-mips.org, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 22, 2020 at 05:57:14PM -0700, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Wed, 22 Jul 2020 11:19:01 -0400
> 
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
> 
> Applied and queued up for -stable, thanks.

Thank you for reviewing my patch!

Peilin Ye
