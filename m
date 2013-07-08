From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom:  Quality issue
Date: Mon, 08 Jul 2013 06:24:38 -0700
Message-ID: <51DABD96.6060600@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de> <51D905C2.1000301@junglevision.com> <51D99E83.9000604@trinnet.net> <51D9B74E.7030603@junglevision.com> <51DA34A9.5070108@trinnet.net> <51DA36BD.7070209@junglevision.com> <46D0BA07-A3AB-4477-BE76-4582DFC84823@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <46D0BA07-A3AB-4477-BE76-4582DFC84823@osterried.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@osterried.de>
Cc: David Ranch <linux-hams@trinnet.net>, Thomas Osterried <thomas@x-berg.in-berlin.de>, linux-hams <linux-hams@vger.kernel.org>, "ralf@linux-mips.org Baechle" <ralf@linux-mips.org>

On 7/8/2013 12:48 AM, Thomas Osterried wrote:
>
> Nice idea, this outgoing filter.
>
> But I see problems with worst_qual filters being different for each interface. Even more, if we'll have two (in and outbound).
>
> Example:
>
>
> A <-> B <-> INET-Host <-> C-in-inet
>
>                            ^ learned: INET-HOST, A, B
>   ^    ^
> learned:
> only INET-Host
>
>
> User on C-inet tries to connect A.
> But A has not learned C-inet by B's broadcast and thus has no route to answer.


Yeah, I see what you're saying.  Really we do have this problem anyway, 
though.  I suppose.  If a TNC sets its worst_quality to be high and 
someone from that node connects in, there's no way to reply.    When 
worst_quality on a TNC is set high, the internet machine sends a giant 
list of nodes over 1200 baud, and then the TNC would throw them all 
away.  If we could match these then the IP connected machine could avoid 
putting all this extra stuff on the 1200 baud RF channel.

Maybe could be fixed with some kind of scheme that could set quality 
based on traffic going through -- but the node broadcast would be too 
late for a connect, so at least the first connect wouldn't get through.


> => In the inet cloud there would be many nodes which are not reachable.
>     Where's the benefit?
>

Just that the massive node list on 1200 baud TNC is a poor user experience.


> Even worse, if you like to make IP:
> you cannot manually connect from node to node; you depend on a working bi-directional l3 route.
>

