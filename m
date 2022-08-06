From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v1 net 1/1] net: avoid overflow when rose /proc displays
 timer information.
Date: Sat, 06 Aug 2022 02:10:13 +0000
Message-ID: <165975181334.26957.10972886418767588216.git-patchwork-notify@kernel.org>
References: <Yuk9vq7t7VhmnOXu@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659751813;
        bh=hRJejyyiZsTASW6C3ZfgHZTv63Mj+O+arUxw/aioS2M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oSmAfM3yrhEI+Ga75Ac+S4t1WdoP7zkUqVf8XXHjD9MWUmh6Ar2JAXiTJTKCci6E/
         6c6oD1PyoniYRyy75hoswrklu6fBo+uAG0iC9MDn7+a+cKZGQcZhbAhtQJFlXop6ll
         hPvBLeKkJsk5Awj5t/ABBYglhxZVqRnBR6lgqj7PwfDXbfbh06s01ff88+gB3h425T
         oeRpNWvTwEZKu+l6kTMpfq9mFQwFA3vCvIY7jgIKm6kjHp5Qg7+9VlPPyCTANx+80v
         Vb5zcau2Rv/djJzhy+kFN5o4Dr61GloizlSl36ic+S06GIdvZmP7VgeNieaJ+8lMlU
         HC2IKADR2zzOQ==
In-Reply-To: <Yuk9vq7t7VhmnOXu@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, f6bvp@free.fr, thomas@osterried.de, thomas@x-berg.in-berlin.de, linux-hams@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 2 Aug 2022 17:07:42 +0200 you wrote:
> rose /proc code does not serialize timer accesses.
> 
> Initial report by Bernard F6BVP Pidoux exhibits overflow amounting
> to 116 ticks on its HZ=250 system.
> 
> Full timer access serialization would imho be overkill as rose /proc
> does not enforce consistency between displayed ROSE_STATE_XYZ and
> timer values during changes of state.
> 
> [...]

Here is the summary with links:
  - [v1,net,1/1] net: avoid overflow when rose /proc displays timer information.
    https://git.kernel.org/netdev/net/c/df1c941468fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


