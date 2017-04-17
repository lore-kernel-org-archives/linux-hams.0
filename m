From: f6bvp <f6bvp@free.fr>
Subject: Re: Interesting Rose patch
Date: Mon, 17 Apr 2017 18:27:10 +0200
Message-ID: <d9ec1dea-19ac-2ae4-f9ef-ac39876507d7@free.fr>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net>
 <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net>
 <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr>
 <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net>
 <3d0e170e-3995-84d0-007e-3d2065296237@free.fr>
 <9f9dba49-c2a5-41e8-9382-9154802e7fbf@trinnet.net>
 <20170327163641.0f992e2d@brox.localnet>
 <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr>
 <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <6bd2a0b4-12b0-0de0-7bc2-e911d3ab4446@free.fr>
 <a4f993a0-b12a-f3e6-455c-16ea2da28737@trinnet.net>
 <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Ranch <dranch@trinnet.net>, Basil Gunn <basil@pacabunga.com>
Cc: C Schuman <k4gbb1@embarqmail.com>, linux-hams@vger.kernel.org, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>

Hello David,

I missed something important that needs some explanation.

Port names in fpac.nodes sample file I provided are "axudp"

Obviously those Port names should be edited according to your 
/etc/ax25/axports file !

And the following comment line should be removed in that file :

# FPAC ROSE route configuration file
#
# This file is in /usr/local/etc/ax25/fpac.nodes
#
# List of adjacent nodes
#

Bernard



Le 17/04/2017 à 18:15, f6bvp a écrit :
> Hello David,
>
>
>
> Le 13/04/2017 à 16:57, David Ranch a écrit :
>>
>> Hey Bernard,
>>
>> So how would you like to proceed here?  I can apply you patch to a 
>> kernel and see if my machine remains stable.  If you have a test plan 
>> you can share to reproduce issues, I can go through that as well.  
>> Beyond that, I don't actively use ROSE today. After that, I imagine 
>> we should get the patches signed off and submitted upstream.
>>
>> --David
>> KI6ZHD
>>
>>

