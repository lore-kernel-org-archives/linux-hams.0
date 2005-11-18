From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX25 in UBUNTU Breezy
Date: Fri, 18 Nov 2005 21:09:05 +1100
Message-ID: <20051118100905.GA25862@cloud.net.au>
References: <1b38301c5ec27$41874170$0a05030a@internal.ramnet.gr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1b38301c5ec27$41874170$0a05030a@internal.ramnet.gr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, Nov 18, 2005 at 12:02:59PM +0200, sv1uy@in.gr wrote:
> Is anyone using AX25-tools, AX25-apps, libax25 in UBUNTU 5.10 Breezy Badger succesfully here please? 
> 
> If yes could you tell me which versions of are working for you? UBUNTU 5.10 has kernel 2.6.12 and when I try MKISS I get input/output error. I had SLACKWARE 10.2 with kernel 2.4.31 before and AX25 worked.

I found that the kernel crashed when I ran kissattach with 2.6.12.
You need 2.6.14 at least.

(I'm using Debian rather than Ubuntu, but it's a kernel issue.)

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
