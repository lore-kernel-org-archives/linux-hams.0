From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Re: IMPORTANT: LinuxNode v0.3.2
Date: Tue, 09 Sep 2003 11:34:34 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F5E1D3A.1010907@junglevision.com>
References: <1061923547.1292.66.camel@oh2bns.ampr.org>	 <3F5DCC52.7040505@junglevision.com> <1063126228.1293.35.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1063126228.1293.35.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org



Tomi Manninen wrote:

> On Tue, 2003-09-09 at 15:49, Cathryn Mataga wrote:
> 
> 
>>/usr/local/include/netax25/axlib.h:49: parse error before `null_ax25_address'
> 
> 
> This comes from an old libax25. While you _can_ solve this by simply 
> adding a few #includes in node source code, I would recommend upgrading 
> libax25 to the latest version (0.0.11). That fixes some nasty node
> related bugs as well...
> 

Okay, thanks guys.  Yeah, putting in libax25.0.011 fixed the compile problem.

