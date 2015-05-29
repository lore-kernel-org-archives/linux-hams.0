From: Miroslav Skoric <skoric@uns.ac.rs>
Subject: Re: Linpac 0.21 (AX.25 packet radio application) posted
Date: Fri, 29 May 2015 20:01:22 +0200
Message-ID: <5568A972.5010104@uns.ac.rs>
References: <5563611F.5020204@trinnet.net> <5565EC9D.6060604@uns.ac.rs> <55669E84.2020500@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <55669E84.2020500@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, Linux Hams <linux-hams@vger.kernel.org>

On 05/28/2015 06:50 AM, David Ranch wrote:

>
>> In fact, what I want to do is to mimic real client-to-server
>> communication as if a real packet network is present. Any idea?
>
> Well, I'm still not quiet following you here but it's worth mentioning
> that the Linpac 1.x proto code is designed to be a client/server design.
>   It's server communicates to the Linux AX.25 stack and can fully
> operate with remote users.  For local users, the Linpac clients (Ncurses
> or Java) connects to the Linpac backend via a TCP connection.  This code
> isn't completely functional at the moment.
>

Hi David,

Maybe I was not clear about what I wanted to have: I meant, let us 
suppose that there is an operational Linux AX.25 stack + a node software 
(such as FPAC or Uronode, etc.) + FBB bbs on a computer. Now I wonder if 
it would be possible to add Linpac to that machine so that Linpac could 
access FBB mails in a way as if uses another computer and ham radio to 
access the bbs computer by air? Or in the other words: Could Linpac be 
installed to access a simulated packet network (a node + fbb) in the 
same computer, so to handle mails within the fbb?

I suppose that something like that might be achieved by some tcpip 
operation (such as telnet localhost, or something similar), but I'd like 
to rather see it by axip or axudp connection that better mimics real ham 
radio traffic. (If you ask me for reasons why I asked for that, well I 
am just not satisfied with FBB's client applications xfbbC and similar 
solutions.)

Misko

