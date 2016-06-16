From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 1/1]  AX.25: Close socket connection on session completion
Date: Wed, 15 Jun 2016 19:33:45 -0700
Message-ID: <20160616023345.GD14691@kroah.com>
References: <20160615122027.5598cf95@brox.localnet>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=A20X+iyZNLJKC1tFU8Gj7Yu6DXg=; b=En8GO
	K1mN8EiAqlpnIaWmOoqLH507XsvS9dUlvm2gOwP7yVSn7kR3tfBLiWjvJY0Cdkmv
	s0OdmPVcscA3bdD/Ly4TVbKLF0IWsnL+llCRd3NKiCjyJOnVpSAy/iOhtuU4cWUW
	Mlqn16cmYSrYj+r8UYB+jCMvbb5PcloKUZMrNc=
Content-Disposition: inline
In-Reply-To: <20160615122027.5598cf95@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Basil Gunn <basil@pacabunga.com>
Cc: driverdev-devel@linuxdriverproject.org, Ralf Baechle <ralf@linux-mips.org>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org, jreuter@jaina.de, davem@davemloft.net

On Wed, Jun 15, 2016 at 12:20:27PM -0700, Basil Gunn wrote:
> A socket connection made in ax.25 is not closed when session is
> completed.  The heartbeat timer is stopped prematurely and this is
> where the socket gets closed. Allow heatbeat timer to run to close
> socket. Symptom occurs in kernels >= 4.2.0
> 
> Signed-off-by: Basil Gunn <basil@pacabunga.com>
> ---
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c

Please use scripts/get_maintainer.pl to determine who to send this to
(hint, it's not me, nor the driverdev mailing list...)

thanks,

greg k-h
