From: Dennis Boone <drb@msu.edu>
Subject: Wireshark ax25 dissector
Date: Tue, 01 Mar 2022 12:33:17 -0500
Message-ID: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Reply-To: drb@msu.edu
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-ID: <77336.1646155997.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Folks,

I'm having trouble getting Wireshark's ax25 dissector to process
callsign filters properly.  I can't get _anything_ to match.  I've tried
expressions like:

    ax25.src ~ "KB8ZQZ"
    ax25.src ~ "KB8ZQZ-0"
    ax25.src ~ KB8ZQZ
    ax25.src ~ KB8ZQZ-0

and the equivalents with ax25.dst.  I've tried various callsigns which
are in the capture file I'm examining.  The source and destination
columns in the packet browser are filled in rationally.

debian sid
wireshark 3.6.2-1
5.16.0-1-amd64 #1 SMP PREEMPT Debian 5.16.7-2 (2022-02-09) x86_64
GNU/Linux

Does anyone know of something different I should be doing?  A known bug?

Thanks,

de KB8ZQZ
