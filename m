From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom
Date: Tue, 09 Jul 2013 19:08:09 -0700
Message-ID: <51DCC209.8080006@junglevision.com>
References: <20130708115635.A4B233700A5@n1uro.ampr.org> <51DABEDA.8020905@junglevision.com> <1373314487.13641.19.camel@n1uro.ampr.org> <51DB9383.1050304@junglevision.com> <1373371546.6646.26.camel@n1uro.ampr.org> <20130709223429.GD18314@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20130709223429.GD18314@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: Brian Rogers <n1uro@n1uro.ampr.org>, linux-hams <linux-hams@vger.kernel.org>

On 7/9/13 3:34 PM, Thomas Osterried wrote:
> ((255*255)+128)/256 = 254 => It does decrease on the next hop and behind.



Oops, you're right.  So what about this situation.

A -- B   -- C
          \   /
            D


If A sends a broadcast to B.   The link from B back to A should decrease 
the 'obsolete' value with each broadcasts.  But can the listing loop 
around from C to D back to B?

But the loop of death should eventually run out of gas when the quality 
hits 0.  So, how are all those nodes sticking around for years and 
years.  Even if misconfigured, can Netrom do this all by itself.  Hmm.
