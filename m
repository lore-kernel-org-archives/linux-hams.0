From: don <don_reid@comcast.net>
Subject: Re: Soundmodem - suppresing initial xmit
Date: Sun, 18 Nov 2007 14:53:43 -0800
Message-ID: <20071118225343.GA21146@reid1.localdomain>
References: <20071116163231.GA9559@reid1.localdomain> <20071118035958.GA17161@reid1.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071118035958.GA17161@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thanks all for the help.  Yes it was the avahi daemon doing mDNS.

I ended up setting the following in /etc/avahi/avahi-daemon.conf

  publish-addresses=no
  publish-hinfo=no
  publish-workstation=no
  publish-domain=no

That stops the broadcasts when soundmodem starts.

It remains to be seen if anything else on the system (Ubuntu Gutsy
Gibbon) needs them.  The ubuntu-desktop package depends on avahi-daemon.

73
Don - W7DMR
