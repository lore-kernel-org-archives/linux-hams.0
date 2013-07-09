From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom on kernel version 3.9.6-200
Date: Mon, 08 Jul 2013 21:37:23 -0700
Message-ID: <51DB9383.1050304@junglevision.com>
References: <20130708115635.A4B233700A5@n1uro.ampr.org>  <51DABEDA.8020905@junglevision.com> <1373314487.13641.19.camel@n1uro.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1373314487.13641.19.camel@n1uro.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: n1uro@n1uro.ampr.org, linux-hams <linux-hams@vger.kernel.org>

 >One thing that X1J/TheNet does that I would like to see linux do is 
NOT rebroadcast nodes received on a particular >interface back out on 
that same interface.

Hmm, interesting that this would be an issue.   The Linux code does 
ignore a node if its best neighbor is one's self.    I wonder if there's 
a degenerate case, if 3 nodes all have their default_quality set to 255, 
where the 'neighbor' can all be the third station in the pair, and then 
the node broadcast just goes around and around for all eternity because 
the quality never decreases at all.

In this equation,

  = ((quality * best_quality) + 128) /256;

Could it be that 128 is a mistake, in a world with so many ip based 
systems that set default quality at a high value. Without the 128 then a 
default_quality of 255 turn a 255 quality node into 254, so the infinite 
loop would end eventually.    If we don't want to touch the code, maybe 
we should discourage anyone from ever setting a def_qual=255.  That this 
just seems likely to cause problems to me.

