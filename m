From: Hamish Moffatt <hamish@cloud.net.au>
Subject: remote TNC
Date: Thu, 26 Dec 2002 00:34:58 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021225133458.GA28240@silly.cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Hi all,

Merry Christmas.

Can anyone suggest solutions for using an AX.25 port (TNC, soundmodem
or whatever) remotely eg hooked up to a different computer. Here's two 
scenarios:

1. Computer A wants to transmit/receive on RF; RF port is attached to
   computer B; computers are on a local Ethernet together.

   +------------+          +------------+
   | Computer A |----------| Computer B +-- RF port (TNC etc)
   +------------+ Ethernet +------------+
     Runs application        Has RF port
     eg XASTIR

   Computer A wants to work through B transparently;
   it wouldn't have to specifically mention B in its AX.25 packet path,
   nor would frames received back by B.

2. Same but computers are connected only via IP, not necessarily on
   the same Ethernet:

   +------------+          +--------+           +------------+
   | Computer A |----------+ Router +-----------| Computer B +-- RF port
   +------------+ Ethernet,+--------+ Ethernet, +------------+
                  PPP etc.            PPP etc.
     Runs application
     eg XASTIR

   Again the application on A would like to see a standard Linux
   networking interface and think it's connected directly to RF.

On a related note, can somebody give me a good description (either here
or a URL for) for BPQ over Ethernet? Is that part of the answer to #1?
I think AX/IP (RFC 1226) is the protocol behind #2, but does linux (ie
ax25ipd) do this already?


Thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
