From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v1 net] netrom: Deny concurrent connect().
Date: Mon, 28 Aug 2023 06:00:22 +0000
Message-ID: <169320242276.13305.1320954627222633912.git-patchwork-notify@kernel.org>
References: <20230824165059.90977-1-kuniyu@amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev+bounces-30978-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693202422;
	bh=5KbFWcWekHL941V4FhYf9bpTanNDHKceogKpRkcxYEw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ADpbnU1aeyJE5JeFkYxpPBYlxFKJCobc+BcSX5uYzvVPZFuLakz029J1PhwyBJ52r
	 Lw9ySXNBIvbpEqh8KeWgb395vpEJ6ep21ZxOdWj1O9OO4HSipy/aNKgg2RtZ5+zEA0
	 n+a5L3DMlbGf3MBbQjirFj+0TmcgbI10LFqj282Ybd9Cee9Ed7vZmWBO5iwC26s3ds
	 k2mfIY68QmIEIXizwCme6xDrt+WWDlvppJvHs+VgzfiEHo6zKpWG8QwehKNWXs236R
	 Yn20PcakwXaFjOtNTcB5PUyLiSfikEulYHD4xQOcK3axUVyoMhCUyOKscmXygyz211
	 KgelQYU/FpRWg==
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
In-Reply-To: <20230824165059.90977-1-kuniyu@amazon.com>
Content-Type: text/plain; charset="us-ascii"
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, kuni1840@gmail.com, netdev@vger.kernel.org, linux-hams@vger.kernel.org, syzbot+666c97e4686410e79649@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 24 Aug 2023 09:50:59 -0700 you wrote:
> syzkaller reported null-ptr-deref [0] related to AF_NETROM.
> This is another self-accept issue from the strace log. [1]
> 
> syz-executor creates an AF_NETROM socket and calls connect(), which
> is blocked at that time.  Then, sk->sk_state is TCP_SYN_SENT and
> sock->state is SS_CONNECTING.
> 
> [...]

Here is the summary with links:
  - [v1,net] netrom: Deny concurrent connect().
    https://git.kernel.org/netdev/net/c/c2f8fd794960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



