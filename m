From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: ax25ipd.c routing
Date: Mon, 7 Dec 2009 21:26:50 +0100
Message-ID: <20091207202650.GM19524@x-berg.in-berlin.de>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de> <4B1D5F4A.7050002@junglevision.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B1D5F4A.7050002@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams@vger.kernel.org

Hello,

> What about this for both my and Bernard's issue.
>
> 1.  If a callsign is received from the ip of a known route
> but is not the callsign of a known route, or the callsign
> of the local station, then add this callsign
> and the route pointer to a binary tree.  If the callsign
> was previously in the tree, then the new route replaces
> the old one, if different.

yes. And if not set to "permanent" (p).

> 2.  in call_to_ip, before it checks the default route,
> it checks this binary tree for this callsign, and returns the
> route it came from.  If the callsign is not found, the default
> route is used.

yes.

> 3.  Callsigns never expire.  The tree just grows.

yes.

> 4.  SSID's are matched as unique callsigns.

call + same-ssid unique.
If you like to route i.E. ssid 0 to 15 permanently to a specific host,
it's only 16 lines. That's ok.

> 5.  If the callsign is that of a ddns route,
> Fork, check dns, and if the ip matches the dns,
> update the route_table_entry->ip_addr

No. Don't fork.
The best solution is a posix thread, which does periodicaly the resolving,
and to use a mutex-lock in the special case an IP address is currently being
looked up.

> 6.  If a process is already forked for updating the ip of
> a particular route, do not fork another one.  Add
> a variable to route_table_entry to verify this.

A single thread is sufficient.

73,
	- Thomas
