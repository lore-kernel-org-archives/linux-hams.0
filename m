From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 6/7] Documentation: networking: ipvs-sysctl: drop doubled word
Date: Fri,  3 Jul 2020 15:41:14 -0700
Message-ID: <20200703224115.29769-7-rdunlap@infradead.org>
References: <20200703224115.29769-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=tXTORDjKReqxN7kDuNO2GWoH6pce8OagQ31i7ZlAjjc=; b=pr0ZNGvKNTlhSjwPK/aSqPF7hV
        iYiwMPfYwUkZmbXAtent/U9GlSIqpIhV1fApaKB+J4uroR3fxS3UyIqgu8f4ILyd4l+LaJJHcotNW
        wXw308EI4Jx4kRQ/gDWExsHA3Se7Uxen4GIuu2Lxr4z0ENFUYpD5Ynpi4aJ7EHByPnEnq5v1z7vXN
        wSpQlq5//D+MT8aPGejFvH5jwxYAfaRJnfRO1n7uRo01Sv3GWvH/77C86NiiWLDf9mOYehLACcqAh
        Zl1TSVDLK/nfxeFQpzasHBACTPrrAPCFTGah5eBRwizHm4/3RpL5RHC+0VUkNMlKPhXN2FeuqZ0BG
        iMXHbQWA==;
In-Reply-To: <20200703224115.29769-1-rdunlap@infradead.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org

Drop the doubled word "that".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
---
 Documentation/networking/ipvs-sysctl.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/networking/ipvs-sysctl.rst
+++ linux-next-20200701/Documentation/networking/ipvs-sysctl.rst
@@ -114,7 +114,7 @@ drop_entry - INTEGER
 	modes (when there is no enough available memory, the strategy
 	is enabled and the variable is automatically set to 2,
 	otherwise the strategy is disabled and the variable is set to
-	1), and 3 means that that the strategy is always enabled.
+	1), and 3 means that the strategy is always enabled.
 
 drop_packet - INTEGER
 	- 0  - disabled (default)
