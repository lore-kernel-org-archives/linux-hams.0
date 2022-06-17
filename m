From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v2] hamradio: 6pack: fix array-index-out-of-bounds in
 decode_std_command()
Date: Fri, 17 Jun 2022 10:40:14 +0000
Message-ID: <165546241422.18293.12311208765232374431.git-patchwork-notify@kernel.org>
References: <1655458266-27879-1-git-send-email-xujia39@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655462414;
        bh=SIXB8pddVz1MMGWlkLcLLpXBpuhXOlmh3rxuxpd7Tos=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TXQHCHskqpRVv5nRKTmuoqzyjwrEo6ZkzURjP9bjvSBf8K3yiXflycBnoVVkdB4U6
         qupcAeExngDlpueR1MMYCAYShrJWOj3rqzkXd3Q3CdMQoNFo0coTWms9T7emAaOZDP
         5CjvDcOFElBzvyEoKLAreZLCtDXBuu2W54Bxd/drdRpkWIeFyoSc9NJOXgibt9Usuo
         uOErBxRg5bxhgVfAzVaojSlCnrZZZdrGJ6m8MXlT8RAqSMM/68+dTA/L0WLD8VGz6/
         Ofbjzg2DjuDdOPTsVOzjAPBiYELdPkTcOnomeCffeIZdWFhxK3QvFC1x5ZGOunLtKe
         C0gIoUgSiKH/Q==
In-Reply-To: <1655458266-27879-1-git-send-email-xujia39@huawei.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Xu Jia <xujia39@huawei.com>
Cc: linux-hams@vger.kernel.org, pabeni@redhat.com, ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 17 Jun 2022 17:31:06 +0800 you wrote:
> Hulk Robot reports incorrect sp->rx_count_cooked value in decode_std_command().
> This should be caused by the subtracting from sp->rx_count_cooked before.
> It seems that sp->rx_count_cooked value is changed to 0, which bypassed the
> previous judgment.
> 
> The situation is shown below:
> 
> [...]

Here is the summary with links:
  - [v2] hamradio: 6pack: fix array-index-out-of-bounds in decode_std_command()
    https://git.kernel.org/netdev/net/c/2b04495e21cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


