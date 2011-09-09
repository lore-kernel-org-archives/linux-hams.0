From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: Need standard PROM image for Paccomm Tiny2 MK2
Date: Fri, 09 Sep 2011 15:43:09 -0700
Message-ID: <4E6A967D.50900@wa7v.com>
References: <CAArS27vGJdjH+sCwXG-gqJXobH6Mt+MT5NGVX=SKDYWMkOOLag@mail.gmail.com> <4E6A93FB.1030207@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E6A93FB.1030207@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux HAMs <linux-hams@vger.kernel.org>

Ray Wells wrote the following on 09/09/2011 15:32:
> On 9/10/2011 8:10 AM, Douglas Cole wrote:
>> As the subject says, I purchased a number of Paccomm TNC's without
>> PROM's (they had X1J PROM's in them and the seller didn't have the
>> original ones and pulled his PROM's out) and I need either the
>> original PROM that I can duplicate or the image file for it so I can
>> program ones for these TNC's.
>> I plan on using the TNC's in KISS mode on Linux boxes and so the need
>> for the standard PROM image.
>> Sorry for the off topic posting but I'm not sure what other list might
>> have folks with packet interests, if anyone knows please offer any
>> info you can.
>>
>> 73
> The KISS implementation in a standard EPROM has horrendous,
> unpredictable timing issues, suggest you burn a KISS only EPROM. I have
> an image but am forced to laptop only at the moment and the file is not
> readily available to me.
> 
> Ray vk2tv

I've been using a KISS-only EPROM in a Tiny2 with satisfactory results.  I
believe I burned it from the tnc2kiss.hex file obtained from TAPR at:
ftp://ftp.tapr.org/software_lib/tnc/


73,

Brett, WA7V
