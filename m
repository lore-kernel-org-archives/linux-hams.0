From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Subject: Re: [PATCH] C99 initializers for net/netrom/sysctl_net_netrom.c
Date: Fri, 14 Feb 2003 00:19:25 -0200
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030214021925.GF6258@conectiva.com.br>
References: <20030214012320.GB13561@debian>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030214012320.GB13561@debian>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Haas <ahaas@airmail.net>
Cc: linux-net@vger.kernel.org, linux-hams@vger.kernel.org

Em Thu, Feb 13, 2003 at 07:23:20PM -0600, Art Haas escreveu:
> Hi.
> 
> Here's a patch that switches the file to use C99 initiailzers to aid
> readability and remove warings if '-W' is used.
> 
> +		.extra1		= &min_quality,
> +		.extra2		= &max_quality

Art, just a small nitpick: the "standard" in the kernel sources is for all
the members to have an ending comma, just like this:

> +		.extra1		= &min_quality,
> +		.extra2		= &max_quality,
                                              ^
                                              ^
                                              ^
So that when we need to add another member the patch gets smaller 8)

Aside from this small nitpick, keep it up the good work!

- Arnaldo
