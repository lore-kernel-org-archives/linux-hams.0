From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Simple BBS, again, sorry for asking twice.
Date: Wed, 25 Dec 2002 04:11:45 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212250359470.1372-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0212240010320.10548-100000@jeeves.mvw.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212240010320.10548-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

On Tue, 24 Dec 2002 mvw@mvw.net wrote:

> a) I should know this, but how can I get telnet to only work on the radio 
> ports and not on the ethernet port? I.e. telnet (unencrypted) only from 
> the ax25 ports.

RH uses by default xinetd so this should be easy. The directory 
/etc/xinetd.d/ has all the config stuff. Creative use of the "bind" and 
"only_from" keywords should solve this for you.

Just as an example I have on our club BBS a setup where a telnet to one of
amprnet IP's assigned to that box goes to LinuxNode and another to the FBB
BBS. A telnet to the "commercial" IP address goes to a regular Linux login
(well, would go if it were enabled -- of course only SSH is allowed over
the Net). And these are all at the default telnet port (23).

> b) I use tcp/ip for mail etc. But apart from that I would like to set up a 
> simple messaging system/bbs, to use when someone goes to this system using 
> ax25. I do not need "do it all" systems, just a simple bbs (and it's a 
> 1200 bps port, so a simple one with little text would be great). 
> Suggestions, all?

Other than a full FBB BBS, not really. Hessu started writing something to 
this extent but I think that was never finished.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

