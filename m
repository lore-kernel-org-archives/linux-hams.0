From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: different AX25.H files with same names
Date: Sun, 14 May 2006 12:11:44 +0200
Message-ID: <44670260.2050105@ccr.jussieu.fr>
References: <20060506223800.GA4419@linux-mips.org> <4465D18F.5070405@ccr.jussieu.fr> <20060513144258.GA3640@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060513144258.GA3640@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org


Ralf Baechle DL5RB wrote :
> On Sat, May 13, 2006 at 02:31:11PM +0200, Bernard Pidoux wrote:
> 
>> By the way, its a long time since I want to ask if there is any reason 
>> to keep the same name for different ax25.h include files.
>>
>> /usr/include/netax25/ax25.h
>> /usr/src/linux/include/linux/ax25.h
>> /usr/src/linux/include/net/ax25.h
>>
>> Somehow it may be confusing.
> 
> One for building applications, one for the kernel itself.
> 
> 73 de DL5RB op Ralf
> 
> --
> Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

I understand that these files have different usage.
This is why I think that they should have different names.

Here is the content of /usr/src/linux/include/linux/ax25.h
----------------
/*
  * These are the public elements of the Linux kernel AX.25 code. A similar
  * file netrom.h exists for the NET/ROM protocol.
  */

#ifndef AX25_KERNEL_H
#define AX25_KERNEL_H
----------------

So why not rename it ax25_kernel.h

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

