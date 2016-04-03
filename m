From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Soundmodem patch for AFSK operation a low bit-rates (1/2)
Date: Sun, 3 Apr 2016 09:48:22 -0700
Message-ID: <57014956.3020906@trinnet.net>
References: <1459699404.8591.23.camel@trentalancia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1459699404.8591.23.camel@trentalancia.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guido Trentalancia <iz6rdb@trentalancia.net>, linux-hams@vger.kernel.org


Hello Guido,

Thanks for working on those fixes.  I think the best place for this 
would be the soundmodem repository at:

http://gna.org/projects/soundmodem

Interestingly enough, Thomas Sailer has been updating the soundmodem 
code in recent times for new automake related fixes.

Ps.  What version of soundmodem should these patches be applied against?

--David
KI6ZHD


On 04/03/2016 09:03 AM, Guido Trentalancia wrote:
> Hello.
>
> Here is the latest version of a set of two patches for the soundmodem
> application that I have created to fix AFSK operation at bit-rates
> lower than 1200 baud (e.g. 300 baud for HF packet radio or APRS).
>
> Patch 1/2 follows:

