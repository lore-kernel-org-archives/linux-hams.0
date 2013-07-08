From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Netrom:  Quality issue
Date: Mon, 8 Jul 2013 09:48:20 +0200
Message-ID: <46D0BA07-A3AB-4477-BE76-4582DFC84823@osterried.de>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de> <51D905C2.1000301@junglevision.com> <51D99E83.9000604@trinnet.net> <51D9B74E.7030603@junglevision.com> <51DA34A9.5070108@trinnet.net> <51DA36BD.7070209@junglevision.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51DA36BD.7070209@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: David Ranch <linux-hams@trinnet.net>, Thomas Osterried <thomas@x-berg.in-berlin.de>, linux-hams <linux-hams@vger.kernel.org>, "ralf@linux-mips.org Baechle" <ralf@linux-mips.org>


Am 08.07.2013 um 05:49 schrieb Cathryn Mataga <cathryn@junglevision.com>:

> On 7/7/2013 8:40 PM, David Ranch wrote:
>> 
>> Maybe a way to fix this is with a new parameter, say:
>> 
>> # ax25_name min_obs def_qual worst_heard_qual verbose worst_calced_qual
>> 1            5    120        120            0    120
>> 
>> --David
> 
> If we're up for new parameters.  I suggest a worst_quality_to_send. This is the issue as I see it.  We're getting big lists from the internet, and the internet partners can handle them, but if you have any RF links, they'll be bombarded by a giant list of nodes in the broadcast.  The user connects to a 1200 baud TNC, types "NODES" and the table is filled up with junk from far away.   He falls asleep before the list finishes printing.
> 
> We add a 'worst_quality_to_send' and then you can set a worst quality to send to each specific connection.  Set your RF links to 255 and your IP connections to 1.   That way the RF connections can get a tiny list of only the absolute most important stuff, but internet partners can get all the distant nodes.  This is a pretty easy change to make.  It's all in netromd and doesn't require any mucking with the kernel.

Nice idea, this outgoing filter.

But I see problems with worst_qual filters being different for each interface. Even more, if we'll have two (in and outbound).

Example:


A <-> B <-> INET-Host <-> C-in-inet

                          ^ learned: INET-HOST, A, B
 ^    ^
learned:
only INET-Host


User on C-inet tries to connect A.
But A has not learned C-inet by B's broadcast and thus has no route to answer.

=> In the inet cloud there would be many nodes which are not reachable.
   Where's the benefit?


Even worse, if you like to make IP:
you cannot manually connect from node to node; you depend on a working bi-directional l3 route.

vy 73,
	- Thomas  dl9sau




