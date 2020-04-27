From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 07/38] docs: networking: convert ax25.txt to ReST
Date: Tue, 28 Apr 2020 00:01:22 +0200
Message-ID: <d31c24b630ad1b2b43a192689c5926e2e2e5978f.1588024424.git.mchehab+huawei@kernel.org>
References: <cover.1588024424.git.mchehab+huawei@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588024916;
        bh=sAZ/O2zdcyNp3hYa0dOFdYg2wRWDs461rvytxvnBq+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XYDgAAeD1+15BIN62/BImoK2Ig+LC4dVMR7YfXZZzXiZGDyuJ1GoXtE/plxwV8Lm/
         BrBIwZqnFnV9lbNc8TQ7pqGefBV1KfnuBCl0p5iM5AvV3x3mV/M+bBqPoiG0YDmCoL
         vylwBr2nURCLVh04/DewtEOiv2GXzpM0rKlOtXAo=
In-Reply-To: <cover.1588024424.git.mchehab+huawei@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, netdev@vger.kernel.org, linux-hams@vger.kernel.org

There isn't much to be done here. Just:

- add SPDX header;
- add a document title.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/networking/{ax25.txt => ax25.rst} | 6 ++++++
 Documentation/networking/index.rst              | 1 +
 net/ax25/Kconfig                                | 6 +++---
 3 files changed, 10 insertions(+), 3 deletions(-)
 rename Documentation/networking/{ax25.txt => ax25.rst} (91%)

diff --git a/Documentation/networking/ax25.txt b/Documentation/networking/ax25.rst
similarity index 91%
rename from Documentation/networking/ax25.txt
rename to Documentation/networking/ax25.rst
index 8257dbf9be57..824afd7002db 100644
--- a/Documentation/networking/ax25.txt
+++ b/Documentation/networking/ax25.rst
@@ -1,3 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====
+AX.25
+=====
+
 To use the amateur radio protocols within Linux you will need to get a
 suitable copy of the AX.25 Utilities. More detailed information about
 AX.25, NET/ROM and ROSE, associated programs and and utilities can be
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 841f3c3905d5..6a5858b27cf6 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -42,6 +42,7 @@ Contents:
    arcnet-hardware
    arcnet
    atm
+   ax25
 
 .. only::  subproject and html
 
diff --git a/net/ax25/Kconfig b/net/ax25/Kconfig
index 043fd5437809..97d686d115c0 100644
--- a/net/ax25/Kconfig
+++ b/net/ax25/Kconfig
@@ -40,7 +40,7 @@ config AX25
 	  radio as well as information about how to configure an AX.25 port is
 	  contained in the AX25-HOWTO, available from
 	  <http://www.tldp.org/docs.html#howto>. You might also want to
-	  check out the file <file:Documentation/networking/ax25.txt> in the
+	  check out the file <file:Documentation/networking/ax25.rst> in the
 	  kernel source. More information about digital amateur radio in
 	  general is on the WWW at
 	  <http://www.tapr.org/>.
@@ -88,7 +88,7 @@ config NETROM
 	  users as well as information about how to configure an AX.25 port is
 	  contained in the Linux Ham Wiki, available from
 	  <http://www.linux-ax25.org>. You also might want to check out the
-	  file <file:Documentation/networking/ax25.txt>. More information about
+	  file <file:Documentation/networking/ax25.rst>. More information about
 	  digital amateur radio in general is on the WWW at
 	  <http://www.tapr.org/>.
 
@@ -107,7 +107,7 @@ config ROSE
 	  users as well as information about how to configure an AX.25 port is
 	  contained in the Linux Ham Wiki, available from
 	  <http://www.linux-ax25.org>.  You also might want to check out the
-	  file <file:Documentation/networking/ax25.txt>. More information about
+	  file <file:Documentation/networking/ax25.rst>. More information about
 	  digital amateur radio in general is on the WWW at
 	  <http://www.tapr.org/>.
 
-- 
2.25.4

