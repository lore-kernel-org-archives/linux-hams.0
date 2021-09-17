From: Dennis Boone <drb@msu.edu>
Subject: Re: unknown kiss packet: 0x80 0x9e
Date: Fri, 17 Sep 2021 11:34:56 -0400
Message-ID: <20210917153456.DE6B832983F@yagi.h-net.msu.edu>
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Fri, 17 Sep 2021 17:21:56 +0200.)
             <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
Content-ID: <49226.1631892896.1@yagi.h-net.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > unknown kiss packet: 0x80 0x9e
 > unknown kiss packet: 0x20 0x9e

If 0x80 and 0x20 are the second byte of the frame (after the FEND), then
they're data packets (low nibble 0) from devices addressed (high nibble)
as 8 and 2 respectively.

De
