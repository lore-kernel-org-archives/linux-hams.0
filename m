From: John Coppens <john@jcoppens.com>
Subject: Re: Qsl.net availability
Date: Wed, 14 Apr 2004 22:12:16 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040414221216.60b54309.john@jcoppens.com>
References: <20040414192725.482d515a.john@jcoppens.com>
	<20040414224016.30670.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040414224016.30670.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

On Wed, 14 Apr 2004 15:40:16 -0700 (PDT)
Dave Platt <dplatt@radagast.org> wrote:

> John Coppens <john@jcoppens.com> wrote:
> > Hello people.
> > 
> > Since a few months, I cannot connect to www.qsl.net from where I live
> > (Argentina). I can connect with FTP, but not in HTTP (webpages). I can
> > ping www.qsl.net, Not only I can't connect to my own page, but I
> > cannot connect to any of the webpages at QSL.NET.
> 
> This site comes up just fine for me, here in California.

Hi Dave... Thanks for replying.

I gathered that other people were not having problems. And I tried to get
the page indirectly - through the w3c validation service, so I know the
server is actually up.

> > I am not ruling out a configuration problem in my Linux machine, but I
> > cannot find out why this is the _only_ site I cannot connect to.
> 
> One possibility is that the WWW.QSL.NET server machine is blocking
> TCP connections from your IP address range.
> ...
> I'm sorry to say that Argentina's ISPs are in very bad odor with
> quite a few system administrators in North America.  This is due
> to the large number of spammers, spammers' web sites, virus- and
> trojan-horse-infected client systems, "script kiddies" probing
> for security vulnerabilities, etc. found on Argentina's networks,
> and to the apparent unwillingness of the ISPs involved to respond
> to reports of these abuses or to take any visible steps to clean
> up their networks.

I agree, and I could understand the blocking of e-mails up to a certain
point, but I cannot really get why HTTP access is denied (port 80).

> Another possibility is that there's some sort of fairly selective
> routing problem involved.  What do you see if you run the command
> "/usr/sbin/traceroute www.qsl.net" from your Linux system?

I think 256 ms isn't that bad considering the long route. Here's the
traceroute output:

 1  200.3.62.232 (200.3.62.232)  55.182 ms  54.455 ms  52.888 ms
 2  33.39.3.200.telecom.net.ar (200.3.39.33)  54.702 ms  54.404 ms  56.381
ms 
 3  137.37.3.200.telecom.net.ar (200.3.37.137)  64.321 ms  60.85 ms 
64.636 ms 
 4  93.37.3.200.telecom.net.ar (200.3.37.93)  66.279 ms  67.766
ms  66.221 ms 
 5  cog01ri-pos16-0-0.tasf.telecom.net.ar (200.3.32.134) 
65.934 ms  67.774 ms  66.18 ms 
 6  bai1-telecom-argentina-2-ar.bai.seabone.net (195.22.220.37)  64.486 ms
64.302 ms  67.876 ms 
 7  new4-new2-racc1.new.seabone.net (195.22.216.30) 
206.869 ms  209.841 ms  207.15 ms
 8  500.POS4-0.GW1.EWR6.ALTER.NET (157.130.222.169)  225.093 ms  223.149
ms  228.51 ms
 9 0.so-4-0-0.CL2.EWR6.ALTER.NET (152.63.16.86)  230.348 ms 
223.489 ms 221.925 ms
 10  0.so-1-2-0.XL2.NYC4.ALTER.NET (152.63.21.13) 
218.39 ms 219.988 ms  222.167 ms
 11  0.so-7-0-0.BR1.NYC4.ALTER.NET (152.63.21.81) 218.141 ms  218.509 ms 
220.205 ms
 12  204.255.168.2(204.255.168.2) 218.735 ms  226.79 ms  218.439 ms
 13  tbr2-p011601.n54ny.ip.att.net (12.123.3.61)  221.951 ms  223.223 ms
225.202 ms
 14  tbr2-cl1.wswdc.ip.att.net (12.122.10.54)  223.58 ms  235.23
ms  224.955 ms
 15  gbr5-p40.wswdc.ip.att.net (12.122.11.186)  228.544 ms 226.64 ms 
223.45 ms
 16  ar1-p310.btmmd.ip.att.net (12.123.194.65) 227.083 ms 274.468 ms 
251.756 ms
 17  12.119.70.98 (12.119.70.98) 230.046 ms 228.45 ms  228.579 ms
 18  162.33.163.103 (162.33.163.103) 228.351 ms 228.416 ms 231.548 ms
 19  162.33.101.253 (162.33.101.253) 240.198 ms 231.899 ms 233.243 ms
 20  ***
 21  wboc-dmv.dmv.com (64.45.129.209) 233.701 ms 231.396 ms 232.031 ms
 22 wboc-att.dmv.com (64.45.144.145) 233.534 ms 231.64 ms 232.045 ms
 23 laurel-gw.dmv.com (64.45.129.81) 233.298 ms 231.672 ms 235.25 ms
 24 www3.qsl.net (64.238.2.153)  261.631 ms  307.556 ms  258.162 ms

73,
John
