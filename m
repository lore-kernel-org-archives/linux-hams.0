From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v3] net/rose: Fix to not accept on connected socket
Date: Sat, 28 Jan 2023 08:40:17 +0000
Message-ID: <167489521752.20245.5567947233486771877.git-patchwork-notify@kernel.org>
References: <20230125105944.GA133314@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674895217;
        bh=5DtihC7IDWg5Cik8Koa582mUpiA0AhfmuQ356hSeT8M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZJwRTt1zuum2KUQa62leQbyxsieOkueQThLebDT+kOalB2eclUNse3asoy8ISew0L
         mJNlQpJ0nkfd6XzokDSouhhR32HYSs9QC1AVPq1lmo6q8AL02TMmC+O6Xetasc5dYW
         tSpenVS2uCb2yN1yhTPHsZW4Z9fXKt98fslKgdZ8m2P16ULl5jKnklbahkEF+gBWT4
         30eJ1qhth/ihfYnII/9n+XtM2CUBhbdQJ4PeOoCrb0zv0gxPSrIK+TJNpQFJA2oyNT
         l86jkW2dMi/iSRpqJKLy5G7CU+mElFnwvit7a9opOz40OOLoa2SBc72GUdjqd2E+T7
         Vdf64tSKZg75g==
In-Reply-To: <20230125105944.GA133314@ubuntu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hyunwoo Kim <v4bel@theori.io>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, kuniyu@amazon.com, imv4bel@gmail.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Jan 2023 02:59:44 -0800 you wrote:
> If you call listen() and accept() on an already connect()ed
> rose socket, accept() can successfully connect.
> This is because when the peer socket sends data to sendmsg,
> the skb with its own sk stored in the connected socket's
> sk->sk_receive_queue is connected, and rose_accept() dequeues
> the skb waiting in the sk->sk_receive_queue.
> 
> [...]

Here is the summary with links:
  - [v3] net/rose: Fix to not accept on connected socket
    https://git.kernel.org/netdev/net/c/14caefcf9837

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


