From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] sock: Fix sk_sleep return invalid pointer
Date: Tue, 22 Aug 2023 17:31:00 +0200
Message-ID: <f80fcd476a230c354bf9758762250c43a1f3d5cc.camel@redhat.com>
References: <000000000000e6c05806033522d3@google.com>
	 <20230822124419.1838055-1-eadavis@sina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev+bounces-29689-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692718266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqLO2V0ZPwoCiwmUHn1tH4GQt5T66HZTGlrG692z+68=;
	b=CsYnvAotBGwAq4d+OsW9ZNCQhC2EqNRKNfYqJofLdcUPa9j0a572E8TQU/xT35vAsX3Kdv
	9ixgh2YRKqqH7W7FoDbmjV3NheAFffOoTlMa9/k0B3PuslIA6OOJOSxbTHPsNaRadr+mNe
	rqKSBecuQipNUEGGp3XxXPVCgXH95uU=
In-Reply-To: <20230822124419.1838055-1-eadavis@sina.com>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eadavis@sina.com, syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, hdanton@sina.com

On Tue, 2023-08-22 at 20:44 +0800, eadavis@sina.com wrote:
> From: Edward AD <eadavis@sina.com>
>=20
> The parameter sk_sleep(sk) passed in when calling prepare_to_wait may=20
> return an invalid pointer due to nr-release reclaiming the sock.
> Here, schedule_timeout_interruptible is used to replace the combination=
=20
> of 'prepare_to_wait, schedule, finish_wait' to solve the problem.
>=20
> Reported-and-tested-by: syzbot+666c97e4686410e79649@syzkaller.appspotmail=
.com
> Signed-off-by: Edward AD <eadavis@sina.com>

This looks wrong. No syscall should race with sock_release(). It looks
like you are papering over the real issue.

As the reproducer shows a disconnect on an connected socket, I'm wild
guessing something alike 4faeee0cf8a5d88d63cdbc3bab124fb0e6aed08c
should be more appropriate.

Cheers,

Paolo


