From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Success! TWO questions remain
Date: Fri, 13 Dec 2002 00:28:01 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021212132801.GA9699@silly.cloud.net.au>
References: <Pine.LNX.4.44.0212111645150.1297-100000@jeeves.mvw.net> <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212120813300.5835-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Dec 12, 2002 at 08:16:22AM -0500, mvw@mvw.net wrote:
> Hello all,
> 
> Wonder if anyone saw my previous message?
> 
> In any case, another question. I want to be able to telnet into one
> machine from another using radio. Encryption is forbidden for amateur use
> so this means clear passwords. Not good. (Even though I will not use root, 
> of course).
> 
> BUT, compression _is_ allowed. How can I get the tcp/ip content to be 
> compressed, so it is at least not easily readable?

Compression is still hiding the data and I would say breaks the rules.
Better solution: use SSH. You can have public key authentication (no
cleartext passwords) without any encryption or compression.

> PS plus, how can I get telnet to accept connections only on its radio 
> port? This is a generalLinux question but if anyone happens to know the 
> answer?

telnetd usually starts from inetd, but inetd doesn't seem to have a way
to only listen on certain interfaces. You could use TCP wrappers (ie
/etc/hosts.{allow,deny}) to limit the IP addresses which are allowed to
connect to ones which you know will be on the radio interface.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
