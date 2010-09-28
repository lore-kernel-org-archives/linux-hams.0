From: Dan Smith <dsmith@danplanet.com>
Subject: Re: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Tue, 28 Sep 2010 06:41:04 -0700
Message-ID: <4CA1F070.2090600@danplanet.com>
References: <4C9D43E0.2040908@danplanet.com> <20100926222456.GA31242@x-berg.in-berlin.de> <4C9FCE46.8090900@danplanet.com> <20100928074855.GB31242@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100928074855.GB31242@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: ralf@linux-mips.org, Linux Hams Mailing list <linux-hams@vger.kernel.org>

> Do you have something like "--slave-symlinkname-prefix /path/filename"
> in mind?

Sure, that's fine.

> How handle the situation if the destination file already exist? Warn and
> exit?

Of course, I would rather we explicitly unlink as I did in my original 
patch.  I'll be happy to respin it with fail on EEXIST, if you prefer.

Thanks!

-- 
Dan Smith
www.danplanet.com
KK7DS

