From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: newbie soundmodem question about mic vs line input
Date: Fri, 13 Feb 2004 19:39:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040213193911.D220@jeroen.pe1rxq.ampr.org>
References: <20040213100203.62bbe780.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040213100203.62bbe780.washer@trlp.com>; from washer@trlp.com on Fri, Feb 13, 2004 at 19:02:03 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

On 2004.02.13 19:02:03 +0100 James Washer wrote:
> 
> I've got soundmodem working using the mic jack, but I'd rather use the
> line jack. When I try, I get nothing.. hence, the following questions.
> 
> 
> 1) Under linux, are the mic and line inputs mixed, or do they have
> seperate devices to open?

Normally you can select one of the inputs and get only audio from that
input.
Open an app such as gmix and make sure the box for line in is checked.
 
> 2) I can play with the mic/line/speaker/etc gains using aumix.. Does this
> have any effect on soundmodem, or does it set the gain using ioctls, etc.

With this you control the mixer of your soundcard (and can probably select
the input source as mentioned above) and as such you have to set it in a
way that the levels that soundmodem gets are sane.

> 3) The mic jack appears to be mono, where as the line jack appears to be
> stereo. Does soundmodem have any options to listen to the two channels
> seperately? i.e. I'd like to do APRS on one channel, and packet on
> another, but I fear that /dev/dsp is a mix. Is this correct? 

In theory on a stereo soundcard you get two seperate channels. So it should
be possible, but I don't think the soundmodem code does that now...
But they will both have the same bitrate so that would limit your
possibilities a bit.

Jeroen

