From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Status of the stuck sockets bugs.
Date: Thu, 22 Jul 2021 16:22:48 -0700
Message-ID: <b435d3b3-b632-de9f-2f14-5a94e718f7a8@trinnet.net>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


This issue is still present in all current Linux kernels.  I believe 
Ralf Baechle (current AX.25 kernel module maintainer) has been aware of 
this issue for some time.

--David
KI6ZHD


On 07/22/2021 10:42 AM, Dave van der Locht wrote:
> Is anybody able to tell me more / give answers to questions about this issue?
>
> Kind regards,
> Dave van der Locht
>
> Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
> <d.vanderlocht@gmail.com>:
>> Hello,
>>
>> Is there any news about the well known bug regarding sockets getting
>> stuck in LISTENING state?
>>
>> Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
>> ax25_subr.c file which seems to work very well and solves the issue.
>> But it's really annoying having to patch the kernel with each update
>> again.
>>
>> What about that patch, I've heard it was rejected several times for
>> some reason? But can't find info regarding that.
>> What can be done - or who is able - to get rid of this bug and get it
>> fixed in the kernel?
>>
>> Kind regards,
>> Dave van der Locht

