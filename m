From: Kim VK5FJ <vk5fj@hawtin.net.au>
Subject: Re: ARPS userland apps
Date: Mon, 04 Jun 2012 22:01:19 +0930
Message-ID: <4FCCAA97.1050609@hawtin.net.au>
References: <4FCC13C1.5090003@hawtin.net.au> <4FCC1907.5090403@gjcp.net> <4FCC2B6E.4060408@hawtin.net.au> <4FCC6E07.1040205@gjcp.net>
Reply-To: vk5fj@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FCC6E07.1040205@gjcp.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordon JC Pearce <gordonjcp@gjcp.net>
Cc: linux-hams@vger.kernel.org

On 04/06/12 17:42, Gordon JC Pearce wrote:
> On 04/06/12 04:28, Kim, VK5FJ wrote:
>> Ok, I had a quick look and couldn't get it passed the
>> waf configure.
>>
>> Its failing on the dependencies;
>> Checking for 'osmgpsmap' >= 0.7.2 : not found
>
> If you're on Ubuntu (and possibly Debian)

yes debian/squeeze

> this is because libosmgpsmap
> is broken, and misses the dependency on libsoup2.4-dev
>
> You'll also likely need to install libfap manually.

yeah, that makes more sense. i'll have a crack at that shortly.

regards,

Kim
