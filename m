From: kd1zd@rtcubed.org
Subject: Re: Raspberry PI and netrom
Date: Sun, 21 Apr 2013 19:06:36 -0400 (EDT)
Message-ID: <750ed339.1d0c.13e2ed95a84.Webtop.53@rtcubed.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="no"
To: f6bvp@free.fr
Cc: linux-hams@vger.kernel.org, gordonjcp@gjcp.net

I think I found this the other day, thanks for posting it on the list.

I was able to get my netrom working.

Thank you.


On Sun, Apr 21, 2013 at 12:32 PM, f6bvp@free wrote:

> Hi,
>
> I am running two RaspBerry Pis with AX.25, NetRom and Rose network 
> devices.
> When loading ax25 modules there is no problem.
> However, due to modules or kernel bugs, when loading NetRom or Rose 
> modules
> with modprobe or if netrom or rose are listed in /etc/modules, then 
> ALL netrom
> and rose devices are wrongly initialized.
>
> This can be easily bypassed by editing ifplugd configuration file.
>
> I suggest you edit /etc/default/ifplugd   and replace
>
> HOTPLUG_INTERFACES="all"
>
> by
>
> HOTPLUG_INTERFACES="eth0"
>
>
> 73 de Bernard, f6bvp
> (http://f6bvp.org)
>
>
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
