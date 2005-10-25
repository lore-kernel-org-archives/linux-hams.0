From: aa6qn@aa6qn.sytes.net
Subject: Re: 2.6.14-r4 crashing
Date: Tue, 25 Oct 2005 09:09:21 -0700 (PDT)
Message-ID: <1204.166.216.119.217.1130256561.squirrel@aa6qn.sytes.net>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12>
    <20051022124642.GA3951@linux-mips.org>
    <60264.192.168.1.2.1130068144.squirrel@192.168.1.12>
    <20051024111956.GD2605@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051024111956.GD2605@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

 I changed the freq selection per earlier email to 1000hz and that seemed
to help (at least from a tnc timing perspective). The system did have a
kernel panic after a couple of netrom non-connections.

I really believe you hit the nail on the head that most of my problems
present and past where netrom based. When I loaded ax25 excluding the
netrom application the platform did very well.( I ran netrom from jnos
vice the ax25 utils).

Whenever I load the ax25 netrom it seems that when I try a netrom connect
and it fails a kernel panic results soon there after.

So, for the moment I have removed the ax25 utils and am just running Jnos
2.0d via a slip link ( I can not get the tun device working with uDev).
The system is quite solid.

I am curious where the "ip route add (network) via (gateway) dev tunl0
static onlink" command loads but does not route anymore whereas "ip tunnel
add (name) remote (remote gw) local (local ip) dev tunl0" does work. Did
something change with IPROUTE2 ? The ip route add worked for me before and
allowed ax25ipd links.

I would be more than happy to try any other ideas/patches that may relieve
the ax25 kernel challanges.

very best wishes, JohnF
