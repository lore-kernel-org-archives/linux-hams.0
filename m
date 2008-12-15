From: Dave Platt <dplatt@radagast.org>
Subject: Re: soundmodem patches for various distros?
Date: Mon, 15 Dec 2008 11:01:37 -0800
Message-ID: <4946A991.1040502@radagast.org>
References: <49445246.4050104@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49445246.4050104@columbia.edu>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Crosswell <alan@columbia.edu>
Cc: linux-hams@vger.kernel.org

Alan Crosswell wrote:
> Are soundmodem patches for various distros being kept in sync?  I
> experienced a known bug with Tx switching in ALSA mode which is patched
> in debian 0.10-6 but I don't see it patched in Fedora yet, nor at Tom's
> baycom home page.  I guess that means there's a fair amount of duplicate
> effort.....

I found that that particular patch didn't really solve the job on
my system - soundmodem was still crashing out due to an EPIPE
(input overrun) after every transmission or two.

I've got a good fix for this, and plan to send a patch to Tom...
perhaps he can be persuaded to put together a new upstream
release (0.11?) with this and a couple of other ALSA fixes.

