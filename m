From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] Add a number of protocols to __SOCKADDR_ALLTYPES
Date: Thu, 3 Aug 2017 14:04:48 +0200
Message-ID: <20170803120448.GA24196@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-82676-glibc-alpha=m.gmane.org@sourceware.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=sourceware.org; h=list-id
	:list-unsubscribe:list-subscribe:list-archive:list-post
	:list-help:sender:date:from:to:cc:subject:message-id
	:mime-version:content-type:content-transfer-encoding; s=default;
	 bh=mjQihnOEpqomMey/Zg3u7gEbqck=; b=u2qv2gs6rGm2WISiGQiH+V/BHy77
	4hlWlgm7PNEkOCbIKeCc8aukX4DU7Dqe+getD1GCVuEAiXtN3xn96RZ4DsxlP/n6
	RC1L9aYdYNa0u5V1ocvVb9juyRuYEhT67Jk1/cxbtMOozGbdEoKepgjM8ykSX1KQ
	q3gtr+axBJqZcOY=
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
To: libc-alpha@sourceware.org
Cc: Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

__SOCKADDR_ALLTYPES is lacking a number of sockaddr_* variants so those
can't be passed to syscalls such as bind, sendto, recvfrom oder
getsockname or a warning or build error such as

beacon.c: In function ‘main’:
beacon.c:188:15: error: incompatible type for argument 2 of ‘bind’
   if (bind(s, &src, len) == -1) {

will hit.  Adding a number of sockaddr_* fixes these problems.

2017-08-03  Ralf Baechle  <ralf@linux-mips.org>

        * socket/sys/socket.h (__SOCKADDR_ALLTYPES.): Add
        full_sockaddr_ax25 , sockaddr_ll, sockaddr_pkt and sockaddr_rose.

---
 socket/sys/socket.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/socket/sys/socket.h b/socket/sys/socket.h
index bbfde8f602..061f457993 100644
--- a/socket/sys/socket.h
+++ b/socket/sys/socket.h
@@ -61,6 +61,7 @@ enum
 /* Add more `struct sockaddr_AF' types here as necessary.
    These are all the ones I found on NetBSD and Linux.  */
 # define __SOCKADDR_ALLTYPES \
+  __SOCKADDR_ONETYPE (full_sockaddr_ax25) \
   __SOCKADDR_ONETYPE (sockaddr) \
   __SOCKADDR_ONETYPE (sockaddr_at) \
   __SOCKADDR_ONETYPE (sockaddr_ax25) \
@@ -71,7 +72,10 @@ enum
   __SOCKADDR_ONETYPE (sockaddr_inarp) \
   __SOCKADDR_ONETYPE (sockaddr_ipx) \
   __SOCKADDR_ONETYPE (sockaddr_iso) \
+  __SOCKADDR_ONETYPE (sockaddr_ll) \
   __SOCKADDR_ONETYPE (sockaddr_ns) \
+  __SOCKADDR_ONETYPE (sockaddr_pkt) \
+  __SOCKADDR_ONETYPE (sockaddr_rose) \
   __SOCKADDR_ONETYPE (sockaddr_un) \
   __SOCKADDR_ONETYPE (sockaddr_x25)
 
