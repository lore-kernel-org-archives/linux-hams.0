Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FAF3783CC
	for <linux-hams@vger.kernel.org>; Wed, 11 Mar 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212788; cv=none; b=g3IfgAgX/PlXhphFnP5iKz9F8p9zL+tVqLnqk7PzuXMc8tux55mOWlDA7ERVCel73i6+zSdCyGhJ2v6kvRSrYN2h9V5RE8WAqF/GH2wCdeiK15ZkKuYDvZ51DFv0VOdvMEibnA22R/3a3zyKcANZ4Cfg8YzY77vRa0LNDQdFeU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212788; c=relaxed/simple;
	bh=fDoXbQjgWEGw9tvqtPVdOHqQWf6S2QPStECJ9pYJGnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAHqTOVU9vEakUW7pHNDzKTB9AbLUlxaNaKObPxS3WSPw+9T/5su95C9Cd7dYkYZOjoSGlAX5kJoUdi/c+7eOCOvE9ZyrmSaLxJnz+aNRmOyXrgzZdYwQ1i/EBiXUFTC2ODRtv18zjLje+Wyiz5ln9lOsat/OyiKg//Z7jdjiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eYDsJlyA; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eYDsJlyA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773212783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0CXo0x7BiCEEpnzU+2Ow+NXjhaBWC/PdinzAYFVwnT4=;
	b=eYDsJlyAQL5W9YiEJCWmAM0miLOaFxYlN6EA8vgkobqFWoM5Hf6U7hq/EPjdZBaO/oxRWv
	tuTLvtBNIszAb22CuEUHpUJ680fdStt3f8/3/2MnOXaDqTK3cEoY6Jy3RzqUupUlOkJ0V+
	XWrd1wgl15XdhwgnIrdmOws3hrfxc70=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com,
	Eric Dumazet <edumazet@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Takamitsu Iwai <takamitz@amazon.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	Pwnverse <stanksal@purdue.edu>,
	Ingo Molnar <mingo@kernel.org>,
	linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/rose: fix NULL pointer dereference in rose_transmit_link on reconnect
Date: Wed, 11 Mar 2026 15:06:02 +0800
Message-ID: <20260311070611.76913-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

syzkaller reported a bug [1], and the reproducer is available at [2].

ROSE sockets use four sk->sk_state values: TCP_CLOSE, TCP_LISTEN,
TCP_SYN_SENT, and TCP_ESTABLISHED. rose_connect() already rejects
calls for TCP_ESTABLISHED (-EISCONN) and TCP_CLOSE with SS_CONNECTING
(-ECONNREFUSED), but lacks a check for TCP_SYN_SENT.

When rose_connect() is called a second time while the first connection
attempt is still in progress (TCP_SYN_SENT), it overwrites
rose->neighbour via rose_get_neigh(). If that returns NULL, the socket
is left with rose->state == ROSE_STATE_1 but rose->neighbour == NULL.
When the socket is subsequently closed, rose_release() sees
ROSE_STATE_1 and calls rose_write_internal() ->
rose_transmit_link(skb, NULL), causing a NULL pointer dereference.

Per connect(2), a second connect() while a connection is already in
progress should return -EALREADY. Add this missing check for
TCP_SYN_SENT to complete the state validation in rose_connect().

[1] https://syzkaller.appspot.com/bug?extid=d00f90e0af54102fb271
[2] https://gist.github.com/mrpre/9e6779e0d13e2c66779b1653fef80516

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/69694d6f.050a0220.58bed.0027.GAE@google.com/T/
Suggested-by: Eric Dumazet <edumazet@google.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 net/rose/af_rose.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 841d62481048..ba56213e0a2a 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -811,6 +811,11 @@ static int rose_connect(struct socket *sock, struct sockaddr_unsized *uaddr, int
 		goto out_release;
 	}
 
+	if (sk->sk_state == TCP_SYN_SENT) {
+		err = -EALREADY;
+		goto out_release;
+	}
+
 	sk->sk_state   = TCP_CLOSE;
 	sock->state = SS_UNCONNECTED;
 
-- 
2.43.0

