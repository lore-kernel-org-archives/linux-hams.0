From: Guido Trentalancia <iz6rdb@trentalancia.net>
Subject: Soundmodem patch for AFSK operation a low bit-rates (2/2)
Date: Sun, 03 Apr 2016 18:05:03 +0200
Message-ID: <1459699503.8591.24.camel@trentalancia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hello.

Here is the latest version of a set of two patches for the soundmodem
application that I have created to fix AFSK operation at bit-rates
lower than 1200 baud (e.g. 300 baud for HF packet radio or APRS).

Patch 2/2 follows:

This patch might be useful for successful reception at 300 baud.

It uses longer RX tone filters (at the expense of CPU time).

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.net>
---
=A0afsk/modem.c |=A0=A0=A0=A02 +-
=A01 file changed, 1 insertion(+), 1 deletion(-)

--- soundmodem-0.16-orig2/afsk/modem.c	2016-01-31 15:54:04.345972364 +0=
100
+++ soundmodem-0.16/afsk/modem.c	2016-01-31 15:55:01.695779247 +0100
@@ -43,7 +43,7 @@
=A0 * Rx FIR Filter length is normally equal
=A0 * to 16. Longer filters require more CPU.
=A0 */
-#define RXFILTLEN=A0=A0=A0=A0=A0=A0=A016
+#define RXFILTLEN=A0=A0=A0=A0=A0=A0=A096
=A0
=A0#define RXFILTOVERBITS	3
=A0
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
