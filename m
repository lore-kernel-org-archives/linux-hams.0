From: "William McKeehan" <mckeehan@mckeehan.homeip.net>
Subject: Re: AX25 Segmentation fault
Date: Fri, 3 Aug 2007 22:03:03 -0400 (EDT)
Message-ID: <49499.192.168.1.1.1186192983.squirrel@mckeehan.homeip.net>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com>
    <20070802012451.GA1238@cloud.net.au>
    <20070802112715.GB25597@linux-mips.org>
    <200708021720.56251.n7ipb@wetnet.net> <46B344C6.5050001@ccr.jussieu.fr>
    <1941.192.168.1.1.1186167965.squirrel@mckeehan.homeip.net>
    <46B3B8A3.50409@w1nr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <46B3B8A3.50409@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: linux-hams@vger.kernel.org

I'm running 2.6.18-4-486.
-- 
William McKeehan

On Fri, August 3, 2007 7:22 pm, Mike McCarthy, W1NR wrote:
> William McKeehan wrote:
>> Maybe you guys can help me debug a problem.
>>
>> I'm running Debian Linux; ever since I've upgraded to etch, some of the
>> AX.25
>> stuff that I execute has started producing a "Segmentation fault"
>>
>> For example:
>> /usr/sbin/beacon -c KI4HDU -d 'APZWJM via WA4RYW-7, WIDE2-1 ' -s aprs ":BLNB
>>   :EastTN APRS Net  Sunday Night 8:00  on 146.94"
>>
>> The packet goes out. I have no idea what's going wrong - can anyone tell me
>> where to start debugging this problem?
>>
> What version of the Kernel are you running? Some of the 2.6.13-15
> kernels had bugs.  But they were hard system crashes due to problems in
> mkiss.
>
> Mike, W1NR
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

