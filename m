From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net v5] net: ax25: Fix deadlock caused by skb_recv_datagram in
 ax25_recvmsg
Date: Wed, 15 Jun 2022 12:20:13 +0000
Message-ID: <165529561325.20387.9560588021294882995.git-patchwork-notify@kernel.org>
References: <20220614092557.6713-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655295613;
        bh=eDPWJ22K5Yb0l4NNxcNbEGmohnUi3JOvIlFiu925Tp8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HblmdovLimj0OLJSV+33FXd9CEZCXH4qIDgEpnL57XEGg0SuXURAmEhxwUFWAfDDM
         8Y/IJert6xQaeTG4amu0DStjL4SFCl03TW7X67sM1ZIr56seVgOuxsEA7mqBs+YOOo
         injtJwjKiAtrE96PyzYQ7fTqa/FfCaBraL2fZcz1RfEJvDe/o4tvQr6IMWx9se98Tj
         I0j0bXfilGLg2MD0PVwjBM99I/DfdifXwiYBIUBdsOaOxJUF7LlIfU0HA7PGJtOoQ0
         5YqZWp3ER22F7qCxhoM790wND2bsBxILzt3+I6RM4YEZNAnlwdLvamcxyKFgVIXoyd
         d3Mrh2GIwQMjw==
In-Reply-To: <20220614092557.6713-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, pabeni@redhat.com, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, thomas@osterried.de

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 14 Jun 2022 17:25:57 +0800 you wrote:
> The skb_recv_datagram() in ax25_recvmsg() will hold lock_sock
> and block until it receives a packet from the remote. If the client
> doesn`t connect to server and calls read() directly, it will not
> receive any packets forever. As a result, the deadlock will happen.
> 
> The fail log caused by deadlock is shown below:
> 
> [...]

Here is the summary with links:
  - [net,v5] net: ax25: Fix deadlock caused by skb_recv_datagram in ax25_recvmsg
    https://git.kernel.org/netdev/net/c/219b51a6f040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


