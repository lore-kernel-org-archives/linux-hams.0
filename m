From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: listen -utility vs. aprsd and its treatment of AX.25 sockets..
Date: Tue, 6 Nov 2007 22:52:47 +0200
Message-ID: <20071106205247.GO6372@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org



   rx_socket = socket(PF_PACKET, SOCK_PACKET, htons(proto));

   tx_socket = socket(PF_AX25, SOCK_DGRAM, 0)


Where the 'proto' is either ETH_P_AX25  or ETH_P_ALL.


In the  'listen'  utility the proto is  ETH_P_AX25  unless '-a' option
is given, then it is ETH_P_ALL.  In  'aprsd' it is always ETH_P_ALL.


Given explanation is that ETH_P_AX25 sees only incoming packets, while
ETH_P_ALL sees also outgoing ones.   Presuming that I am only interested
in AX.25 packets but do want to know also outgoing frames, which one
I should use -- or is the commentary on this utilities sources wrong ?

  73 de Matti, OH2MQK
