From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v4] netrom: Fix use-after-free caused by accept on already
 connected socket
Date: Mon, 30 Jan 2023 07:40:16 +0000
Message-ID: <167506441623.19672.3737671367502579587.git-patchwork-notify@kernel.org>
References: <20230127023250.GA71840@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675064416;
        bh=8yVisn/1+2M3nRRRBQrIsODeQaLdwjW82PLGIyzKcXA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=p2YFUo49qUZPvGwkucOLcXGuVnqYFYJRBeuz8m22lAaRkBNOV4vuEfLQY0frgybNq
         GaqitSzTzKYILGx97UEoq6UAdUYEn6wcbW2Td7AuWnY/DLJy21zv1QTucYT/DObAD2
         ILEFUh7xHTp2PyK6u0UczLseP9Yz40Fpo6FeNajFGcJ28daSBgDs3x5HlVHms64XdL
         LSGbMLenj5MKsammniCgGdmdmQYQBv5mA0rAoUPbRQIyDDMj8U8CnFpFnOUIuQ0nfu
         +KHFv3505CqIdyr0lHhFyZezguo1DTBX9gMkJTgHtw6HA9+3hy4nWx4SJccTBnop3f
         cI0VUPnmvE63w==
In-Reply-To: <20230127023250.GA71840@ubuntu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hyunwoo Kim <v4bel@theori.io>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, kuniyu@amazon.com, imv4bel@gmail.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, syzbot+caa188bdfc1eeafeb418@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 26 Jan 2023 18:32:50 -0800 you wrote:
> If you call listen() and accept() on an already connect()ed
> AF_NETROM socket, accept() can successfully connect.
> This is because when the peer socket sends data to sendmsg,
> the skb with its own sk stored in the connected socket's
> sk->sk_receive_queue is connected, and nr_accept() dequeues
> the skb waiting in the sk->sk_receive_queue.
> 
> [...]

Here is the summary with links:
  - [v4] netrom: Fix use-after-free caused by accept on already connected socket
    https://git.kernel.org/netdev/net/c/611792920925

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


