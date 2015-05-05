From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Packet duplication in kernels 2.6 onwards
Date: Mon, 04 May 2015 21:05:51 -0700
Message-ID: <5548419F.1030801@trinnet.net>
References: <5547BACC.7000709@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5547BACC.7000709@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

Hello Richard,

Can you give us some more details?  Are the duplicates on every packet?  
Is this RX or TX duplicates  Only some?  Is this unproto or connected?  
Are you using a HW TNC or a SW TNC?
I'm using the 3.17.5 kernel w/o issues.

--David
KI6ZHD



On 05/04/2015 11:30 AM, Richard Stearn wrote:
> Just put togther a packet system to test wireshark on and
> discovered that packets are being duplicated at the ax0 interface.
>
> My tests so far show that the issue is not present in kernels
> 2.4.29 & 2.4.37.11 and is present in kernel 2.6.33.3.
> I also have reports of the issue being in kernel 3.x.x.x
>
> Is this a known issue?
>
> If so is there any idea as to when it appeared? My guess is during
> the 2.5 kernel series.
>
> Has anybody on the list attempted to trace the cause?
>

