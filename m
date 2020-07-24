From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Prevent out-of-bounds
 read in ax25_sendmsg()
Date: Fri, 24 Jul 2020 15:25:18 -0700
Message-ID: <9ed88432-ef95-f01a-9655-7c60158e3b09@trinnet.net>
References: <20200722160512.370802-1-yepeilin.cs@gmail.com>
 <20200722.180723.102622644879670834.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20200722.180723.102622644879670834.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Miller <davem@davemloft.net>, yepeilin.cs@gmail.com
Cc: jreuter@yaina.de, ralf@linux-mips.org, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


I need to ask the following question to the Linux kernel community as 
the AX25 amateur radio community is already having to
work around a few broken commits that were committed 4.1.22+:

   Is anyone actually _*testing*_ these proposed changes to make sure 
the AX.25 and related ecosystem still work afterwards?

I've personally tried multiple times to recruit some help to get some of 
these previous commits rolled back from some
recommended kernel people including even some the original authors like 
Alan Cox, etc without any success.  I fear that if
more commits come into the kernel without any testing, the whole AX.25 
stack will become toxic and unusable.

I am not a kernel class developer but I am *personally* willing to help 
out on the testing effort and even help setup regression
topologies (VMs, containers, whatever) if there is some place that they 
can be ideally run in a continuous delivery.

If there is anyone also willing to help fix some of these previous 
commits and get the AX.25 stack kernel back on track,
I do have a bunch of details of the commit details, details on why those 
committers THOUGHT they were a good idea, etc.

--David
KI6ZHD


On 07/22/2020 06:07 PM, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Wed, 22 Jul 2020 12:05:12 -0400
>
>> Checks on `addr_len` and `usax->sax25_ndigis` are insufficient.
>> ax25_sendmsg() can go out of bounds when `usax->sax25_ndigis` equals to 7
>> or 8. Fix it.
>>
>> It is safe to remove `usax->sax25_ndigis > AX25_MAX_DIGIS`, since
>> `addr_len` is guaranteed to be less than or equal to
>> `sizeof(struct full_sockaddr_ax25)`
>>
>> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> Applied.

