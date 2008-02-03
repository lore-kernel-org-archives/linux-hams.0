From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces
	?
Date: Sun, 3 Feb 2008 22:28:19 +0200
Message-ID: <20080203202819.GX2537@mea-ext.zmailer.org>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <47A60A57.5080402@digitalrealm.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47A60A57.5080402@digitalrealm.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glenn Wright <gw.ka8e@digitalrealm.net>
Cc: linux-hams@vger.kernel.org

On Sun, Feb 03, 2008 at 06:39:19PM +0000, Glenn Wright wrote:
> For the HAMS like me that run TCP/IP.

Sure, but that does not mean that _all_ interfaces must have IP address.
In my specific present application scope the question is APRS -- those
radio channels do not run IP at all, and therefore forcing the interfaces
to have IP is superflous at best.

> Matti Aarnio wrote:
> > I can well understand that the IP address is OPTIONAL, but
> > not that it is MANDATORY.

Thus the question: is there a reason to have the IP address
as MANDATORY parameter for things like  kissattach ?


Related: at present there are no ready-made init-scripts for
AX.25/ROSE/etc.   Or perhaps I just have failed to spot any
in any Debian variations, or RedHat/SuSE...

Something like what there exists for IP settings.

73 de Matti, OH2MQK
