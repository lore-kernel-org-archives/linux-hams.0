From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Ethereal ax25 monitoring
Date: Wed, 31 Aug 2005 22:46:34 +0100
Message-ID: <4316253A.2060009@rns-stearn.demon.co.uk>
References: <620c90570508131043a53b9db@mail.gmail.com> <42FE6C9E.2060808@rns-stearn.demon.co.uk> <42FFBDA1.6040400@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42FFBDA1.6040400@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

An update on AX.25 in Ethereal.

I have enquired on the Ethereal list and the attitude (sample of 1) is
that "if the protocol exists and is used then it will be accepted".
Subject to a few pratical provisos.

The deeper issue I have found is that Ethereal uses libpcap for the
actual packet capture, and libpcap does not support AX.25 as a packet
type.

There appears to a replacement for libpcap in development within Ethereal
however that is probably a long term project. So my next move is to see
what the issues are with getting the AX.25 packet type added to libpcap.

It looks to me that AX.25 on Ethereal is going to be a long time coming.

-- 
Regards

	Richard
