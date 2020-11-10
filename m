From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 net] rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Tue, 10 Nov 2020 09:58:15 -0800
Message-ID: <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201107082041.GA2675@Thinkpad>
        <20201107191835.5541-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605031097;
        bh=RIQtxy/Q98sCLVqwPHTqyM87zYGU1ecCP3Nkry/4KJE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qWbeDanDQ8LTacruEGA8MseDR7iXxqZAsBx00l+C3CFBxnBrM8oMkwL5NS+Jaytom
         CELhIfkUkCHybYESX8bvfAsuraJ31VxvKZ7qYfQ25HYnV63ji4eoSk+N2r6ARt1qxQ
         5hpOt3DIMPY0I8rXOeghBkcE358WN5gOnUWUzBGI=
In-Reply-To: <20201107191835.5541-1-anmol.karan123@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anmol Karn <anmol.karan123@gmail.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, saeed@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

On Sun,  8 Nov 2020 00:48:35 +0530 Anmol Karn wrote:
> +			dev = rose_dev_get(dest);

this calls dev_hold internally, you never release that reference in
case ..neigh->dev is NULL

> +			if (rose_loopback_neigh->dev && dev) {
