From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: ax25ipd.c routing
Date: Tue, 08 Dec 2009 14:15:36 -0800
Message-ID: <4B1ED008.4090302@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de> <4B1D5F4A.7050002@junglevision.com> <20091207202650.GM19524@x-berg.in-berlin.de> <4B1D84C4.8000206@exemail.com.au> <20091207235111.GS19524@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091207235111.GS19524@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

http://hamradio.ke6i.com/ax25ipddyn.patch

I made another patch.  This one against 0.0.8.rc2 again.
This combines my original change with the dynamic DNS patch.

I know this is one of those 'big patches' that everyone hates,
so, sorry.  I tested this a bit, but I think I'll let this run
on my AX25 system for about a week before I try to make it official.

Mostly, I'm posting this in case anyone is curious.  This does
the change, as requested for the DNS patch, to make it use a
thread.  I use pthread_create to create the thread.  Also when
IP's are changed or referenced, the code uses pthread_mutex_lock
to protect the change.  I had to touch a few places in the code
for this.

This is my idea for the 'when to check dns' issue.

1.  If a packet comes in with the callsign of a listed route, that
does not match the expected IP, trigger a DNS lookup, provided
a DNS lookup has not happened within 5 minutes.
2.  Otherwise check DNS every hour.  60*60 seconds.
3.  If the 'P' flag is set never check DNS.

This is not really well-tested, though I have seen IP's update via DNS
in the log.  I believe that a packet should come in relatively soon
after an ip change and this should allow for a relatively quick
response.   The 5 minute delay is to prevent DNS from getting
hit too hard if a lot of these packets arrive.

The 1 hour check is a fallback, in the event that both systems are
set to Dynamic DNS, and both change at about the same time, or if
other mysterious circumstances occur.

I tried to save the idea of the original dyndns patch of checking DNS
later if DNS fails on startup. In this situation, I set the IP to 0.
A check is added to prevent packets from being sent to ip=0.

