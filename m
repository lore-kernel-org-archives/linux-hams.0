From: Dennis Boone <drb@msu.edu>
Subject: Re: Loss of connection state?
Date: Wed, 16 Mar 2022 12:43:21 -0400
Message-ID: <20220316164321.467262902D1@yagi.h-net.msu.edu>
References: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net> <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 15 Mar 2022 19:15:29 -0400.)
Content-ID: <88892.1647449001.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I _had_ been interpreting most of the rest of the RRx frames as idle
 > polls, but I can see where that may have been erroneous and they
 > could be getting lost.  I don't _think_ that explains why I don't
 > resend I01 after I get RR1 from him.

David,

I went back and reviewed the spec.  Comparing the timing of the
conversation with his expected timer settings my known ones, I've
concluded that what I thought were T3 timeouts (channel keepalives) were
probably in fact FRACK timeouts, and that therefore as you suggested,
more packets were getting lost than I originally thought.

This link is a little marginal, and it varies by time of day, but it
isn't usually _this_ bad.

De
