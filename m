From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Wireshark ax25 dissector
Date: Tue, 1 Mar 2022 10:59:20 -0800
Message-ID: <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net>
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: drb@msu.edu, linux-hams@vger.kernel.org


Hello Denis,

I have Wireshark 3.2.3 on Ubuntu 20.04 decoding packets on the ax0 
interface and while the ax25_nol3 dissector seems to work ok, the 
standard ax25.src dissector doesn't seem to work for me either. Might be 
worth doing a bug search to see if this is something already known or 
create a new issue if none are found.

--David
KI6ZHD


On 03/01/2022 09:33 AM, Dennis Boone wrote:
> Folks,
>
> I'm having trouble getting Wireshark's ax25 dissector to process
> callsign filters properly.  I can't get _anything_ to match.  I've tried
> expressions like:
>
>      ax25.src ~ "KB8ZQZ"
>      ax25.src ~ "KB8ZQZ-0"
>      ax25.src ~ KB8ZQZ
>      ax25.src ~ KB8ZQZ-0
>
> and the equivalents with ax25.dst.  I've tried various callsigns which
> are in the capture file I'm examining.  The source and destination
> columns in the packet browser are filled in rationally.
>
> debian sid
> wireshark 3.6.2-1
> 5.16.0-1-amd64 #1 SMP PREEMPT Debian 5.16.7-2 (2022-02-09) x86_64
> GNU/Linux
>
> Does anyone know of something different I should be doing?  A known bug?
>
> Thanks,
>
> de KB8ZQZ

