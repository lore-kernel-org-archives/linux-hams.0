From: Francois Romieu <romieu@fr.zoreil.com>
Subject: [PATCH net-next 1/1] MAINTAINERS: update amateur radio status.
Date: Thu, 18 Aug 2022 22:20:24 +0200
Message-ID: <Yv6fCCB3vW++EGaP@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 27IKKQjF2765878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1660854026;
        bh=lW65DDWl1Jdxk9iycgYWgAWipBLdfd5gVplN3DTCx44=;
        h=Date:From:To:Cc:Subject:From;
        b=Z9l8OCA9SpxhUVVJBPCgVbBT4mBaWapxTTsjn7C9wi2ygM+suopNJVDngesS+W2UC
         I74rGN5FOcXwAZ1bpnOOBFlMdYmO6PGtQfXUbwjmogUN0xhHF+dTMNrzz9w/9C6jn3
         UFJ0yf/pI6mx89jBljSBinmrseuXyK4ieD2W12ww=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Bernard Pidoux <f6bvp@free.fr>, Thomas Osterried <thomas@osterried.de>

There is still useful work in the linux kernel amateur radio area but
it should not hurt to align advertised expectations in MAINTAINERS file
with Ralf Baechle's stance from 2021/07/17.

Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
Link: https://marc.info/?l=linux-hams&m=162651322506623
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2d64020399b..691aa4e84537 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3436,7 +3436,7 @@ F:	drivers/iio/adc/hx711.c
 AX.25 NETWORK LAYER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Odd Fixes
 W:	http://www.linux-ax25.org/
 F:	include/net/ax25.h
 F:	include/uapi/linux/ax25.h
@@ -14074,7 +14074,7 @@ F:	net/netfilter/
 NETROM NETWORK LAYER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Odd Fixes
 W:	http://www.linux-ax25.org/
 F:	include/net/netrom.h
 F:	include/uapi/linux/netrom.h
@@ -17640,7 +17640,7 @@ F:	include/linux/mfd/rohm-shared.h
 ROSE NETWORK LAYER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Odd Fixes
 W:	http://www.linux-ax25.org/
 F:	include/net/rose.h
 F:	include/uapi/linux/rose.h
-- 
2.37.1

