From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: SIOCGIFCONF and AF_AX25
Date: Mon, 17 Jan 2022 16:51:06 +0300
Message-ID: <20220117135106.GG1951@kadam>
References: <bdf30a4d-4ffa-9228-8cfd-74c52f8bdb40@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=2pFlVIYH/bPVlmHR6HMIOhb7ebkCeRaAaPg1GGq5Dw8=;
 b=FjBsyIOTDL5yuZGFwLPVhwn6AXiD33tCpbFMURd55Wn9/zy/G42o60GKZS1jyjx+8Fr9
 F0ojtSY6LTydrZ7k9COCMdfrDaRzpPj0CFJzQ1X45mZ0eb3S26Tzhge6R3pWj3GPwFGf
 yenaOzXi8XGBXhVNHcb4+Alap5E3yZgVwvQ+LcyrDQ8/gQjw/WNWrNH0dOyAg8OaMxnJ
 YIhD/cfJNxKJrbEtYc0yQju+30PgC5sooYmdHfskLU+DkhP+tMBadASUw+pAIojaNQQN
 TAv2JnAmryH/Bq4vvmiTiknRnopbgmBkW+cpt7q+yIm6jnbdHrJWcS9mqVSvlYHmZ6Lc QA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pFlVIYH/bPVlmHR6HMIOhb7ebkCeRaAaPg1GGq5Dw8=;
 b=cGZ4jxAyW1TTBW1bKjDKOz316RzCKDXWIWmcocfW+HSFng8SrKNSofMaKm+XaLhrxE/0z54ixF06RhPSlfmmhHoI1ZCkH0mqt/3R1sacD2MQbS8kEnYb+Z6Vglakq5XiXBjgtEbXmBufDc3qDZAVFt2Q6kbQDHwLziJ232bkwzQ=
Content-Disposition: inline
In-Reply-To: <bdf30a4d-4ffa-9228-8cfd-74c52f8bdb40@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: linux-hams@vger.kernel.org

On Sun, Jan 16, 2022 at 05:54:53PM +0100, Roland Schwarz wrote:
> Using ioctl SIOCGIFCONF one was able to list all interfaces, including
> AF_AX25.
> 
> This seems to be not be the case any more. I discovered it by trying to find
> out why N1UROs axdigi stopped working.
> 
> Is this a bug, or is there some other means how the interfaces can be
> enumerated?

In the kernel, the rule is "you're not allowed to break userspace".
What that means is that you can change the User facing API so long as
people don't notice and/or complain.  Since you are complaining that
means it is a bug.

Can you use git bisect to find out which patch broke this?

regards,
dan carpenter

