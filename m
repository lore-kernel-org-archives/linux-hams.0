From: Con Kolivas <kernel@kolivas.org>
Subject: Re: [PATCH] 2.5.75 6PACK
Date: Sat, 26 Jul 2003 16:46:56 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307261646.56309.kernel@kolivas.org>
References: <3F221B53.7000504@privacy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F221B53.7000504@privacy.net>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hajohe@imail.de, Hans-Joachim Hetscher <me@privacy.net>, linux-kernel@vger.kernel.org
Cc: linux-hams@vger.kernel.org

integer space should use:

On Sat, 26 Jul 2003 16:10, Hans-Joachim Hetscher wrote:
+#define SIXP_TXDELAY                   0.25*HZ /* in 1 s */

HZ/4

+#define SIXP_SLOTTIME                  0.1*HZ  /* in 1 s */

HZ/10

+#define SIXP_INIT_RESYNC_TIMEOUT       1.5*HZ  /* in 1 s */

HZ*3/2

no?

Con

