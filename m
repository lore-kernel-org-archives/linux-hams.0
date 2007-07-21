From: "IT3 Stuart Blake Tener, USN" <teners@bh90210.net>
Subject: Re: BayPac BP-1 Modem and Linux
Date: Fri, 20 Jul 2007 22:11:39 -0700
Message-ID: <C2C6E39B.EC4F%teners@bh90210.net>
References: <A6FEE2F8-48F7-4994-8B3D-447C0DD66221@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <A6FEE2F8-48F7-4994-8B3D-447C0DD66221@oz.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Bob Nielsen <nielsen@oz.net>

Bob:

    Indeed the more I learn about Ubuntu 7.04, the more I am impressed with
its capabilities.

    I intend to attempt its installation on a Sun e450 later this month!


V/R,

Stuart, N3GWG



On 7/20/07 7:48 PM, "Bob Nielsen" <nielsen@oz.net> wrote:

> 
> On Jul 20, 2007, at 6:37 PM, Doug wrote:
> 
>> Is there anyway to connect a BayPac BP-1 modem to a linux system. I
>> seem to find drivers
>> for only the epp and usb variety. I need a modem to check my port
>> configiration via the
>> "LISTEN" command and I have run out unless I shut down the cluster
>> and the bbs.
>> Fbb is not loaded onto the system just yet. This is a new system
>> (Mepis 6.5) and nothing
>> else is loaded on to it yet except the ax25 stuff. The BP-1 is a
>> serial device.
> 
> My Ubuntu 7.04 stock kernel includes the baycom_ser_hdx.ko module.
> If this one isn't included with Mepis, you need to recompile the
> kernel and make sure the configuration file includes:
> 
> CONFIG_BAYCOM_SER_HDX=m (or y)
> 
> Bob, N7XY
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 

Very Respectfully,

IT3 Stuart Blake Tener, USN
Beverly Hills, California
Amateur Radio Call Sign: N3GWG (Extra)
email: teners@bh90210.net
phone: +(1) 310.358.0202 (Beverly Hills, CA)
phone: +(1) 215.338.6005 (Philadelphia, PA)
phone: +(1) 702.988.3989 (Las Vegas, NV)
E-Fax: +(1) 915.773.0935 (Telecopier)

Military emails (checked monthly until remote NMCI access is secured)
NIPRNET: stuart.tener@navy.mil / tenerstu@nro.mil
SIPRNET: NONE
TS/SCI:  tenerstu@nro.ic.gov (GWAN)

Confidentiality Notice: This e-mail message, including any attachments, is
for the sole use of the intended recipient(s) and may contain confidential
and/or privileged information. Any unauthorized review, use, disclosure or
distribution is prohibited. If you are not the intended recipient, please
contact the sender by reply e-mail and destroy all copies of the original
message.



