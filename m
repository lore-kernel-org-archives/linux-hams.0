From: Guido Trentalancia <iz6rdb@trentalancia.net>
Subject: Re: Soundmodem patch for AFSK operation a low bit-rates (1/2)
Date: Sun, 03 Apr 2016 19:05:52 +0200
Message-ID: <A77271B9-D4BD-4D40-A927-BEB924CFA27C@trentalancia.net>
References: <1459699404.8591.23.camel@trentalancia.net> <57014908.6020708@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <57014908.6020708@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org

Hello David! 

My reply follows your quoted text...

On 03 april 2016 18:47:04 CEST, David Ranch <linux-hams@trinnet.net> wrote:
>
>Hello Guido,
>
>Thanks for working on those fixes.  I think the best place for this
>would be the soundmodem repository at:
>
>   http://gna.org/projects/soundmodem
>
>Interestingly enough, Thomas Sailer has been updating the soundmodem
>code in recent times for new automake related fixes.

Yes, I've posted my patch there too, but it seems they don't want to fix the broken source code!...

>Ps.  What version of soundmodem should these patches be applied
>against?

I've tested the patches successfully on releases from 0.16 upto the latest one. They might work with releases prior to 0.16, but I have not tested that case. 

>--David
>KI6ZHD

73, IZ6RDB 
>
>
>On 04/03/2016 09:03 AM, Guido Trentalancia wrote:
>
>Hello. Here is the latest version of a set of two patches for the
>soundmodem application that I have created to fix AFSK operation at
>bit-rates lower than 1200 baud (e.g. 300 baud for HF packet radio or
>APRS). Patch 1/2 follows: 

