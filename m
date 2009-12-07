From: Cathryn Mataga <cathryn@junglevision.com>
Subject: ax25ipd.c routing
Date: Mon, 07 Dec 2009 02:30:27 -0800
Message-ID: <4B1CD943.6030808@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B14B22E.6010901@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

How does this work with multiple connections?

Suppose I have two incoming connections
My call is K1BBS.

route K1PAR 1.0.0.0
route K2PAR 2.0.0.0 d

Then suppose K1USR at K1PAR does a connect to K1BBS.

What seems to happen is I see packets come in from K1USR  to K1BBS.
But then when packets go back out, they go back to K2PAR, even though
he's at K1PAR.   At least that's what I think is happening.

Shouldn't ax25d.c keep a record of which IP callsigns came from, so that
way when it needs to send a packet back they go to the right place?
I'm not 100% sure of this, but it seems like the lookup only checks
the route commands.   I only see one call to route_add in config.c.

Shouldn't it 'route_add' every time a callsign comes in axip?
Or the only way to make this work is to run a separate
ax25ipd for every connection.
