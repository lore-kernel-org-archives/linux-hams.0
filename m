From: Willie Hein WJ3G <wj3g@comcast.net>
Subject: Re: txdelay
Date: Fri, 28 Nov 2008 15:37:17 -0500
Message-ID: <4930567D.40708@comcast.net>
References: <49302729.2080109@comcast.net> <f1706c1e0811280923i517eccdeh5c21a415113099e1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <f1706c1e0811280923i517eccdeh5c21a415113099e1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

Thank you Neville and Tom,

That is exactly what I was looking for. I tend to believe that KISS over
rides the firmware set commands. But things are working better now. Now
to figure out why netrom won't work.

73, Willie

Neville A. Cross wrote:
> On Fri, Nov 28, 2008 at 11:15 AM, Willie Hein WJ3G <wj3g@comcast.net> wrote:
>   
>> Greetings all,
>>
>> Since i don't see it as an option in axctl or axparms, how do I set the
>> txdelay using linux ax25?
>>
>> tia
>>
>> Willie, WJ3G
>>
>>     
>
> You have to use teh following command:
>
> kissparms -p 1 -t 300 -r 128 -s 100 -l 30
>
> where -t is the txdelay
>
> in fedora I use it like:
> /usr/sbin/kissparms -p 1 -t 300 -r 128 -s 100 -l 30
>
> because of the different path that are use among distros
>
> Hope it helps
>   
