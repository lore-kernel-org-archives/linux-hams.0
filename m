From: Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds read in ax25_connect()
Date: Wed, 22 Jul 2020 11:19:01 -0400
Message-ID: <20200722151901.350003-1-yepeilin.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mC+9VCisrQOLG6kTWdRwYqg9YnRsNnWuSWD6BGUaBPU=;
        b=FZ8HekGeo5ShXhCW8K3Qz+diyX/yNtoMBwYcfNlQOkYqwJMOBDgkjjnrXxMcFytvl0
         EUX2omBZVUM4mZLAJv89P8Bsab6RM96iDKoWFBid86ut6Rknmzs9hd4FivGcc5tzWmQe
         WPpqaU6RcomIDNnm5zy7m/x16lXpOcKVuJ8icY/dPG9fNcMZwDbSClIimXXW4FeW0x/k
         sYD9XbJqXHFmkDNHbxUi39CWdyXfFfd2joCrE6kn+tBk1FIU6AqzTvCiRBhFHukdqTv/
         A/2auoshCGbIidQlhZt5lalBFxNltjZZYOPyxB0qTqMD5DqmgL5eZl/75YGNCnWB3mq1
         /gDg==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
equals to 7 or 8. Fix it.

This issue has been reported as a KMSAN uninit-value bug, because in such
a case, ax25_connect() reaches into the uninitialized portion of the
`struct sockaddr_storage` statically allocated in __sys_connect().

It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
`addr_len` is guaranteed to be less than or equal to
`sizeof(struct full_sockaddr_ax25)`.

Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/ax25/af_ax25.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fd91cd34f25e..ef5bf116157a 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
 	if (addr_len > sizeof(struct sockaddr_ax25) &&
 	    fsa->fsa_ax25.sax25_ndigis != 0) {
 		/* Valid number of digipeaters ? */
-		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
+		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
+		    addr_len < sizeof(struct sockaddr_ax25) +
+		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
 			err = -EINVAL;
 			goto out_release;
 		}
-- 
2.25.1

