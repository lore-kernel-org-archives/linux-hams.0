From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: soundmodem support for HF modes?
Date: Mon, 26 Jan 2004 14:48:36 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040126034836.GD19534@cloud.net.au>
References: <20040125193512.055d315e.washer@trlp.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040125193512.055d315e.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Jan 25, 2004 at 07:35:12PM -0800, James Washer wrote:
> Any linux soundmodem support for HF digital modes?

There's a separate program which implements q15x25 (newqpsk) using the
same structure as the user-space soundmodem.

Other than there's gMFSK which is a GNOME program which does PSK31,
RTTY, FeldHell, MT63 and MFSK. Those aren't packet radio modes so not
suitable for inclusion in the soundmodem.


73

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
