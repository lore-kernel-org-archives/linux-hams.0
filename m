From: cathrynham <cathrynm@junglevision.com>
Subject: netromd + AF_PACKET/PF_PACKET
Date: Sun, 16 Nov 2008 18:59:48 -0800
Message-ID: <4920DE24.5090707@junglevision.com>
References: <1222244947.6886.5.camel@zaba>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1222244947.6886.5.camel@zaba>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

netromd is giving me an error "netromr: SIOCADDRT"

I just swapped AF_PACKET for PF_PACKET, SOCK_RAW and
that made the error go away, but I'm pretty sure that's not enough.

Is this correct, that AF_PACKET going away is the
source of this error?  If so, what are my options.  Has someone
fixed this code yet, or can I still recompile the kernel to include 
AF_PACKET?

