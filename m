From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom:  Quality issue
Date: Sun, 07 Jul 2013 20:49:17 -0700
Message-ID: <51DA36BD.7070209@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de> <51D905C2.1000301@junglevision.com> <51D99E83.9000604@trinnet.net> <51D9B74E.7030603@junglevision.com> <51DA34A9.5070108@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51DA34A9.5070108@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: Thomas Osterried <thomas@x-berg.in-berlin.de>, linux-hams <linux-hams@vger.kernel.org>

On 7/7/2013 8:40 PM, David Ranch wrote:
>
> Maybe a way to fix this is with a new parameter, say:
>
> # ax25_name min_obs def_qual worst_heard_qual verbose worst_calced_qual
> 1            5    120        120            0    120
>
> --David

If we're up for new parameters.  I suggest a worst_quality_to_send. This 
is the issue as I see it.  We're getting big lists from the internet, 
and the internet partners can handle them, but if you have any RF links, 
they'll be bombarded by a giant list of nodes in the broadcast.  The 
user connects to a 1200 baud TNC, types "NODES" and the table is filled 
up with junk from far away.   He falls asleep before the list finishes 
printing.

We add a 'worst_quality_to_send' and then you can set a worst quality to 
send to each specific connection.  Set your RF links to 255 and your IP 
connections to 1.   That way the RF connections can get a tiny list of 
only the absolute most important stuff, but internet partners can get 
all the distant nodes.  This is a pretty easy change to make.  It's all 
in netromd and doesn't require any mucking with the kernel.
