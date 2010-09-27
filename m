From: Dan Smith <dsmith@danplanet.com>
Subject: Re: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Mon, 27 Sep 2010 07:05:36 -0700
Message-ID: <4CA0A4B0.2040600@danplanet.com>
References: <4C9D43E0.2040908@danplanet.com> <20100926222456.GA31242@x-berg.in-berlin.de> <4C9FCE46.8090900@danplanet.com> <4C9FDB9B.60705@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C9FDB9B.60705@comcast.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Willie Hein WJ3G <wj3g@comcast.net>
Cc: Linux Hams Mailing list <linux-hams@vger.kernel.org>

> YES All dual port TNC's require the use of psuedo tty's

Right, but that's not what he was saying.  His example was multiplexing 
a pty instead of a tty, the use case for which I'm a little fuzzy on.

The whole point of the patch is to make the regular case of using UNIX98 
ptys easier in conjunction with the new -x option; it would never be 
used on its own.

-- 
Dan Smith
www.danplanet.com
KK7DS

