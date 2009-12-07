From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: ax25ipd.c routing
Date: Mon, 07 Dec 2009 12:02:18 -0800
Message-ID: <4B1D5F4A.7050002@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091207162523.GC6537@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org


> ax25ipd in it's current version does not learn routes.
> In fact, route_add() is only being called from the config file.
> .../ax25-apps/ax25ipd$ grep route_add *.c
> config.c:               route_add(tip, tcall, uport, flags);
> routing.c:void route_add(unsigned char *ip, unsigned char *call, int udpport,
> .../ax25-apps/ax25ipd$ 
> 
> That's why your packet goes out via the default connection (route K2PAR
> 2.0.0.0 d).
> 


Thank you.  This confirms my understanding of the current issue.


> 
> Btw, the dyndns feature which Bernard Pidoux f6bvp reminded to a few weeks ago
> is still the my queue.
> I've -mostly theoretical- problems with it because it resolves on a
> periodical basis, which means that if the dns currently is broken,
> it even affects LAN connections served by ax25ipd by introducing periodical
> delays.
> Bernard changed route_add(), as also my test-version does, but in a slightly
> different way.
> The test-code also implements periodical dyndns resolving, but iirc, it does
> not work correctly (can't remember).

Hmm.

What about this for both my and Bernard's issue.

1.  If a callsign is received from the ip of a known route
but is not the callsign of a known route, or the callsign
of the local station, then add this callsign
and the route pointer to a binary tree.  If the callsign
was previously in the tree, then the new route replaces
the old one, if different.
2.  in call_to_ip, before it checks the default route,
it checks this binary tree for this callsign, and returns the
route it came from.  If the callsign is not found, the default
route is used.
3.  Callsigns never expire.  The tree just grows.
4.  SSID's are matched as unique callsigns.
5.  If the callsign is that of a ddns route,
Fork, check dns, and if the ip matches the dns,
update the route_table_entry->ip_addr
6.  If a process is already forked for updating the ip of
a particular route, do not fork another one.  Add
a variable to route_table_entry to verify this.

Does this make sense?  Or are there other issues I'm unaware
of?


> 
> For informational purpose, I did a diff between the current cvs head
> and the test version. The test-version startet on an older ax25ipd
> version and only fixes but no cosmetic changes have been manually applied
> (also i.e. still not the unix98 pty support). Here it is:
>   http://db0fhn.efi.fh-nuernberg.de/~dl9sau/ax25ipd-current-to-test--2009-12-07.diff

Alright, thanks.  I'll take a look.
