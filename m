From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: tcp.ip over ax25, when sent?
Date: Mon, 30 Dec 2002 14:24:44 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021230032444.GA24695@silly.cloud.net.au>
References: <Pine.LNX.4.44.0212272203520.1392-100000@oh2bns.ampr.org> <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Dec 29, 2002 at 10:18:51PM -0500, mvw@mvw.net wrote:
> When I use tcp/ip over ax25, I notice that packets are sent very
> frequently when I am on the keyboard. For some applications (e.g.  using a
> BBS, which is almost character-oriented) that is suitable, but for some,
> like telnet, it is inappropriate: my telnet sessions are 'de facto'
> almost line-oriented, so it would be best if packets were sent after a CR
> *or* after a delay of, say, 500 ms. That would prevent a LOT of unwanted
> radio traffic. Right now, a 10-letter word can generate 5-10 packets, when 
> one would be enough.
> 
> I am sure I am overlooking this, but can I set this? How? 
> 
> I have of course read the HOWTO etc but no doubt skipped over this. Many
> thanks for pointing me in the right direction.

In Telnet you can get to the command prompt (usually control-]) then
use 'mode line' to switch to line mode. You may have to change some
other options after that, such as local echo. There doesn't seem to be a
way to force line mode before starting telnet.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
