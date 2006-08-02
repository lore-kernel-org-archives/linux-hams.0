From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: soundmodem won't decode 300 baud signals?
Date: Thu, 3 Aug 2006 08:39:41 +1000
Message-ID: <20060802223941.GA30169@cloud.net.au>
References: <44D0BC51.6050709@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44D0BC51.6050709@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Aug 02, 2006 at 10:53:05AM -0400, Joe Veldhuis wrote:
> There was a very similar question posted here back in November 2005 
> which never got an answer, so I guess I will have to ask again. I've 
> been trying to receive 300 baud packet signals via HF with soundmodem, 
> and have had no luck thus far. I have a channel configured with these 
> settings on the Demodulator tab:
> 
[..]
> When receiving a signal, the diagnostic screen shows that the modem is 
> just detecting a solid string of '1's. The app seems to be able to 
> decode 300 baud packets sent over FM from another computer running 
> soundmodem with the same settings.
> 
> Is this supposed to work? If so, what am I doing wrong?

At a glance at the source code, 300 baud isn't supported, so I don't
know how you got 300 baud from another computer to be detected. Was that
running soundmodem also, or some other implementation?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
