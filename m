From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: RFC 1226
Date: Mon, 1 Mar 2004 18:21:49 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040301072149.GA8323@cloud.net.au>
References: <1078104092.23240.181857734@webmail.messagingengine.com> <31DA5BDC-6B39-11D8-B396-000393BB4930@tropo.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31DA5BDC-6B39-11D8-B396-000393BB4930@tropo.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Feb 29, 2004 at 10:30:40PM -0600, Mike Murphree wrote:
> On Feb 29, 2004, at 7:21 PM, Nick Schmalenberger wrote:
> >> Why
> >>doesn't APRS use IP and UDP? Thanks.
> 
> APRS was designed for packet radio, and not the internet...

Indeed. APRS could send UDP packets over broadcast IP, but what would
be the benefit? You have several extra layers of protocol (at least 30
bytes of headers) for no benefit.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
