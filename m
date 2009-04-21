From: Roel Kluin <roel.kluin@gmail.com>
Subject: ax25: non working tests on unsigned ax25_ctl.arg
Date: Tue, 21 Apr 2009 14:55:23 +0200
Message-ID: <49EDC23B.4070900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=6iArn+qD2Dg+2zTuU8eJUdtZ19jZ3tAH3eqNrquDn5U=;
        b=x971VMY/sq4xO4RbNxKu5302TlPIT/gXqoGuibe4qW5IUipOALgVO/dKRxRRWd6vXY
         S9Mh1kjLcpQxlAYf5pNnnDgjmFXa84Y6BCdQgO6lzHEVM9BwO3L5oH1tuXO8ywttEhb5
         CNzsbUmOz9osk0DmWZaOP4ztFhs7oy/VVjhtE=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jreuter@yaina.de, linux-hams@vger.kernel.org

vi include/linux/ax25.h +77
and note that ax25_ctl.arg is unsigned, should there maybe be a test

if (ax25_ctl.arg > MAX)
	return -EINVAL;

(and what should MAX be then?)

Otherwise you may want to apply the cleanup patch below

Roel
------------------------------>8-------------8<---------------------------------
Remove redundant tests on unsigned

Signed-off-by: Roel Kluin <roel.kluin@gmail.com> 
---
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index fd9d06f..9964df3 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -418,14 +418,10 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
 		break;
 
 	case AX25_T3:
-		if (ax25_ctl.arg < 0)
-			return -EINVAL;
 		ax25->t3 = ax25_ctl.arg * HZ;
 		break;
 
 	case AX25_IDLE:
-		if (ax25_ctl.arg < 0)
-			return -EINVAL;
 		ax25->idle = ax25_ctl.arg * 60 * HZ;
 		break;
 
