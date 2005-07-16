From: Chuck Hemker <n2por@amsat.org>
Subject: Re: Listen root only
Date: Sat, 16 Jul 2005 00:32:47 -0400
Message-ID: <20050716003247.3290240f.n2por@amsat.org>
References: <620c9057050715180279131307@mail.gmail.com>
	<20050716021652.GA4343@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050716021652.GA4343@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-hams@vger.kernel.org

On Sat, 16 Jul 2005 12:16:52 +1000
Hamish Moffatt <hamish@cloud.net.au> said:

> listen needs to open a socket to receive all traffic (like packet
> sniffing on ethernet), which only root can do. So listen must be
> either run by root, or run as root using setuid.

I understand the logic that only root can sniff packets and such.

However with several protocols not using connected packets (aprs,
satellites, bouncing packets off the ISS, etc) it seems to me to
possibly cause more security problems then it solves.  It seems like
things that would use UDP in the TCP/IP world end up having to run as
root with its related problems.

I just wish there was a better way.
