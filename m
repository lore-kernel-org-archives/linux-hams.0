From: Chuck Gelm <nc8q@gelm.net>
Subject: Re: FBB for linux and internet forwarding
Date: Sun, 08 Dec 2002 16:25:51 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DF3B8DF.1D44C438@gelm.net>
References: <200212080932.03464.n7bfs@qwest.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: n7bfs@qwest.net
Cc: linux-hams@vger.kernel.org

Hello, Douglas:

 I've run an active Linux networking server for as long as 6 months
without and problems.  Actually that 6 months period was terminated
to install a faster modem. ;-)  So this narrows down the topic of
"concerned about ease of setup and stability" to 
"ease of setup". ;-)

 Although the 'ease of setup' is perhaps more difficult with
Linux, more can be done with xFBB than with the DOS version.

 As a minimum, the first thing I can suggest is to subscribe to
the fbb@f6fbb.org and xfbb@f6fbb.org list.

 IMHO, if you have been running or using nodes
 (NETROM 2000, THENET, X1J, Xrouter, or G8BPQ) get ready for a 
disappointment.  The current linux implementation of 'node' is
made expressly for wire networking with little adaptation for
radio networking environments.  :-(

 Next:
"internet forwarding (through a cable modem) and coming out on
 VHF node freq'."

 This seems ambiguous or has two topics:
"internet forwarding" happens between two pBBSs that have
an internet 'port'.

 "coming out on VHF node frequency" has multiple topics also:
"coming out" == tranceiving
VHF == what difference does the band make?
'node' == do you want standard AX.25 packets on the 'node frequency'
or do you need L3/L4 packets on the 'node frequency'?

 -or- 
 
 This is purely a choice of whether you wish to enable the
'gateway' function of FBB.  All this should probably be discussed
on the FBB/xFBB list(s).

 Lastly, this list may be appropriate to discuss 
packet (AX.25 and 'linux-node') "kernel and lockup problems"
as xFBB has nothing to do with how the kernel generates 
AX.25 and 'node' packets.  :-|

HTH, Chuck nc8q

Douglas Cole wrote:
> 
> A question for the list that hopefully will not be too open ended .
> 
> Our local packet crew (two guys)is considering changing from DOS based FBB BBS
> to a Linux based machine but are concerned about ease of setup and stability.
> 
> They wish to use internet forwarding (through a cable modem) and coming out on
> VHF node freq'.
> 
> My concern is , since I subscribe to this list for other reasons not related
> to packet and am not a packet person, I see alot of posts recently about
> troubles with the kernel and lockup problems , so my question is , is this
> only for folks who are doing non-standard things or is this an issue with any
> amateur trying to setup a Linux based FBB BBS with internet forwarding?
> 
> I don't want to have given them the wrong impression about Linux stability (I
> use it on a daily basis for my desktop), only to have it be a troublesome and
> failure prone system , as they are very happy with their DOS based machine ,
> they just want to move into the TCP/IP internet based way of forwarding ,
> which apparently the dos based one is hard to make so ...
> 
> Any input or links/pointers on what not to do would be appreciated , they will
> just be starting out with Linux and I am not knowledgable with Linux packet
> at all...
> 
> tia
> 
> --
> Douglas Cole   N7BFS
> Spokane IRLP node owner
> AMSAT#26182 , K2 # 544
> http://www.users.qwest.net/~cdoug3
> Registered Linux user # 188922
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
