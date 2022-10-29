From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 1/2] MAINTAINERS: remove Thomas Sailer
Date: Sat, 29 Oct 2022 20:17:33 +0700
Message-ID: <20221029131734.616829-2-bagasdotme@gmail.com>
References: <20221029131734.616829-1-bagasdotme@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckPB35sVjBMDrzWuFBh75nHBRSgfYvA4i4irOYENsAM=;
        b=fva0Bo/VRBO8ULSBc8xV/73f3qNQ5jWX7brGy3h0mHzYfuiP1hui8CnAUcEad4YMZT
         3/nhUa1eZ3LknKtbrenWU7/uFYG4kdNDa5CWH/+gKyFZ082JtYrpZtaZEdhrtOx29Iv2
         Rjozbi+r2hK95+sED6lFLbwVvfwmrxbDB7D9nmej5+posns0StcID200ZcrJe2PZK70f
         eUjWu93aBe09ZLFSghEDNSftWwBNyhceIburFzEZFKxKh3LUGSHqdOMYdG8rmiTiYx4r
         y6RZbU24RyPenj7UfB4BvuMoDNChCT/N8qpylY4xc845X4mmFmle1uEpBvb+MIcgOv2K
         Y3EA==
In-Reply-To: <20221029131734.616829-1-bagasdotme@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=bagasdotme@gmail.com; h=from:subject; bh=lCAzbgb3aELI+YHQP6YBxPRDtkV84IvZ2WocqEA7ZA4=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMmx6u96vggyeX/lz3qhJvNy4VruHNOFf+I5xXnUE9bGn+Te fWJ7RykLgxgHg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZyVY3hr2QKU6qQXq4qn7RqyC1LiS zjJ2ZNn2LtC/KO9Um+23/LipFhv+/PkKiy+R3Xfk0/ofXElaG0sW+JrqTvIYGYdVtMmPbwAAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-media@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>

Emails to him at <t.sailer@alumni.ethz.ch> bounce (550 error). However,
he was already listed on CREDITS. Remove him from MAINTAINERS entry.

Also, mark BAYCOM/HDLCDRV DRIVERS FOR AX.25 as orphan (no maintainers
for the subsystem as of now).

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b655c704b5b813..63a84d3218a7b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3589,9 +3589,8 @@ F:	include/uapi/linux/batman_adv.h
 F:	net/batman-adv/
 
 BAYCOM/HDLCDRV DRIVERS FOR AX.25
-M:	Thomas Sailer <t.sailer@alumni.ethz.ch>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.baycom.org/~tom/ham/ham.html
 F:	drivers/net/hamradio/baycom*
 
-- 
An old man doll... just what I always wanted! - Clara

