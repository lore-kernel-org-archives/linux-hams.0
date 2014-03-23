From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Packet BBSes on ax25d
Date: Sun, 23 Mar 2014 21:13:22 +1100
Message-ID: <532EB3C2.5090803@exemail.com.au>
References: <i2h20b-t7c.ln1@atomos.longlandclan.yi.org> <20140323080815.GA15209@gjcp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20140323080815.GA15209@gjcp.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordon JC Pearce <gordonjcp@gjcp.net>, linux-hams@vger.kernel.org

On 23/03/14 19:08, Gordon JC Pearce wrote:
> On Sun, Mar 23, 2014 at 06:02:58PM +1000, Stuart Longland VK4MSL wrote:
>> So since ax25d works, I'm on the look-out for some BBS software that
>> could possibly work within ax25d.
>>
>> I recognise this has been asked before: back in 1998.  I ask now
>> in case things have changed.
>>
>> Has anyone seen such software?
>> Regards,
>> Stuart Longland
> I was looking for some too, but couldn't find any and couldn't even get the old software working well enough to try and characterise how it worked.
>
> Maybe it's time to start from scratch.  What should a packet BBS do?
>
The xfbb mailing list is still active and might be a good place to ask 
questions. The maintainer of xfbb is Bernard, F6BVP, who frequents this 
list, but many xfbb users do not.

Reflecting back to when I ran xfbb the only configuration for ax25d was 
for Netrom calls to connect to fpacnode. xfbb did it's own listening for 
ax25 traffic via kernel ax25 ports.

Ray vk2tv
