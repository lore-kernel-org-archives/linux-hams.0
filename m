From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 7/7] Documentation: networking: rxrpc: drop doubled word
Date: Fri,  3 Jul 2020 15:41:15 -0700
Message-ID: <20200703224115.29769-8-rdunlap@infradead.org>
References: <20200703224115.29769-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-can-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=TAp3JUpjIiZsCTuD68uTFJYctH0j2Yfl3aOkxNVpu7Q=; b=RJu03bKQuPnLQmqq/UbgVU06J8
        zyAPPrOYy8P+OOwmfWIGItapl8m2nbK7JxET098GzJwpM3IMoLUb8g1fioN+AB76/Oqk8HDpdnC8s
        psRJQuhlRWWGD8XLWMZ7JfggCW2fO794OUTk77eAicYjpIsEEDFNlwP25RkssjsOGwGZjXYNJpr5d
        eB1E05MhwwIY4sO3p50F2hJcJGtcq3cReftgUaTnv7pVuU8SMWtAET0CA0avhTb/4NQO3AyBkJxVv
        +A9RSbSH87bDmoLcgoL9L4MsE5X0W2BS2qcllV1NFdTqT+WUwG+gIy6UawYFfkSmqtxI8CAXeWutu
        5rxW9i2w==;
In-Reply-To: <20200703224115.29769-1-rdunlap@infradead.org>
Sender: linux-can-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org

Drop the doubled word "have".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org
---
 Documentation/networking/rxrpc.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/networking/rxrpc.rst
+++ linux-next-20200701/Documentation/networking/rxrpc.rst
@@ -186,7 +186,7 @@ About the AF_RXRPC driver:
      time [tunable] after the last connection using it discarded, in case a new
      connection is made that could use it.
 
- (#) A client-side connection is only shared between calls if they have have
+ (#) A client-side connection is only shared between calls if they have
      the same key struct describing their security (and assuming the calls
      would otherwise share the connection).  Non-secured calls would also be
      able to share connections with each other.
