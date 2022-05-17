From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net-next] ax25: merge repeat codes in ax25_dev_device_down()
Date: Tue, 17 May 2022 10:40:11 +0000
Message-ID: <165278401146.26222.3962756403091826373.git-patchwork-notify@kernel.org>
References: <20220516062804.254742-1-luwei32@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652784011;
        bh=lG+WzhlQu/F5FgYOMdxsU/i/OcTiws5bU6cJHnimqTI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lfJI5YNlohnRV0I4JzS3kWuqM8L48KfcU30EtMWroiLL0o95z1drEWJEO6dH/5YcF
         b0fQqOFWYiG9NcS5zd4VBF4mMXWF2qQCpOeXOXQlwjKmPtCqNqd5T6riMGHGYbPv3y
         OkbN3m26VEvU0nOOzpI7snFcCKYnbbD5tFsWDtI0SVidOTTkgacfu+xeesPfUTZoXZ
         ZnYSUIiO5ai0LCJQG/PS6rdmJnnujYTpc1pR/2YTJu2lOPzX7ImMkq4FC6/k1vpKHf
         RqpXKr+jV/YVQj0XdIEzgKvs7IsQvsu57dQ0sGeKEbvz/W3QK3Fy2/Ky88u+ydDsY4
         6OW+puIfx7ETg==
In-Reply-To: <20220516062804.254742-1-luwei32@huawei.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lu Wei <luwei32@huawei.com>
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 16 May 2022 14:28:04 +0800 you wrote:
> Merge repeat codes to reduce the duplication.
> 
> Signed-off-by: Lu Wei <luwei32@huawei.com>
> ---
>  net/ax25/ax25_dev.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] ax25: merge repeat codes in ax25_dev_device_down()
    https://git.kernel.org/netdev/net-next/c/a968c799eb1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


