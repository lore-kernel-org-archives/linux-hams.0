From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Soundmodem hangs all USB keyboard or mouse input -- and soundmodem
 0.16: fix the AFSK modulator for 300 baud operation
Date: Mon, 9 Apr 2012 14:37:46 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1204091433220.11164@DadsBox.we7u.net>
References: <1330736067.25864.15.camel@vortex> <4F51E964.9080605@bfs.de>   <1330786027.2248.33.camel@vortex> <4F537D4A.6040507@bfs.de>   <1330892180.2083.84.camel@vortex> <4F776E14.7090104@trinnet.net>   <1333379832.2112.15.camel@vortex> <4F7B199F.3050104@trinnet.net>
   <1333647291.2605.34.camel@vortex> <1333741818.4064.20.camel@vortex>  <4F7F7A2C.2030500@trinnet.net> <1333809855.2433.10.camel@vortex> <4F80CA6B.4010204@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:content-type;
        bh=ac8NIeKM1YF94VfV1WEl+M2edNB1UHOnqNYJ7G00z10=;
        b=FtsdMS0CPSbm+zlbRgODWpV6zcrgd8dmB2CLbs/c04oO/J0dv9u9fdWT0qwDjEPP/F
         HOaKJyzaMHojHMnbLEV+sUb+hVD0+UmgpK91qP+KvVSnrRxExTDJ6BXNCpUFrqt4dC9/
         ZBSdmfXNFEEybfk45QizdPBKjaRb2tDnitQBhNPS5QUuYBajrSXQ84Bj2kVzPt4c1dK5
         HkQonnyBF9gKJQYnecw8D1f1zWvVu0or6iox+PD0OeffWSCrhU4j6cxY3fkN/SIVSBVp
         G6Bc7YpXc3UTuzRiP6U4nxby8eZEjZZQmwRIWIiPx3MvtiHYB0sCezuXZ95rnuVkyNMR
         5pgw==
In-Reply-To: <4F80CA6B.4010204@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Guido Trentalancia <iz6rdb@trentalancia.com>, t.sailer@alumni.ethz.ch, Linux Hams <linux-hams@vger.kernel.org>

On Sat, 7 Apr 2012, David Ranch wrote:

> I've CCed the Linuxhams group as I'm curious if any of you have any thoughts 
> on why Soundmodem would be shutting down all USB-based keyboard and mouse 
> functionality until the process is killed!  In all my years of Linux, I've 
> never need something like this.  Very strange and any/all comments would be 
> very much appreciated!

I've seen something kind of like it on my motherboard at home that has an NVidia 8200 chipset integrated in.

If I plug in _any_ USB 1.x devices, the whole Linux USB stack crashes and I lose keyboard/mouse (if they're USB).

It's a known problem with the NVidia chipset and the USB 1.x controller they integrated into it.  Their USB 2.x controller doesn't have the problem.

My fix:  Plug in a USB smart hub, plug the USB 1.x devices into that:  The motherboard only sees USB 2.x protocol and everything works great.

The device that caused it in my case:  A USB SignaLink box that I use to do digital modes on HF.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Wiki:  http://info.aprs.net/
