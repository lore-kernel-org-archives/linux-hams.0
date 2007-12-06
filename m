From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: [PATCH]  ax25ipd (ax25-apps-0.0.6.2)
Date: Thu, 06 Dec 2007 12:18:35 +0100
Message-ID: <4757DA8B.50905@ccr.jussieu.fr>
References: <47556E09.1050007@openvz.org> <20071205.021741.176966054.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071205.021741.176966054.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi,

Rose network is using extensively AX25 IP encapsulation for
routing AX25 packet radio frames via Internet nodes such FPAC nodes.

ax25ipd (from ax25-apps) is doing frame encapsulation and decapsulation.

Since version 1.0.3 patch by vk5asf ax25ipd is checking every 5 minutes 
hostnames for dynamic DNS.

There was still a failure possibility when the program is started in 
case of unsuccessful resolving remote host ip from its hostname was 
unsuccessful.

I introduced a simple error warning instead of an exit as the remote 
host could be temporary down and the address will be checked again 
periodically later.

The patch against ax25-apps-0.0.6.2 (kernel 2.6 compatible) can be found 
here :

http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.6.2.diff

and ax25-apps-0.0.6.2 is here :
http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.6.2src_f6bvp.tgz


73 de Bernard, f6bvp

