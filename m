From: Willie Hein WJ3G <wj3g@comcast.net>
Subject: Re: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Sun, 26 Sep 2010 19:47:39 -0400
Message-ID: <4C9FDB9B.60705@comcast.net>
References: <4C9D43E0.2040908@danplanet.com> <20100926222456.GA31242@x-berg.in-berlin.de> <4C9FCE46.8090900@danplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C9FCE46.8090900@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

On 09/26/2010 06:50 PM, Dan Smith wrote:
> 2. mkiss could not only be used on true tty's but also on pseudo
>> pty's. Modern linuxes prefer unix98 ptys. Unix98-pty's are allocated
>> automaticaly via /dev/ptmx. Imagine you'd try to use two mkiss
>> instances, both called with /dev/ptmx as argument and -L as option.
>> Here the concept completely fails. Apart from this, it's not 
>> permitted to create files in /dev/pts/.
>>     
> Does anyone do this?  Regardless, many programs have options and usage
> scenarios that are mutually exclusive.
>   
YES All dual port TNC's require the use of psuedo tty's
