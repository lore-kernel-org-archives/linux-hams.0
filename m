From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2 0/6] iproute2: Add basic AX.25, NETROM and ROSE support.
Date: Sun, 19 Sep 2021 15:55:58 +0200
Message-ID: <cover.1632059758.git.ralf@linux-mips.org>
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

net-tools contain support for these three protocol but are deprecated and
no longer installed by default by many distributions.  Iproute2 otoh has
no support at all and will dump the addresses of these protocols which
actually are pretty human readable as hex numbers:

# ip link show dev bpq0
3: bpq0: <UP,LOWER_UP> mtu 256 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/ax25 88:98:60:a0:92:40:02 brd a2:a6:a8:40:40:40:00
# ip link show dev nr0
4: nr0: <NOARP,UP,LOWER_UP> mtu 236 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/netrom 88:98:60:a0:92:40:0a brd 00:00:00:00:00:00:00
# ip link show dev rose0
8: rose0: <NOARP,UP,LOWER_UP> mtu 249 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/rose 65:09:33:30:00 brd 00:00:00:00:00

This series adds basic support for the three protocols to print addresses:

# ip link show dev bpq0
3: bpq0: <UP,LOWER_UP> mtu 256 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/ax25 DL0PI-1 brd QST-0
# ip link show dev nr0
4: nr0: <NOARP,UP,LOWER_UP> mtu 236 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/netrom DL0PI-5 brd *
# ip link show dev rose0
8: rose0: <NOARP,UP,LOWER_UP> mtu 249 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/rose 6509333000 brd 0000000000

Ralf Baechle (6):
  AX.25: Add ax25_ntop implementation.
  AX.25: Print decoded addresses rather than hex numbers.
  NETROM: Add netrom_ntop implementation.
  NETROM: Print decoded addresses rather than hex numbers.
  ROSE: Add rose_ntop implementation.
  ROSE: Print decoded addresses rather than hex numbers.

Changes in v2:
 - reset commit dates.  The commit dates were still pointing back to the
   ages of King Tutankhamun though the code is more recent and has been
   tested based on latest iproute2.

 Makefile          |  9 ++++++
 include/utils.h   |  6 ++++
 lib/ax25_ntop.c   | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/ll_addr.c     |  6 ++++
 lib/netrom_ntop.c | 23 +++++++++++++
 lib/rose_ntop.c   | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 182 insertions(+)
 create mode 100644 lib/ax25_ntop.c
 create mode 100644 lib/netrom_ntop.c
 create mode 100644 lib/rose_ntop.c

-- 
2.31.1


Ralf Baechle (6):
  AX.25: Add ax25_ntop implementation.
  AX.25: Print decoded addresses rather than hex numbers.
  NETROM: Add netrom_ntop implementation.
  NETROM: Print decoded addresses rather than hex numbers.
  ROSE: Add rose_ntop implementation.
  ROSE: Print decoded addresses rather than hex numbers.

 Makefile          |  9 ++++++
 include/utils.h   |  6 ++++
 lib/ax25_ntop.c   | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/ll_addr.c     |  6 ++++
 lib/netrom_ntop.c | 23 +++++++++++++
 lib/rose_ntop.c   | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 182 insertions(+)
 create mode 100644 lib/ax25_ntop.c
 create mode 100644 lib/netrom_ntop.c
 create mode 100644 lib/rose_ntop.c

-- 
2.31.1

