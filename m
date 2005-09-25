From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: AX.25 in tcpdump.
Date: Sun, 25 Sep 2005 11:21:25 +0100
Message-ID: <43367A25.70805@rns-stearn.demon.co.uk>
References: <4335D980.503@rns-stearn.demon.co.uk> <620c9057050924172134d0069e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057050924172134d0069e@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Chuck Hast wrote:
> If you get the info would you do the ROSE stuff (we use FPAC here in FL
> which is a super set of ROSE which is actually X.25) ?

Chuck

Yes, but a qualified one. Can we establish that it actually needs to be done?

A grep for 8208 turns up:

	print-llc.c:        { LLCSAP_ISO8208,  "ISO8208" },

so I would like to try connecting that in as the print routine and have
someone test the result before I look at coding a print-rose.c. If the
8208 implementation in print-llc is close then I could use that as a starting
point and just add the extras to create a print-rose or look at extending
print-llc (which might be be vetoed by the current maintainer).

Told you I was lazy. :-)

-- 
Regards
	Richard
