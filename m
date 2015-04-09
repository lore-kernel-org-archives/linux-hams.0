From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Request for comments regarding Amateur Radio protocols in Wireshark
Date: Thu, 09 Apr 2015 08:19:07 -0700
Message-ID: <5526986B.2030402@trinnet.net>
References: <5526777D.7070405@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5526777D.7070405@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Richard,

Thanks for reaching out and working on this (already been using some of 
your dissectors!) as a good packet capture tool greatly helps in 
troubleshooting network issues.  Anyway, I would personally love to see 
support for:

AXIP - uses the IPIP protocol for tunneling AX.25 packets (very common 
on the AMPR network to interconnect isolated stations)

KISS over TCP - This is somewhat new and is implemented by tools like
    Direwolf - https://home.comcast.net/~wb2osz/site/  (documentation is 
in the zip file)
    APRX - https://groups.google.com/forum/#!topic/aprx-software/LdBGlH2v8c0
    YACC - http://www.ka2ddo.org/ka2ddo/YAACdocs/config_kissovertcp.html
    Xastir, etc

--David
KI6ZHD


On 04/09/2015 05:58 AM, Richard Stearn wrote:
> Hi All
>
> This is a request for comments regarding the Amateur Radio protocol
> dissectors in Wireshark, which I am aware is used by some on this list.
>
> In 2012 the suite of dissectors accepted and add to Wireshark. These
> appeared in 2013 in Wireshark 1.10.0.
>
> Over the last 2 years I have collected more information regarding some
> of the protocols that currently not fully/correctly dissected. Also I
> have had requests to complete/extend some of the dissectors.
>
> I light of the above I am currently reviewing all the dissectors with a
> view to updating them in Wireshark.
>
> I would appreciate comments, bugs, missing bits, detailed protocol
> documents, new protocols that I can use in my review and rework.
>
> The relevent dissectors are:
>     KISS    - coded from KA9Q/K3MC kiss spec
>     AXIP    - coded from Linux driver
>     AXUDP    - coded from Linux driver
>     BPQ    - coded from Linux driver
>     AX.25    - coded from V2.2
>     APRS    - coded from V1.0.1 and 2 addenda
>     NETROM    - coded from a postscript doc and "listen" code
>     Flexnet    - coded from flexnet.[ch] from wampes
>     ROSE    - uses existing X.25 dissector
>
> I have:
>     a Multi-kiss spec by Karl Medcalf (WK5M).
>     a request and spec (circa 2003) for OpenTRAC.
>     a request for a heuristic dissector for AXUDP
>
> My current plan:
>     o - update KISS to include Multi-KISS and correctly handle
>         the escape codes.
>     o - add an OpenTRAC dissector
>     o - document how to to register the wanted UDP ports for AXUDP
>         using an LUA script. I have attempted to create
>         a heuristic dissector for AXUDP, unfortunately the
>         resulting dissection is unstable with some packets
>         not being dissected and some by the wrong protocol
>         entirely.
>
> Anything else anyone feels should be on the list?
>

