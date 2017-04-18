From: f6bvp <f6bvp@free.fr>
Subject: Re: Interesting Rose patch
Date: Tue, 18 Apr 2017 20:12:27 +0200
Message-ID: <3f92ac20-83dd-bd1a-55c4-28912c8982af@free.fr>
References: <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <8dc528da-6d60-0fc4-4d6f-fa78b1f4ba86@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8dc528da-6d60-0fc4-4d6f-fa78b1f4ba86@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Cc: C Schuman <k4gbb1@embarqmail.com>, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>, Basil Gunn <basil@pacabunga.com>

Hello David,

Walter's suggested to modify Richard's rose patch 3/6.

List:       linux-netdev
Subject:    [PATCH 3/6]NET:AX25:ROSE  Traps calls to rose_route_frame
with a NULL ax25 callback
From:       Richard Stearn <richard () rns-stearn ! demon ! co ! uk>
Date:       2016-07-16 9:43:59

This patch intends to remove a kernel panic cause due to ax25 parameter 
that

is fatal when, locally generated NULL argument, in calling ax25cmp() 
function later in the code.

However, this is a separate issue from "rose waiting to be free" and as 
such it should committed separately from the other.

I agree that NULL ax25 could be checked more early at the beginning of 
rose_route() and I will consider moving it at the top of rose_route().

Then I will report the result.

Bernard


Le 18/04/2017 à 18:14, David Ranch a écrit :
>
> Hey Bernard,
>
> Do you want to consider testing with Walter's modification to 
> Richard's patch mentioned on April 12th (below)?
>
> --David
>

