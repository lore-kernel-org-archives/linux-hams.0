From: Chuck Hast <wchast@gmail.com>
Subject: ax25ipd issue
Date: Sat, 11 Jun 2005 07:38:46 -0600
Message-ID: <620c90570506110638c4a2659@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

Folks,
I am using ax25ipd to route some connections over the wire to other sites
while we get the RF paths back up and running. The issue I am having is
that some of these sites do not have fixed addresses, and the lease exp-
ires every 12 hours or so. If I use the domain name address it will pick up
the numerical address when ax25ipd is first started but once started it
appears to cash the address it got and continue to use it rather than try
to resolve the domain name each time it needs to make a connection.

In my particular case I am trying to make connetions to people using
the no-ip.com domain, but I tried it with another and the same thing
happens. It resolves the first time and continues to use that address
even after the dhcp assignment has changed which indicates to me
that it is only doing address resolution when ax25ipd is starting.

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
