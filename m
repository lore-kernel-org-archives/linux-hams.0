From: Dennis Boone <drb@msu.edu>
Subject: Re: Wireshark ax25 dissector
Date: Tue, 01 Mar 2022 14:27:02 -0500
Message-ID: <20220301192702.7572C28AB27@yagi.h-net.msu.edu>
References: <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net> <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 01 Mar 2022 10:59:20 -0800.)
             <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net>
Content-ID: <8656.1646162822.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I have Wireshark 3.2.3 on Ubuntu 20.04 decoding packets on the ax0
 > interface and while the ax25_nol3 dissector seems to work ok, the
 > standard ax25.src dissector doesn't seem to work for me either. Might
 > be worth doing a bug search to see if this is something already known
 > or create a new issue if none are found.

David,

Thanks for the confirmation.  I can't find a relevant bug in their
gitlab tracker, so have opened one.

https://gitlab.com/wireshark/wireshark/-/issues/17973

De
