From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Problems with AXIP
Date: Mon, 5 Mar 2007 13:05:34 +1100
Message-ID: <20070305020534.GA29965@cloud.net.au>
References: <dd22fa9c0703041754p2cab7ffnec39851fddc2f387@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dd22fa9c0703041754p2cab7ffnec39851fddc2f387@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Mar 04, 2007 at 08:54:20PM -0500, Stephen Brown Jr wrote:
> I have been frantically trying to get AXIP using UDP setup between a
> couple of boxes for APRS use and I am about at my wits end. I stumbled
> across this list while searching for information, so I'm hoping
> someone here can help me.
> 
> Basically what I have are two boxes, 1 is running Debian 3.1 with a
> custom 2.4.33 kernel and AX.25 support compiled directly in. The other
> box is Ubuntu 6.06 with the standard K7 kernel that can be found in
> the repository. I have libax25, ax25-apps, and ax25-tools setup on
> both machines, both were installed from the repositories.

Stephen,

I don't know about your specific problem, but linux 2.4.x had bugs in
several parts of the AX.25 stack. Perhaps you could try upgrading your
woody installation to 2.6.x and see if it helps?

Ideally later than the 2.6.8 included with woody too. You can probably
find a suitable kernel at backports.org or a similar site.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
