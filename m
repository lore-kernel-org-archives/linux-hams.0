From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Loss of connection state?
Date: Wed, 16 Mar 2022 14:46:33 -0700
Message-ID: <015a5074-6ff2-914f-9205-a53faa63d6e3@trinnet.net>
References: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net>
 <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
 <20220316164321.467262902D1@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220316164321.467262902D1@yagi.h-net.msu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dennis Boone <drb@msu.edu>, linux-hams@vger.kernel.org


Hello Dennis,

I don't know if you and the remote party would be willing to try but if 
you are, try using a software TNC like Direwolf or UZ7HO's soundmodem 
(under Wine).  Those multi-platform TNCs run circles around most 
hardware TNCs when it comes to weak signal decodes. They both also 
support FX.25 which you can enable to add FEC to the communications to 
improve the reliability.

--David
KI6ZHD



>   > I _had_ been interpreting most of the rest of the RRx frames as idle
>   > polls, but I can see where that may have been erroneous and they
>   > could be getting lost.  I don't _think_ that explains why I don't
>   > resend I01 after I get RR1 from him.
>
> David,
>
> I went back and reviewed the spec.  Comparing the timing of the
> conversation with his expected timer settings my known ones, I've
> concluded that what I thought were T3 timeouts (channel keepalives) were
> probably in fact FRACK timeouts, and that therefore as you suggested,
> more packets were getting lost than I originally thought.
>
> This link is a little marginal, and it varies by time of day, but it
> isn't usually _this_ bad.
>
> De

