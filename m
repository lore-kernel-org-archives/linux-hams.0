From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: APRS digi?
Date: Sun, 13 Jul 2003 01:36:28 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030712153628.GA7158@cloud.net.au>
References: <Pine.GSO.4.53.0307120920170.23536@gateway.northgrum.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.53.0307120920170.23536@gateway.northgrum.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Jul 12, 2003 at 09:22:24AM -0400, Pat Masterson wrote:
> I run xastir here to igate APRS in my area. The users have asked me to
> also run an APRS digi. What is a good digi product that will run along
> with
> xastir?  -pat

aprsdigi. I would suggest using aprsd instead of xastir for the IGATE,
as it runs as a daemon and doesn't require you to be always running X,
logged in etc. But aprsdigi will work with either.

Alternatively, digi_ned. I only have experience with aprsdigi but it
sounds like digi_ned is very flexible where aprsdigi is reasonably
simple.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
