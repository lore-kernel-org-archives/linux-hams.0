From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net v6] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Thu, 14 Jul 2022 17:23:57 +0300
Message-ID: <20220714142357.GW2338@kadam>
References: <26cdbcc8.3f44f.181f6cc848f.Coremail.duoming@zju.edu.cn>
 <4c604039-ffb8-bca3-90bb-d8014249c9a2@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=QXQ8bh0G4w+1XfmROPvl03le1KKWFaxvPX7wo8NEgZs=;
 b=P5ywcX8OMIVHOZX/sz3cfWIUVnDqVRU6aWWvh6xFhruWtZf52rZ0kDLQeDWKzc6pnUw9
 drTLFTPDSq7x2AZ5PljKJxTVX43QQWFxjcyvfS3lO9g2vTK3pSySXoguc5Gw0hL542PL
 D5XRynUbsocDo/2VmdXvUE8kfXtODDBHk/G7n/rhtDoOaUgicBIuUD76i5EHbMVagbTa
 tZr3KbENjPwaFPP0AehXIoVRyBaScSnbPQz+PLBJmbp+cv+7mV+ejEjEb8v9fubDdH+8
 0hCOZXdKSeRUhRelikgfpWMBZNdzBFAU0KAARSMTkqx51d87KF/IPrtDl3KZfiWzfq46 Jg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXQ8bh0G4w+1XfmROPvl03le1KKWFaxvPX7wo8NEgZs=;
 b=KS8MoXpdaVm+aSMjwqB5f0+6Xh/ym0M1TK2GlOdIdwR3JAvFiKT0pL4a0MIcUIZDoetx39IbLFDaQdc6R1lOzZbjFUzok57CFu6bHwAK9loG344cdWZx8J07o6maTAMHyOnbWngib//afCDc7JWKehRETw9WNIoL6xn6kMoDPfM=
Content-Disposition: inline
In-Reply-To: <4c604039-ffb8-bca3-90bb-d8014249c9a2@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard f6bvp <f6bvp@free.fr>
Cc: duoming@zju.edu.cn, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

On Thu, Jul 14, 2022 at 04:11:44PM +0200, Bernard f6bvp wrote:
> Hi,
> 
> I am an oldtimer FPAC / ROSE user and occasionnally debugger.
> 
> Let me take this opportunity to report a major issue present in rose module
> since kernel 5.4.83 (5.5.10).

Do you think you going do a git bisect to find the buggy patch?

https://wiki.gentoo.org/wiki/Kernel_git-bisect

We should probably start a new email thread for that issue.

regards,
dan carpenter

