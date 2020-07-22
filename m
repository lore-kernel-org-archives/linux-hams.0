From: Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net] AX.25: Prevent out-of-bounds read in ax25_sendmsg()
Date: Wed, 22 Jul 2020 12:05:12 -0400
Message-ID: <20200722160512.370802-1-yepeilin.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=inXRPYgND6+0WE39IDvE6wldzJTBYfDxX/wQ/vOfPn0=;
        b=a8k1mfHuBtctSv/v34AEQtJKDDMJsmzgQiLNEMGt4v2xwXaP9+GEfP4S+dVZi9N5cm
         StZ5VmZHe2C9KFpm5eofHmXUSvhi240cLFMIKR7UoqZ+KwFyYOXEZdIAbWrh7WAmVu4o
         7OcBxIEmwji96oE6vzBnqIvyyolTXj+IlHB/WVPIq0FWjRTz4zKz9GVi7/uWcYDDWFeu
         OqcdP+yyS4UEjao+xsT+J2XbAySKFfuFsUPmlbi8SM84zy/p3CExBuMfJQ6sk2CPMnnJ
         cKxPqrDOJnOgIQyJ2xBQ9c6B2wlAss8VNk//84EIuIgbdRYnnERBUNuz5E6J9LoAwTOu
         bSAg==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Checks on `addr_len` and `usax->sax25_ndigis` are insufficient.
ax25_sendmsg() can go out of bounds when `usax->sax25_ndigis` equals to 7
or 8. Fix it.

It is safe to remove `usax->sax25_ndigis > AX25_MAX_DIGIS`, since
`addr_len` is guaranteed to be less than or equal to
`sizeof(struct full_sockaddr_ax25)`

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/ax25/af_ax25.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index ef5bf116157a..0862fe49d434 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1509,7 +1509,8 @@ static int ax25_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 			struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)usax;
 
 			/* Valid number of digipeaters ? */
-			if (usax->sax25_ndigis < 1 || usax->sax25_ndigis > AX25_MAX_DIGIS) {
+			if (usax->sax25_ndigis < 1 || addr_len < sizeof(struct sockaddr_ax25) +
+			    sizeof(ax25_address) * usax->sax25_ndigis) {
 				err = -EINVAL;
 				goto out;
 			}
-- 
2.25.1

