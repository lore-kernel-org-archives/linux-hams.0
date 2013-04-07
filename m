From: kd1zd@rtcubed.org
Subject: Re: Raspberry PI and netrom
Date: Sun, 7 Apr 2013 12:55:28 -0400 (EDT)
Message-ID: <53b270ca.20c1d.13de56c8b3b.Webtop.52@rtcubed.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="no"
To: linux-hams@vger.kernel.org

Here is the dmesg output:

[  404.890809] NOHZ: local_softirq_pending 08
[  484.280536] NET: Unregistered protocol family 6
[  495.705613] NET: Registered protocol family 6
[  981.229216] NOHZ: local_softirq_pending 08



On Sun, Apr 7, 2013 at 12:46 PM, Gordon JC Pearce wrote:

> On 07/04/13 14:22, kd1zd@rtcubed.org wrote:
>> I have a Raspberry PI running the latest version of wheezy downloaded
>> from the Raspberry site.
>>
>> I'm getting the following error trying to configure NET/ROM:
>>
>> sudo nrattach netrom
>> nrattach: cannot find free NET/ROM device
>>
>
> At this point, does dmesg have any exciting news?
>
> -- 
> Gordonjcp MM0YEQ
