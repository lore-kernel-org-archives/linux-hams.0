From: csmall@eye-net.com.au (Craig Small)
Subject: Re: ttylinkd
Date: Sun, 12 May 2002 21:57:13 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020512115713.GB21741@eye-net.com.au>
References: <000101c1f926$e2f89560$04a3862c@iz2daw.2.it.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000101c1f926$e2f89560$04a3862c@iz2daw.2.it.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Abbaterusso Giuseppe <iz2giu@tin.it>
Cc: linux-hams@vger.kernel.org

On Sat, May 11, 2002 at 09:59:18PM +0200, Abbaterusso Giuseppe wrote:
> I'm working with Redat 6.1 with kernel 2.2.18 and ax-25-utils 2.213.tar.gz

ax25-utils is an ancient version, I'd recommend not using it and use
ax25-tools, ax25-apps and libax25  http://ax25.sourceforge.net/

Don't think we ever had a 2.213 version though.

> In pms when choise "talk" it not run
> In the /var/log/messages I find written:
> "ttylinkd main(): bind() failed

My guess is you don't have "link 87/tcp ttylink" in /etc/services

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
