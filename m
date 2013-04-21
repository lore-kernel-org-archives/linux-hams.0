From: "f6bvp@free" <f6bvp@free.fr>
Subject: Re: Raspberry PI and netrom
Date: Sun, 21 Apr 2013 18:32:51 +0200
Message-ID: <517414B3.1000102@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org, kd1zd@rtcubed.org, Gordon JC Pearce <gordonjcp@gjcp.net>

Hi,

I am running two RaspBerry Pis with AX.25, NetRom and Rose network devices.
When loading ax25 modules there is no problem.
However, due to modules or kernel bugs, when loading NetRom or Rose modules
with modprobe or if netrom or rose are listed in /etc/modules, then ALL netrom
and rose devices are wrongly initialized.

This can be easily bypassed by editing ifplugd configuration file.

I suggest you edit /etc/default/ifplugd   and replace

HOTPLUG_INTERFACES="all"

by

HOTPLUG_INTERFACES="eth0"


73 de Bernard, f6bvp
(http://f6bvp.org)


On 07/04/13 14:22, kd1zd@rtcubed.org wrote:
> I have a Raspberry PI running the latest version of wheezy downloaded
> from the Raspberry site.
>
> I'm getting the following error trying to configure NET/ROM:
>
> sudo nrattach netrom
> nrattach: cannot find free NET/ROM device
>

At this point, does dmesg have any exciting news?

-- 
Gordonjcp MM0YEQ

