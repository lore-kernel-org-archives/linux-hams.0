From: Hamish Moffatt <hamish@debian.org>
Subject: Re: Listen command
Date: Wed, 10 Mar 2004 11:48:04 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310004804.GA22310@cloud.net.au>
References: <E6B40EBA0E7B31449C3C565C8ED2F2A001D35EB0@spsrvr04.sp.gruposimoldes.pt>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E6B40EBA0E7B31449C3C565C8ED2F2A001D35EB0@spsrvr04.sp.gruposimoldes.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Debian Ham =?iso-8859-1?Q?=28Correio_electr=F3nico=29?= <debian-hams@lists.debian.org>, Ham-List =?iso-8859-1?Q?=28Correio_electr=F3nico=29?= <linux-hams@vger.kernel.org>

On Tue, Mar 09, 2004 at 01:41:11PM -0000, Cristiano Tavares - SP wrote:
> After instaling all the software for ax25 why does the LISTEN command works with root and does not work with my normal user?
> 
> I get a error message like:

Non-root users aren't allowed to grab all packets on the AX.25 socket,
just like all users aren't allowed to run tcpdump to get all packets on
ethernet.

> Is there any group I must add my normal user?
> Which one?

I don't think Debian has listen set up like that. You can make it suid
root though which would allow anyone to run it. Or suid root, belonging
to a group of your choice without execute permission for others.

I don't know if a permission change would be preserved when you upgrade
the package next though.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
