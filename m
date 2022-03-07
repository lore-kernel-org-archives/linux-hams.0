From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Kernel freeze on killall kissattach
Date: Mon, 7 Mar 2022 13:52:25 +0300
Message-ID: <20220307105225.GB3293@kadam>
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ojj6kRvLIiRoxI+3o9EiIVYdgyRDmuQR6OwytSX5f5g=;
 b=DVpmdElQlTBzFxhSprnnXVyHGdmcqFHECSsNbQvRMcW2APIYBq4hEVYTDQKGp+ROHkrG
 9655aNZ1BdwRQIsAZS7FekqmM3CbL7YY+G3COtIeyTlsra4nl+C0NntwAB389B7n7SYe
 wG8t2ULaGCOeAWGFlToxeYvp7BJrH5Zbvtjy071hYLIJqsKHtiR/jhgUuZVxOBlCm/Dv
 4edVJSfSfGzs48QrekzumPH+cHSCApwbY0HRQiW2i0QdRymydNu4uzNXTis7vjpiUkdg
 1fw3lktvwk3bkju0ugB3zcLHyHcYteXbZU8ji+3aRn+0W7+u/+TgYxNb50cCtbRDJjxI HA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojj6kRvLIiRoxI+3o9EiIVYdgyRDmuQR6OwytSX5f5g=;
 b=I05nNv1ICYzHtCDqS9nkrFEXuTK/+misZBSL2sJvZBLj5HpBWXZAEbaeo3Alk2x0O4l1qz9fUOI7xsnAwrWkqArdCaosNL6M9fVk38VZ/ikmVSG5AyCoANX1fnsJ94b5H5dcuve32jqo6NvdDhuy0pzqVjHDXqBytuS/+bKdV7g=
Content-Disposition: inline
In-Reply-To: <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>
Cc: Roland Schwarz <roland.schwarz@blackspace.at>, linux-hams@vger.kernel.org

This email is very useful but none of the correct people are CC'd.  :/
Please resend it with the following people CC list.

Hanjie Wu <nagi@zju.edu.cn>
Lin Ma <linma@zju.edu.cn>
David S. Miller <davem@davemloft.net>
netdev@vger.kernel.org

regards,
dan carpenter

