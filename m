From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: listen -utility vs. aprsd and its treatment of AX.25 sockets..
Date: Wed, 7 Nov 2007 08:04:56 +1100
Message-ID: <20071106210456.GC30845@cloud.net.au>
References: <20071106205247.GO6372@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071106205247.GO6372@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Nov 06, 2007 at 10:52:47PM +0200, Matti Aarnio wrote:
>    rx_socket = socket(PF_PACKET, SOCK_PACKET, htons(proto));
> 
>    tx_socket = socket(PF_AX25, SOCK_DGRAM, 0)
> 
> Where the 'proto' is either ETH_P_AX25  or ETH_P_ALL.
> 
> 
> In the  'listen'  utility the proto is  ETH_P_AX25  unless '-a' option
> is given, then it is ETH_P_ALL.  In  'aprsd' it is always ETH_P_ALL.

When I added AX.25 sockets functionality to aprsd, I "leveraged" the
code from listen, so you should expect them to be the same.

I can't think now why aprsd would need to monitor outgoing frames
though. Perhaps so that it hears packets sent by other AX.25
applications running on the same host eg aprsdigi. However it does add
the requirement to run as root which aprsd might not have otherwise.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
