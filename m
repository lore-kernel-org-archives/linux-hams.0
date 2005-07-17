From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Listen root only
Date: Mon, 18 Jul 2005 00:02:09 +1000
Message-ID: <20050717140209.GC18923@cloud.net.au>
References: <620c9057050715180279131307@mail.gmail.com> <20050716021652.GA4343@cloud.net.au> <20050716003247.3290240f.n2por@amsat.org> <Pine.LNX.4.58.0507160845220.12607@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0507160845220.12607@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Jul 16, 2005 at 08:50:41AM -0700, Curt Mills wrote:
> As to how to solve the general problem discussed, I haven't a clue.
> I can't see a way around it.  In Xastir we have the users install
> SUID-root so that we can open AX.25 ports, but we drop priviledges
> in the code except for those short instances where we need the root
> priviledges.  It's still a security concern, but less so that way.

I expect that the kernel could be changed to allow any user to open the
relevant type of socket. I don't know whether the kernel maintainers
would accept this solution though.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
