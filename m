From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] MAINTAINERS: drop few inactive maintainers
Date: Sat, 29 Oct 2022 20:17:32 +0700
Message-ID: <20221029131734.616829-1-bagasdotme@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g04ee0HphqFzosV+F5fBEaDnPcHUqbW/sFQYscbMOo4=;
        b=cgjMdG6MEsmiqYblD4knpeZR/WA3RkYTWzA7AZuTLM/1bOmwJAn/4Bzgb7rm6RNsuR
         vMdnkyJzaYNx2kKfl95AUU5WTPnYpfCY9hdQmCYTs93xAAW/iEhl5VxK2lrIR12+gAwT
         tfJ2304w8mNsFgXornNBYpnIh/KGGmuOtnaT8zr7kLJCg/OpKBaQLHRlIwqINFK9l2gx
         WbpzXGAn7/ozG6p7ROylpIyIBaDBACWtqU7+ykeHLeDyGpf1quelHGtcUd0VSBTouoME
         hAVcjj9FYy8TMddZb0wclFOUoEAYgAkHBI0sWYYs4rVVFWaTMMkNrfGyXnIwL5Xt8W+t
         VpDA==
X-Developer-Signature: v=1; a=openpgp-sha256; l=548; i=bagasdotme@gmail.com; h=from:subject; bh=8iIY2mtCrdFuMDanbYZmMfsW1yeqkwuHLgNWhJMIF80=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMmx6i++6LRMlF9zTCPyzvX8NufbIZEzRbOfBzvf1TJcukzn +6aIjlIWBjEOBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExkaw7D/xSnwEf/vrNVrWyo/WcQun wa98al+yIP6/o2xvqaz3OfZsbwT5G9muGm17oHFy2WXDQKOGsZYJ2uU2wrPO38USGhXc3JTAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-media@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>

As soon as I sent review replies in recent days, I noticed that my
emails to few maintainers bounced. I discovered that they weren't active
anymore, so let's drop them from MAINTAINERS so that people won't send
emails to them and get bounced.

Bagas Sanjaya (2):
  MAINTAINERS: remove Thomas Sailer
  MAINTAINERS: drop Liam Mark and Laura Abbott

 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)


base-commit: fd8dab197cca2746e1fcd399a218eec5164726d4
-- 
An old man doll... just what I always wanted! - Clara

