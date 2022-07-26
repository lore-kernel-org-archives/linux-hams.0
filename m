From: Bernard Pidoux <f6bvp@free.fr>
Subject: [PATCH 1/1] [PATCH] net: rose: fix unregistered netdevice: waiting for rose0 to become free
Date: Tue, 26 Jul 2022 20:25:18 +0200
Message-ID: <20220726182518.47047-1-f6bvp@free.fr>
References: <20220722103750.1938776d@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eL31OvkZUAyrlwyFeqU3KWReKbezeGtO4fmJhiZIKUA=;
        b=DKgRAQAljMzRejI/Iqoga92jt8KLooDGUU6w8bP4NnAmJnWUunCKzdjPeIzvUD+z6H
         cex/ymmOE78UU9o3QQYKjLKubtveotwoxyj2bU2AKsdvcQri4l/Z0v56/MycUMxhKRrc
         aTR7mdaYI8TEttUhnB87s52+opS7LKPRsMQsiO4pxk3EAOqwMzQgabhiz0Du/woaK9ph
         rpKIW7KFoo/hIFZukktgmGPiYllpv4MRIpcn0VAusqF7pahO4Hn/S0QbS/2d6xskm7Qq
         d+7WXydc1INdzUNifqP/0wvAslRxpMFbtkgebTfmlCMQbafUsSRpZwDP1Ig2U7k2ZSob
         NTDQ==
Sender: Bernard Pidoux <bernard.f6bvp@gmail.com>
In-Reply-To: <20220722103750.1938776d@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kuba@kernel.org
Cc: davem@davemloft.net, duoming@zju.edu.cn, edumazet@google.com, f6bvp@free.fr, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

Here is the context.

This patch adds dev_put(dev) in order to allow removal of rose module
after use of AX25 and ROSE via rose0 device.

Otherwise when trying to remove rose module via rmmod rose an infinite
loop message was displayed on all consoles with xx being a random number.

unregistered_netdevice: waiting for rose0 to become free. Usage count = xx

unregistered_netdevice: waiting for rose0 to become free. Usage count = xx

...

With the patch it is ok to rmmod rose.

This bug appeared with kernel 4.10 and has been only partially repaired by adding two dev_put(dev).

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>

---
 net/rose/af_rose.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index bf2d986a6bc3..4163171ce3a6 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -711,6 +711,8 @@ static int rose_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 	rose_insert_socket(sk);
 
 	sock_reset_flag(sk, SOCK_ZAPPED);
+	
+	dev_put(dev);
 
 	return 0;
 }
-- 
2.34.1

[master da21d19e920d] [PATCH] net: rose: fix unregistered netdevice: waiting for rose0 to become free
 Date: Mon Jul 18 16:23:54 2022 +0200
 1 file changed, 2 insertions(+)

