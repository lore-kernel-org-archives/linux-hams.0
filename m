From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: ANNOUNCE: gMFSK v0.5
Date: Sun, 20 Apr 2003 12:37:08 +1000
Sender: linux-hams-owner@localhost
Message-ID: <20030420023708.GA22988@silly.cloud.net.au>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Apr 19, 2003 at 09:58:04PM +0300, Tomi Manninen wrote:
> Hi all,
> 
> I just uploaded gMFSK v0.5 to hes.iki.fi:
> 
>   http://hes.iki.fi/pub/ham/unix/linux/hfmodems/
> 
> There you will find a tar.gz source package, a source RPM and a binary
> i386 RPM for Red Hat 8.0.

Neat! Compiled easily on Debian and I'll upload the package shortly.
You have a great collection of modes. I'm looking forward to trying it
on air.

> Last but not least there is the name issue. The program is not anymore a 
> collection of various M-ary FSK modems, there are PSK, OFDM and Fuzzy 
> modes as well. So the name is not the best one anymore. Suggestions for a 
> new name are welcome!

Tough decision! You could always borrow parts of similar programs' names
an add a G prefix :-) Like gMix or gScope or something. But there should
be a better option.

One query about MFSK16/8 mode: when idling it still sends a lot of tones.
IZ8BLY's Stream sends a lot of pure carrier with occasional tones. The
pure carrier while idle or at the start of a transmission makes it a lot 
easier for the RX station to tune.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
