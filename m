From: csmall@eye-net.com.au (Craig Small)
Subject: Re: Unable to connect
Date: Mon, 23 Sep 2002 12:11:31 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020923021131.GC8641@eye-net.com.au>
References: <000001c26244$e014e880$0802a8c0@Barry>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c26244$e014e880$0802a8c0@Barry>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Barry <barry_linux@rogers.com>
Cc: linux-hams@vger.kernel.org

On Sun, Sep 22, 2002 at 10:32:27AM -0400, Barry wrote:
> Hi, just trying to recover from a major hardware failure here. I managed
> to recover most of my configuration files, but a couple were lost.
> 
> I am using:
> Athalon 1.3
> 512 Mb RAM
> 30Gb Disc
> Mandrake 9.0rc3 Kernel 2.4.19
> libaxax25-0.0.9 
> ax25-apps-0.0.6
> ax25-tools-0.0.8
> node-0.3.0
> clx 5.04
> 
> All compiled and installed OK. Problem comes whenever I try to connect,
> say to VE3NAV-1 (the node), VE3NAV-3 (clx) etc. I get the "connected"
> message, immediately followed by a disconnection. The result is the same
> whether I connect via radio, or a local loopback from the keyboard.

Do those two connect via ax25?  It sounds very similar to a problem you
get with inetd that does the listening then attempts to start the child
program (like , say ftpd), fails then bumps you off.

In that case check those programs run directly.  

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
