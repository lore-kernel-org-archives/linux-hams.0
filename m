From: WJuergens@t-online.de (Wolf-Ruediger Juergens)
Subject: Re: Abt gmfsk last version.
Date: Sun, 18 May 2003 14:33:55 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305181433.55576.wjuergens@t-online.de>
References: <Pine.LNX.4.44.0305132315070.2357-100000@oh2bns.ampr.org> <200305181400.49324.wjuergens@t-online.de> <20030518121739.GA5123@silly.cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030518121739.GA5123@silly.cloud.net.au>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sunday 18 May 2003 14:17, Hamish Moffatt wrote:
> What is your gcc --version? I have 3.2.3 20030415 (Debian prerelease)
> and gmfsk 0.5 still compiles fine.

> gcc --version
gcc (GCC) 3.2.3 

I found my mistake, I had overwritten the CFLAGS/CPPFLAGS in the enviroment.
Now it compiles ok.
Thanks for help and sorry for waste bandwith.

73 Wolf, DL2WRJ
-- 
Q:      Why did the programmer call his mother long distance?
A:      Because that was her name.
(/usr/games/fortune)
