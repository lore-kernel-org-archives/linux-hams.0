From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: APRS library?
Date: Thu, 11 Mar 2004 09:11:06 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <S261405AbUCKJLS/20040311091118Z+41@vger.kernel.org>
References: <20040310023947.GA14019@braddock.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040310023947.GA14019@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Braddock Gaskill' <braddock@braddock.com>, linux-hams@vger.kernel.org

Hi,

I was looking for something similar a while ago & found 'DigiNED' by Henk
DeGroot

This is GPLd and includes the various APRS related fuctions in specific
source files; dx.c includes a parser to convert an APRS beacon to a position
& distance.c calculates bearing & distance between two locations.


Hope this is of use,

Robert Jenkins,
G8TBF / G0WTK.



 

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Braddock Gaskill
Sent: 10 March 2004 02:40
To: linux-hams@vger.kernel.org
Subject: APRS library?

I'm looking to integrate APRS into a custom mapping application.  Is there
any sort of integrated APRS parser library that would help?

There seems to be more than a trivial number of APRS protocol modes and
hacks, the spec is 128 pages, and there are things like weather data and
whatnot that would be nice to extract; I'd just as well not reimplement it
all myself.

I looked at the Xastir source but it doesn't seem ideal (without massive
copy/paste extraction and hacking, or perhaps "un"-hacking).

Are there any other complete Open Source APRS implementations out there?

Thanks,
Braddock Gaskill - KD5ZVK
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html



