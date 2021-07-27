From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: [PATCH] packet.7: Describe SOCK_PACKET netif name length issues and
 workarounds.
Date: Tue, 27 Jul 2021 10:53:05 +0200
Message-ID: <YP/Jcc4AFIcvgXls@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alejandro Colomar <alx.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Osterried <thomas-SbBNwotClTQPyMaTEpOvjQ@public.gmane.org>

Describe the issues with SOCK_PACKET possibly truncating network interface
names in results, solutions and possible workarounds.

While the issue is know for a long time it appears to have never been
documented properly and is has started to bite software antiques badly since
the introduction of Predictable Network Interface Names.  So let's document
it.

Signed-off-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
---
 man7/packet.7 | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/man7/packet.7 b/man7/packet.7
index 706efbb54..7697bbdeb 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -627,6 +627,34 @@ extension is an ugly hack and should be replaced by a control message.
 There is currently no way to get the original destination address of
 packets via
 .BR SOCK_DGRAM .
+.PP
+The
+.I spkt_device
+field of
+.I sockaddr_pkt
+has a size of 14 bytes which is less than the constant
+.B IFNAMSIZ
+defined in
+.I <net/if.h>
+which is 16 bytes and describes the system limit for a network interface
+name.  This means the names of network devices longer than 14 bytes will be
+truncated to fit into
+.I spkt_device .
+All these lengths include the terminating null byte (\(aq\e0\(aq)).
+.PP
+Issues from this with old code typically show up with very long interface
+names used by the
+.B Predictable Network Interface Names
+feature enabled by default in many modern Linux distributions.
+.PP
+The preferred solution is to rewrite code to avoid
+.BR SOCK_PACKET .
+Possible user solutions are to disable
+.B Predictable Network Interface Names
+or to rename the interface to a name of at most 13 bytes, for example using
+the
+.BR IP (8)
+tool.
 .\" .SH CREDITS
 .\" This man page was written by Andi Kleen with help from Matthew Wilcox.
 .\" AF_PACKET in Linux 2.2 was implemented
@@ -637,7 +665,8 @@ packets via
 .BR capabilities (7),
 .BR ip (7),
 .BR raw (7),
-.BR socket (7)
+.BR socket (7),
+.BR ip (8),
 .PP
 RFC\ 894 for the standard IP Ethernet encapsulation.
 RFC\ 1700 for the IEEE 802.3 IP encapsulation.
