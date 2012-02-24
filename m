From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 12/12] rose: check given MAC address, if invalid return
 -EADDRNOTAVAIL
Date: Fri, 24 Feb 2012 16:13:58 +0000
Message-ID: <20120224161358.17df7421@pyramind.ukuu.org.uk>
References: <1330099282-4588-1-git-send-email-danny.kukawka@bisect.de>
	<1330099282-4588-13-git-send-email-danny.kukawka@bisect.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1330099282-4588-13-git-send-email-danny.kukawka@bisect.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Danny Kukawka <danny.kukawka@bisect.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Danny Kukawka <dkukawka@suse.de>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 24 Feb 2012 17:01:22 +0100
Danny Kukawka <danny.kukawka@bisect.de> wrote:

> Check if given address is valid in .ndo_set_mac_address/
> rose_set_mac_address(), if invalid return -EADDRNOTAVAIL as
> eth_mac_addr() already does if is_valid_ether_addr() fails.

This patch series looks wrong - you cannot go blindly applying ethernet
mac address tests to device drivers without checking if they are using
802.11 type addressing at the physical level.

Alan


