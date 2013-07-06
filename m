From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom on kernel version 3.9.6-200
Date: Fri, 05 Jul 2013 22:42:03 -0700
Message-ID: <51D7AE2B.3070408@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51D7AC41.6060606@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

On 7/5/2013 10:33 PM, Cathryn Mataga wrote:
> On 7/5/2013 9:43 PM, Cathryn Mataga wrote:
>> On 7/5/2013 9:19 PM, Cathryn Mataga wrote:
>>> Hmm, is netrom known to work?  I'm on 3.9.6-200, and I'm getting 
>>> weird results with netrom.
>>>
>
> Wait, wait, this is definitely a Fedora issue and not a kernel issue.  
> Because I copied in nrattach that I compiled myself and it started 
> correctly.   (I don't think it's a 'old versions of libax25 lying 
> around issue'  but I haven't completely ruled that out yet.)

Wait a minute.  Someone has been mucking about with nrattach.c . They 
removed the the code that actually connects the netrom port.     Bahh..

#ifdef  notdef
         if (!startiface(dev, hp))
                 return 1;
#endif


