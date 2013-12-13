From: =?UTF-8?q?Salva=20Peir=C3=B3?= <speiro@ai2.upv.es>
Subject: =?UTF-8?q?=5BPATCH=5D=20hamradio/yam=3A=20fix=20info=20leak=20in=20ioctl?=
Date: Fri, 13 Dec 2013 08:46:07 +0100
Message-ID: <1386920767-27962-1-git-send-email-speiro@ai2.upv.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=upv.es; s=default;
	t=1386920778; bh=y46pUH9gy4ZYnUe3IA1S1HtHGXA/aZrGSq2G1vjbyTY=;
	h=From:To:Cc:Subject:Date;
	b=l68rCcAl3/FTMRuTovSv7yxHh1Hi4Sz+BTOv5xwYeZDyKmqL84w+i9LyI05X9nctN
	 vQIQePLF68ZcZWiZ5M88c53Skq0NqPC0TNeWONOgxUCnF9THPPfkqbRTJSk6pNSkmW
	 07XmBO+BppkBin+suJSnztLUQ1HH1TmMEMAOBpjZPMPcKuc1V1Iwa4PWrWaExUSTmU
	 HbWG6V4FLWWY0TjotN9YiCkTlGYJIJuh5ZH1UPlxKPDqTjG/7qRtYq4OsAPOCawu7C
	 El9HSzkqN633qPnDakTXKL09hb6Nc3kiuqZ+kuO5SrdB6B/Pz8tAN/QCiVgsTS5XXg
	 VAiDUSx7UzdyA==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-kernel@vger.kernel.org
Cc: security@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, Jean-Paul Roubelat <jpr@f6fbb.org>, =?UTF-8?q?Salva=20Peir=C3=B3?= <speiro@ai2.upv.es>, stable@vger.kernel.org

The yam_ioctl() code fails to initialise the cmd field
of the struct yamdrv_ioctl_cfg. Add an explicit memset(0)
before filling the structure to avoid the 4-byte info leak.

Signed-off-by: Salva Peir=C3=B3 <speiro@ai2.upv.es>
CC: <stable@vger.kernel.org>
---
 drivers/net/hamradio/yam.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 1971411..bb02c8a 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -953,6 +953,7 @@ static int yam_ioctl(struct net_device *dev, struct=
 ifreq *ifr, int cmd)
 	struct yamdrv_ioctl_mcs *ym;
 	int ioctl_cmd;
=20
+	memset(&yi, 0, sizeof(yi));
 	if (copy_from_user(&ioctl_cmd, ifr->ifr_data, sizeof(int)))
 		 return -EFAULT;
=20
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
