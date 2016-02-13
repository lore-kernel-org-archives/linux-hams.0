From: David Ranch <linux-hams@trinnet.net>
Subject: Re: kernel ax25: lost and out-of-order data
Date: Sat, 13 Feb 2016 14:23:56 -0800
Message-ID: <56BFACFC.70107@trinnet.net>
References: <20160212181212.GD24276@x-berg.in-berlin.de>
 <20160213124103.GE24276@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160213124103.GE24276@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Thomas,

> 1. New findings:
>    if the kernel runs on a single CPU machine, everything is ok. I transferred the 2MB testfile three times and it has been always received ok.
>    => I suppose it's an SMP issue.

Wow.. that's a key find!  Nice work!  Now that you narrowed this down to 
a threading issue with a easy way to reproduce it, I hope you'll get 
some traction here from the local kernel experts.  If you don't see much 
movement, I imagine taking this up to the main kernel list would be 
warranted.

--David
KI6ZHD

