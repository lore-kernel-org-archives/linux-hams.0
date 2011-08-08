From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 02/12] headers, ax25: Add missing #include to
Date: Mon, 08 Aug 2011 18:47:58 +0200
Message-ID: <4E40133E.9090206@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

Actually, netrom and rose files needing ax25_address types are already including :

#include<net/ax25.h>

that in turn includes :

#include<linux/ax25.h>

This is why Gcc compiler did not complain about missing ax25_address type
for it had been already declared.

Thus adding the above #include would be redundant.

Bernard, f6bvp


On Mon, Aug 08, 2011 at 02:17:20PM +0100, Ben Hutchings wrote:

>  These headers use the ax25_address type defined in<linux/ax25.h>.
>
>  Signed-off-by: Ben Hutchings<ben@decadent.org.uk>

Makes sense.

Acked-by: Ralf Baechle<ralf@linux-mips.org>

   Ralf
--

