From: Dave Platt <dplatt@radagast.org>
Subject: Re: Qsl.net availability
Date: Wed, 14 Apr 2004 15:40:16 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040414224016.30670.qmail@radagast.org>
References: <20040414192725.482d515a.john@jcoppens.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040414192725.482d515a.john@jcoppens.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

John Coppens <john@jcoppens.com> wrote:
> Hello people.
> 
> Since a few months, I cannot connect to www.qsl.net from where I live
> (Argentina). I can connect with FTP, but not in HTTP (webpages). I can
> ping www.qsl.net, Not only I can't connect to my own page, but I cannot
> connect to any of the webpages at QSL.NET.

This site comes up just fine for me, here in California.

> I am not ruling out a configuration problem in my Linux machine, but I
> cannot find out why this is the _only_ site I cannot connect to.

One possibility is that the WWW.QSL.NET server machine is blocking
TCP connections from your IP address range.

I'm sorry to say that Argentina's ISPs are in very bad odor with
quite a few system administrators in North America.  This is due
to the large number of spammers, spammers' web sites, virus- and
trojan-horse-infected client systems, "script kiddies" probing
for security vulnerabilities, etc. found on Argentina's networks,
and to the apparent unwillingness of the ISPs involved to respond
to reports of these abuses or to take any visible steps to clean
up their networks.

A fair number of fed-up administrators have started blocking all
inbound email from the LACNIC IP space assigned to Argentina.  Some
have even blocked all inbound TCP traffic from Argentina at their
border routers.  This may, possibly, be what is affecting you.

Argentina's not alone in this sort of treatment.  Quite a few
USA ISPs (in particular, some of the big cable-modem and DSL
providers) are facing similar forms of "prophylactic blocking"
by sysadmins who are fed up with floods of abuse from
slackly-managed ISPs.

Another possibility is that there's some sort of fairly selective
routing problem involved.  What do you see if you run the command
"/usr/sbin/traceroute www.qsl.net" from your Linux system?



