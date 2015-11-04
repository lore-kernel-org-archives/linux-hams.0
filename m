From: Hannes Schmelzer <hannes@schmelzer.or.at>
Subject: Re: multi-channel soundmodem
Date: Wed, 04 Nov 2015 06:22:22 +0100
Message-ID: <5639960E.20501@schmelzer.or.at>
References: <CAOG7C-hJUPVnYzpsXxkUpV_gMM8Y=950ohVX+zzfCsOMOa9EEg@mail.gmail.com> <56398340.4080803@trinnet.net> <CAOG7C-hRNPhT0--3+_mSOpwgTMWagOKpF-HT4sNFAD8ZAAGS3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAOG7C-hRNPhT0--3+_mSOpwgTMWagOKpF-HT4sNFAD8ZAAGS3g@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Riesz <dave@riesz.net>
Cc: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org

Hi,

there is also a most recent project from OE5DXL - called "dxlAPRS" which 
includes a soundmodem for operating 300bd up to 19200bd FSK and AFSK.
Stereo support as described is also supported, further you can run 
multiple baudrates parallel on the same sound/rf channel.

Today the focus is there on operating APRS, but some OMs are running a 
normal packet radio digipeater (using afskmodem together with xnet) also.

The sources, if you are interested may be downloaded from:
https://github.com/oe5hpm/dxlAPRS

The project is written originally in M2, we translate it everytime to 
C-code and i am maintaining the project in github.

best regards,
Hannes - OE5HPM

On 11/04/2015 05:17 AM, Dave Riesz wrote:
> Ah, HA.  I was wondering why there was so little information around on
> soundmodem.  Soundmodem is just what I knew from back in the '90s.
> I'll start again with Direwolf and see how far I get.
>
> Thanks for the pointer!
>
> Dave Riesz
>
> On Tue, Nov 3, 2015 at 8:02 PM, David Ranch <linux-hams@trinnet.net> wrote:
>> Hello Dave,
>>
>> Is there a specific reason why you want to specifically run Tom Sailer's
>> Soundmodem or are you just trying to get back into packet? Though I think
>> soundmodem can support stereo out for two different radios, the support
>> might be iffy as Soundmodem really hasn't received any support in many
>> years.  What I can recommend which DOES support stereo input, stereo output,
>> multiple soundcards as well as superior weak signal packet decodes is
>> Direwolf:
>>
>>     https://github.com/wb2osz/direwolf/releases
>>
>> --David
>> KI6ZHD
>>
>>
>>
>> On 11/03/2015 06:54 PM, Dave Riesz wrote:
>>> Hello.  I'm trying out the soundmodem for the first time in nearly
>>> twenty years.  I would like to set it up to have two channels running
>>> from a single line-out, carried separately on stereo-left and
>>> stereo-right.  I've seen hints here and there that this is possible,
>>> but no proof.  Is it, in fact, possible?  Has anyone here done it?
>>>
>>> Thanks,
>>> Dave Riesz, N1OSN
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

