From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Re: ARPS userland apps
Date: Mon, 04 Jun 2012 09:12:55 +0100
Message-ID: <4FCC6E07.1040205@gjcp.net>
References: <4FCC13C1.5090003@hawtin.net.au> <4FCC1907.5090403@gjcp.net> <4FCC2B6E.4060408@hawtin.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FCC2B6E.4060408@hawtin.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

On 04/06/12 04:28, Kim, VK5FJ wrote:

> Ok, I had a quick look and couldn't get it passed the
> waf configure.
>
> Its failing on the dependencies;
> Checking for 'osmgpsmap' >= 0.7.2 : not found

If you're on Ubuntu (and possibly Debian) this is because libosmgpsmap 
is broken, and misses the dependency on libsoup2.4-dev

You'll also likely need to install libfap manually.

-- 
Gordonjcp MM0YEQ
