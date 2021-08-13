From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Sat, 14 Aug 2021 00:09:22 +0300
Message-ID: <20210813210922.GD1931@kadam>
References: <20210813145834.GC1931@kadam>
 <20210813151433.22493-1-paskripkin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=dGXzcssF5FkRLb59x+pQ+esr0VkDnGIDsMpNSdOWyrg=;
 b=l6h/u4lTA4fYE7ZtgDadWGgyOJbUqdDr8wZa4QsAhyF97TvuCjlFAaDyOExh552cULeI
 twCDaMlhk/TVC0B8l3Ohgzmoc+ZLOCQxs/0lEM1pNU0VOmcjBCyhn2JH3tgcbyoc0mMW
 e21ZfDKkJaQ8US4Nzx2fIQK+UCIm3ZtcUIH6HSKqYWi5AW+HWydH5moKtneqzrw70G4f
 3U0QaahI4IcEzGYNDqak5u0GppnoEsg+WmcrXxvkZ0DtU3ZZI+sJwmZqYEji62P75REo
 6SaYD+POUOkqFm9fA9THqfV7AHelcLQl3Ej5juk6JaYIJB6y3rpLRW7ghtkZ2Z80kVqS hg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=dGXzcssF5FkRLb59x+pQ+esr0VkDnGIDsMpNSdOWyrg=;
 b=OrIXTcj6lKomVcIPe7o9R6zi88qDtbOwlFTgoc9BB7KAoQsR2hOcqm8a4O7EPOCoPcoo
 MBVHnPxSzsPf9P/6EsLbnhytRa1F2amm5Bf1ERePgIfrX3mjxkPB7/3pFPlTX9Nhd6Nt
 Gyy4jvS1zAFvb0hAM/AbSay+gULPhe+By11ejxrdDtbyieDCHynC5ARRy4iPEa+F+VkV
 +JiTaxlhdNq8wwQ0wIm/qw+MyBvOcRE2TnSESxCi6d+YYmVVhXWCf+8bE0RStQ599fzJ
 0DofGXWB0xQKwdN8AHlPkkUyFliAuRSH//G+QaN6vi5sD/G9hcDflCTkKYgaF/K6oSk/ MQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGXzcssF5FkRLb59x+pQ+esr0VkDnGIDsMpNSdOWyrg=;
 b=SV/8NSFohSd7EhMDPkHtq14BNiEHgBfyPqMIGX3sw6c8KwhtO2+OxnLNVh6yNN/biCwahsll6Lk4r+O6o8vNrOW8KSzTm0ud6qp0TOe6/Rx0/kIqOMFA19pLLt46qEd48i4i0gv/EnkzqDeNZBRQirStgfNW6k6o59OuQML9b/U=
Content-Disposition: inline
In-Reply-To: <20210813151433.22493-1-paskripkin@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

Great!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

