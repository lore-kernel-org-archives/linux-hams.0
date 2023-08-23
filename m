From: eadavis@sina.com
Subject: Re: [PATCH] sock: Fix sk_sleep return invalid pointer
Date: Wed, 23 Aug 2023 08:19:10 +0800
Message-ID: <20230823001910.1943703-1-eadavis@sina.com>
References: <f80fcd476a230c354bf9758762250c43a1f3d5cc.camel@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev+bounces-29826-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
In-Reply-To: <f80fcd476a230c354bf9758762250c43a1f3d5cc.camel@redhat.com>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pabeni@redhat.com
Cc: davem@davemloft.net, edumazet@google.com, hdanton@sina.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzbot+666c97e4686410e79649@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com, Edward AD <eadavis@sina.com>

From: Edward AD <eadavis@sina.com>

On Tue, 22 Aug 2023 17:31:00 +0200, pabeni@redhat.com wrote:
> > From: Edward AD <eadavis@sina.com>
> > 
> > The parameter sk_sleep(sk) passed in when calling prepare_to_wait may 
> > return an invalid pointer due to nr-release reclaiming the sock.
> > Here, schedule_timeout_interruptible is used to replace the combination 
> > of 'prepare_to_wait, schedule, finish_wait' to solve the problem.
> > 
> > Reported-and-tested-by: syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
> > Signed-off-by: Edward AD <eadavis@sina.com>
> 
> This looks wrong. No syscall should race with sock_release(). It looks
> like you are papering over the real issue.
> 
> As the reproducer shows a disconnect on an connected socket, I'm wild
> guessing something alike 4faeee0cf8a5d88d63cdbc3bab124fb0e6aed08c
> should be more appropriate.
There is insufficient evidence to prove where the current report provided by 
syz caused 'sk_sleep()' to return an invalid pointer.
So, the above statement is my guess.

