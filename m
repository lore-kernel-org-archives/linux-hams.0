From: John Hurst <jhurst@utac.net>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 08:41:12 -0700
Message-ID: <68826e6e97da1023788e9ddc026b6e0d@utac.net>
References: <620c90570506110638c4a2659@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v622)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570506110638c4a2659@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Chuck,

It is possible that your DNS resolver is doing the caching. Try 
configuring your host to use the no-ip servers directly. In your 
/etc/resolv.cong file:

         nameserver   8.4.112.74
         nameserver   216.66.37.13
         nameserver   63.208.74.226

If this solves the problem, you may then troubleshoot by a) testing the 
TTL values on the A records given out by no-ip, b) testing the default 
cache value on your resolver (is it yours or your ISP's? many ISPs 
ignore TTL).

-jh



On Jun 11, 2005, at 6:38 AM, Chuck Hast wrote:

> Folks,
> I am using ax25ipd to route some connections over the wire to other 
> sites
> while we get the RF paths back up and running. The issue I am having is
> that some of these sites do not have fixed addresses, and the lease 
> exp-
> ires every 12 hours or so. If I use the domain name address it will 
> pick up
> the numerical address when ax25ipd is first started but once started it
> appears to cash the address it got and continue to use it rather than 
> try
> to resolve the domain name each time it needs to make a connection.
>
> In my particular case I am trying to make connetions to people using
> the no-ip.com domain, but I tried it with another and the same thing
> happens. It resolves the first time and continues to use that address
> even after the dhcp assignment has changed which indicates to me
> that it is only doing address resolution when ax25ipd is starting.
>
> -- 
> Chuck Hast
> To paraphrase my flight instructor;
> "the only dumb question is the one you DID NOT ask resulting in my 
> going
> out and having to identify your bits and pieces in the midst of torn
> and twisted metal."
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

