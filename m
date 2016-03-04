From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: [PATCH net 0/3] validate variable length ll headers
Date: Fri,  4 Mar 2016 15:44:14 -0500
Message-ID: <1457124257-31486-1-git-send-email-willemdebruijn.kernel@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=j1WYHGxyzbSl+2S+gUmK+YMkUt7Bwjul8i9H1XMB/vo=;
        b=dJvgR5X3gOzokRZVXejPGUvJ7EfJcGOcAxBPaPraccLhcCpqhcz5gAj5Xyuo1ylbGg
         m6bkVAEKlZaNYe22WzuHXIu+xQ1ro9K1DX1MQ+ukKtsmnY98tiJXl4BXkT1ZyCyafB4o
         Xt6MIDkk29YqeXy1+EabucHwiKXg2t46z2JoX+81G2BbbH76s4DM8ytc7eR4J87Mz47B
         Ug+FQLya+ERCUg61Zt88D7sNzF+TWEWzEPNlaULkf2HXOVhSexYNv3SehoB0gtS2/Vrm
         dSkhYDMZhopCIdxh/CJzYRWQKHxxJ5FNqsU9eejjio6S1iLsYJzJCH/mYT62vimVibHa
         kdqQ==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, alan@linux.intel.com, hessu@hes.iki.fi, martin.blumenstingl@googlemail.com, linux-hams@vger.kernel.org, Willem de Bruijn <willemb@google.com>

From: Willem de Bruijn <willemb@google.com>

Allow device-specific validation of link layer headers. Existing
checks drop all packets shorter than hard_header_len. For variable
length protocols, such packets can be valid.

patch 1 adds header_ops.validate and dev_validate_header
patch 2 replaces ll_header_truncated with dev_validate_header
patch 3 implements the protocol specific callback for AX25

Tested with a temporary eth_header_validate function. The AX25
code is compile-tested only at this point.

Willem de Bruijn (3):
  net: validate variable length ll headers
  packet: validate variable length ll headers
  ax25: add link layer header validation function

 include/linux/netdevice.h | 22 ++++++++++++++++++++--
 net/ax25/ax25_ip.c        | 15 +++++++++++++++
 net/packet/af_packet.c    | 38 +++++++++++++++++---------------------
 3 files changed, 52 insertions(+), 23 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344

