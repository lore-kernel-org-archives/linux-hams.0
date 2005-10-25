From: John Ronan <jronan@tssg.org>
Subject: Re: 2.6.14-r4 crashing
Date: Tue, 25 Oct 2005 21:46:25 +0100
Message-ID: <DED598BC-2481-467C-8410-7AD36375989D@tssg.org>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12> <20051022124642.GA3951@linux-mips.org> <60264.192.168.1.2.1130068144.squirrel@192.168.1.12> <20051024111956.GD2605@linux-mips.org> <1204.166.216.119.217.1130256561.squirrel@aa6qn.sytes.net>
Mime-Version: 1.0 (Apple Message framework v734)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1204.166.216.119.217.1130256561.squirrel@aa6qn.sytes.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: aa6qn@aa6qn.sytes.net
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Hi,

I had unending difficulties when trying netrom and kernel 2.6... in  
the end I gave up and am running 2.4 now for stability.

Linux version 2.4.29 (root@ei3rcw) (gcc version 3.3.5 (Debian  
1:3.3.5-8)) #5 Fri Apr 15 13:37:45 IST 2005

to be exact.

Regards
John

On 25 Oct 2005, at 17:09, aa6qn@aa6qn.sytes.net wrote:

>  I changed the freq selection per earlier email to 1000hz and that  
> seemed
> to help (at least from a tnc timing perspective). The system did  
> have a
> kernel panic after a couple of netrom non-connections.
>
> I really believe you hit the nail on the head that most of my problems
> present and past where netrom based. When I loaded ax25 excluding the
> netrom application the platform did very well.( I ran netrom from jnos
> vice the ax25 utils).
>
> Whenever I load the ax25 netrom it seems that when I try a netrom  
> connect
> and it fails a kernel panic results soon there after.
>
> So, for the moment I have removed the ax25 utils and am just  
> running Jnos
> 2.0d via a slip link ( I can not get the tun device working with  
> uDev).
> The system is quite solid.
>
> I am curious where the "ip route add (network) via (gateway) dev tunl0
> static onlink" command loads but does not route anymore whereas "ip  
> tunnel
> add (name) remote (remote gw) local (local ip) dev tunl0" does  
> work. Did
> something change with IPROUTE2 ? The ip route add worked for me  
> before and
> allowed ax25ipd links.
>
> I would be more than happy to try any other ideas/patches that may  
> relieve
> the ax25 kernel challanges.
>
> very best wishes, JohnF
> -
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



