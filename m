From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: ax25ipd.c routing
Date: Mon, 7 Dec 2009 17:25:23 +0100
Message-ID: <20091207162523.GC6537@x-berg.in-berlin.de>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B1CD943.6030808@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams@vger.kernel.org

On 2009-12-07 02:30:27 -0800, Cathryn Mataga <cathryn@junglevision.com>
wrote in <4B1CD943.6030808@junglevision.com>:
> How does this work with multiple connections?
>
> Suppose I have two incoming connections
> My call is K1BBS.
>
> route K1PAR 1.0.0.0
> route K2PAR 2.0.0.0 d
>
> Then suppose K1USR at K1PAR does a connect to K1BBS.
>
> What seems to happen is I see packets come in from K1USR  to K1BBS.
> But then when packets go back out, they go back to K2PAR, even though
> he's at K1PAR.   At least that's what I think is happening.
>
> Shouldn't ax25d.c keep a record of which IP callsigns came from, so that
> way when it needs to send a packet back they go to the right place?
> I'm not 100% sure of this, but it seems like the lookup only checks
> the route commands.   I only see one call to route_add in config.c.

ax25ipd in it's current version does not learn routes.
In fact, route_add() is only being called from the config file.
.../ax25-apps/ax25ipd$ grep route_add *.c
config.c:               route_add(tip, tcall, uport, flags);
routing.c:void route_add(unsigned char *ip, unsigned char *call, int udpport,
.../ax25-apps/ax25ipd$ 

That's why your packet goes out via the default connection (route K2PAR
2.0.0.0 d).


At db0fhn we have since several years a modified version:
...ax25ipd-test/ax25ipd$ grep route_add *.c
config.c:               route_add(&tip, htonl(tmask), fqdn, tcall, (flags | AXRT_FORCE_LEARN | (match_all_ssids ? AXRT_MATCH_ALL_SSIDS : 0)));
process.c:              if (route_add(ip_addr, 0xffffffffUL, 0, f, 0) < 0) {
process.c:fprintf(stderr, "debug: route_add %s failed\n", call_to_a(from_addr(buf)));
process.c:fprintf(stderr, "debug: route_add %s ok\n", call_to_a(from_addr(buf)));
routing.c:int route_add(ip, netmask, fqdn, call, flags)
...ax25ipd-test/ax25ipd$ 

The code I wrote is highly stable. But I personaly found the code quite
ugly: ax25ipd became a monster. That's the reason why it did not enter
the main stream yet.

From the example ax25ipd.conf:
[..]
# route <destcall> [<destaddr>|<network>] [udp dst-port] [flags]
#
# Users behind NAT routers may hav a different source-port.
#
# Valid flags are:
#         b  - allow broadcasts to be transmitted via this route
#         d  - this route is the default route
#         p  - permanent
#
#route vk2sut-0 44.136.8.68 b
#route vk5xxx 44.136.188.221 b
#route vk2abc 44.1.1.1
#route db0aaa 127.0.0.1 p
#route db0aab 10.1.2.3 udp 20005
# For dyndns hosts: IP may change, but resolving of the hostname
# has to point to the same IP address where IP frames come from.
# If flag "p" is set, the host is static (resolved once, on startup).
#route db0abc db0abc.de
#
# Autolearn new (not configured) hosts.
# Valid flags in this case: "b", "p" (learn once).
#route db0abc db0abc.de
#
# Autolearn new (not configured) hosts.
# Valid flags in this case: "b", "p" (learn once).
#route * 0.0.0.0/0 b
#route * 10.1.0.0/16
#route * 10.2.2.2/32
# accept db0yyy only when coming vom 10.3.3.0/24
#route db0yyy 10.3.3.0/24


At db0fhn, that ax25ipd version is used for various purposes:
root      2648  0.1  0.0   1692   240 ?        S    Aug19 262:49 /usr/sbin/ax25ipd --nofork -c /etc/ax25/ax25ipd-xnet.conf
root      3199  0.0  0.0   3488   732 ?        Ss   Aug19 101:58 /usr/bin/SCREEN -dmS ax25ipd -c /etc/ax25/ax25ipd.screen
root      3201  0.0  0.0   1692   248 pts/1    Ss+  Aug19  31:42 /usr/sbin/ax25ipd --nofork -c /etc/ax25/ax25ipd-pptpvpn.conf
root      3202  0.0  0.0   1696   252 pts/2    Ss+  Aug19  68:27 /usr/sbin/ax25ipd --nofork -c /etc/ax25/ax25ipd-openvpn.conf
root      3203  0.0  0.0   1696   272 pts/3    Ss+  Aug19 120:03 /usr/sbin/ax25ipd --nofork -c /etc/ax25/ax25ipd-echolink.conf
root      3643  0.0  0.0   1692   236 pts/4    Ss+  Aug19  15:45 ax25ipd --nofork -c /etc/ax25/ax25ipd-aprs-db0vox.conf
root      3644  0.0  0.0   1692   232 pts/5    Ss+  Aug19   2:12 ax25ipd --nofork -c /etc/ax25/ax25ipd-aprs-db0sao.conf
root      3645  0.0  0.0   1692   236 pts/6    Ss+  Aug19   3:16 ax25ipd --nofork -c /etc/ax25/ax25ipd-aprs-db0prt.conf
root      3649  0.0  0.0   1692   236 pts/7    Ss+  Aug19  11:33 ax25ipd --nofork -c /etc/ax25/ax25ipd-aprs-db0zka.conf


Btw, the dyndns feature which Bernard Pidoux f6bvp reminded to a few weeks ago
is still the my queue.
I've -mostly theoretical- problems with it because it resolves on a
periodical basis, which means that if the dns currently is broken,
it even affects LAN connections served by ax25ipd by introducing periodical
delays.
Bernard changed route_add(), as also my test-version does, but in a slightly
different way.
The test-code also implements periodical dyndns resolving, but iirc, it does
not work correctly (can't remember).

For informational purpose, I did a diff between the current cvs head
and the test version. The test-version startet on an older ax25ipd
version and only fixes but no cosmetic changes have been manually applied
(also i.e. still not the unix98 pty support). Here it is:
  http://db0fhn.efi.fh-nuernberg.de/~dl9sau/ax25ipd-current-to-test--2009-12-07.diff

73,
	- Thomas  dl9sau
