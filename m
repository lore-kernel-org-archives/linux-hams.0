From: John Ronan <jronan@tssg.org>
Subject: Re: conversd
Date: Thu, 27 Mar 2008 12:31:01 +0000
Message-ID: <3E9544A6-9568-4471-9363-49EE193B46C6@tssg.org>
References: <A85C934B-8B0B-4CCB-AFE9-3FEBD3AED4AC@tssg.org> <3FA000E82CAEC141B2206EB5892D866B3812BB58AA@markex02.mark.se>
Mime-Version: 1.0 (Apple Message framework v753)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Received: from [?*??O??IPv6:2001:770:20:2:217:f2ff:fec4:58a4] (unknown [IPv6:2001:770:20:2:217:f2ff:fec4:58a4])
	by imaps.tssg.org (Postfix) with ESMTP id B71DB3FD20
	for <linux-hams@vger.kernel.org>; Thu, 27 Mar 2008 12:31:00 +0000 (GMT)
In-Reply-To: <3FA000E82CAEC141B2206EB5892D866B3812BB58AA@markex02.mark.se>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>


On 27 Mar 2008, at 12:09, <Morgan.Wemanis@mark.se> wrote:
> Hi,
>
> Please read:
> http://he.fi/archive/linux-hams/200410/0052.html
>
> conversd-saupp:
> http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/conversd-saupp/
>
> Perhaps there is a "new" version/package out, I don't know..
>
Hi,

There were some changes in the CVS up to 5 weeks ago.. so I've  
grabbed a tarball and am building at present.  Actually two small  
changes and it builds with no warnings.

Re overflows, I note the use of strcat everywhere, I'll have a run  
through and change them to strncat, that should help.. .anything else  
need attention?

Now I just need to figure out how to configure it.

Thanks
de John
EI7IG

> 73 de Morgan,sm6tky
>
>> -----Original Message-----
>> From: linux-hams-owner@vger.kernel.org
>> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of John Ronan
>> Sent: Thursday, March 27, 2008 12:14 PM
>> To: Linux-Hams
>> Subject: conversd
>>
>> Hi,
>>
>> I've been googling and can't find an answer to what the 'de-facto'
>> convers server is.  (Or is it a religious question?).
>>
>> Regards
>> de John
>> EI7IG
>>
>> --
>> John Ronan <jronan@tssg.org>, +353-51-302938
>> Telecommunications Software &  Systems Group,  http://www.tssg.org
>>
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-hams" in the body of a message to
>> majordomo@vger.kernel.org More majordomo info at
>> http://vger.kernel.org/majordomo-info.html
>>
>

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



