From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 2/3] MAINTAINERS: Update link for linux-ax25.org
Date: Sun, 17 Sep 2023 15:30:10 +0000
Message-ID: <20230917152938.8231-3-peter@n8pjl.ca>
References: <20230908113907.25053-1-peter@n8pjl.ca> <20230917152938.8231-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1694964617; x=1695223817;
        bh=14a9JoTKwLBMDvvPJuVuwcY6tE34u5ZiJcBdjh1EBjs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=s3TKwkmP5NMSXdFWXqh9NdWO5SVB0dgZaLDt2OO+ojJ/vDgcPXGJk4R3p9RCtLc5U
         v6vi3Q37GVzkrKkxlpSut4qpHKC1zlGQRlSVgZdN+S4t83YCjX5T8raqpyI9aWaOQ+
         dq8A2VlrGI/wPlL2NJe2/z9c39k6CIuQMUJDhlCGr1IN5Nx6YAV/oVqGA4w61FZi+q
         p/vv8smcLI5XHAobznuoDIWxMTzhL5W/HzKKVNh5j+x8fkyq6ek26ge2KYO0QIGQa3
         zk07gdfVADnMU+0lfUmGY5NONvLrF9O8Rk2qKcA4U/a8jth+5POby6pKyDB9QsvwM3
         NKyEQ/BAY+W6w==
In-Reply-To: <20230917152938.8231-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, thomas@osterried.de, ralf@linux-mips.org, netdev@vger.kernel.org

http://linux-ax25.org has been down for nearly a year. Its official
replacement is https://linux-ax25.in-berlin.de. Update all links to the
new URL.

Link: https://marc.info/?m=3D166792551600315
Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a62f5a2a1c9e..1c52b7ddc2cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3344,7 +3344,7 @@ AX.25 NETWORK LAYER
 M:=09Ralf Baechle <ralf@linux-mips.org>
 L:=09linux-hams@vger.kernel.org
 S:=09Maintained
-W:=09http://www.linux-ax25.org/
+W:=09https://linux-ax25.in-berlin.de
 F:=09include/net/ax25.h
 F:=09include/uapi/linux/ax25.h
 F:=09net/ax25/
@@ -14749,7 +14749,7 @@ NETROM NETWORK LAYER
 M:=09Ralf Baechle <ralf@linux-mips.org>
 L:=09linux-hams@vger.kernel.org
 S:=09Maintained
-W:=09http://www.linux-ax25.org/
+W:=09https://linux-ax25.in-berlin.de
 F:=09include/net/netrom.h
 F:=09include/uapi/linux/netrom.h
 F:=09net/netrom/
@@ -18598,7 +18598,7 @@ ROSE NETWORK LAYER
 M:=09Ralf Baechle <ralf@linux-mips.org>
 L:=09linux-hams@vger.kernel.org
 S:=09Maintained
-W:=09http://www.linux-ax25.org/
+W:=09https://linux-ax25.in-berlin.de
 F:=09include/net/rose.h
 F:=09include/uapi/linux/rose.h
 F:=09net/rose/
--=20
2.42.0


