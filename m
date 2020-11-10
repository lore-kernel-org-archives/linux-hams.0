From: Anmol Karn <anmol.karan123@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 net] rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Wed, 11 Nov 2020 01:15:18 +0530
Message-ID: <20201110194518.GA97719@Thinkpad>
References: <20201107082041.GA2675@Thinkpad>
 <20201107191835.5541-1-anmol.karan123@gmail.com>
 <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FlTBekxLH9k5lDusEIqJe96gy2kgeT7w1mYQIC7teW8=;
        b=jxd//I0NFIFChmNjGPdP8n7pBMNdp35EWhyQUGVNOEFkxBmgDczY8aKnJ72aGscLiK
         xIzyZsPlCXjMasMkWXUCKiHfHwnmx2DzZiTZm5bqBDwwcImUAC/JktCOJlZDjztgEONa
         qtbH+61o+GqAoP48KdwdB/7mZKBkLEnlk9BjOaPasX7pLtcQ6Q07uAJxP5kDH8ge4L2c
         GTEv8im5JOuzgIFTMM7wYc6kE0/hwOYNhJ1wCG6Yt3Gn4bx48gRzBwNUNvxN1rU7b+xR
         Qdul0H+cR6XHCU7UAC0ShUPDT7BQuYEt/0E0UyM3aobauUNUVwjS48oRiTk9ZioZ3voB
         7yxA==
Content-Disposition: inline
In-Reply-To: <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: ralf@linux-mips.org, davem@davemloft.net, saeed@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

Hello Sir,

On Tue, Nov 10, 2020 at 09:58:15AM -0800, Jakub Kicinski wrote:
> On Sun,  8 Nov 2020 00:48:35 +0530 Anmol Karn wrote:
> > +			dev = rose_dev_get(dest);
> 
> this calls dev_hold internally, you never release that reference in
> case ..neigh->dev is NULL
> 
> > +			if (rose_loopback_neigh->dev && dev) {

Ah, I missed to `dev_put()` the `dev` after checking for, if neigh->dev is NULL,
I will fix it soon and send another version.

Thank you for review.


Anmol
