From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Tue, 20 Jan 2009 09:41:54 +1100
Message-ID: <497501B2.7060209@exemail.com.au>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net> <alpine.LNX.1.10.0901191336440.22828@wapiti2.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0901191336440.22828@wapiti2.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: linux-hams@vger.kernel.org

Curt, WE7U wrote:
> On Sun, 18 Jan 2009, Curt, WE7U wrote:
>
>> I saw several bugs in the AX.25 stuff yesterday/today.
>
> An update:  I figured newer versions of the AX.25 bits in the SuSE
> ham repository but my update methods were not snagging them.  The
> SuSE update methods need a bit of revision as neither "Online
> Update", nor "zypper ref; zypper up --type package" gets everything.
> The only method that does (thanks Ken!) is Software Management ->
> Package -> All Packages -> Update if newer version available.
>
> So... I need to repeat my on-air tests with Bob using the newer
> AX.25 modules and tools to see if any or all of the bugs reported
> are still evident.  Stay tuned.
>
Are you guys familiar with the work being done by Bernard, F6BVP, on 
kernel ax25 related stuff? Some of his patches have been included in 
later kernels.

Bernard's source files for libax25, ax25-apps & ax25-tools are available 
here

http://f6bvp.free.fr/logiciels/ax25/

Ray vk2tv
