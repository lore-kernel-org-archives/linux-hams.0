From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Rose module and kernel 2.6.11
Date: Mon, 11 Apr 2005 22:25:40 +0200
Message-ID: <425ADD44.8090509@ccr.jussieu.fr>
References: <BAY102-F35A48877CA3B5F1F485F68DB3F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BAY102-F35A48877CA3B5F1F485F68DB3F0@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hi,

I have noticed something strange with rose module and 2.6 kernel (at 
least 2.6.10 and 2.6.11).

When loading rose module, it loads now automatically ax25 module. Good.

But, it also creates 9 interfaces from rose0 to rose9 with hardware 
address 0000000 as seen with IP address or ifconfig.

Is this what rose module should do actually ?
With previous versions, loading rose module did not create any rose 
interface. They were created by the application such as ROSE/FPAC.

73 de Bernard, f6bvp


