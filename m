From: "f6bvp@free" <f6bvp@free.fr>
Subject: [PATCH] ax25tools mheard : don't display empty records
Date: Tue, 06 Aug 2013 19:57:51 +0200
Message-ID: <5201391F.40607@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org>
Reply-To: f6bvp@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

mheardd daemon application, as part of ax25tools, collects all heard 
callsigns on AX.25 devices into a data base
together with times and dates of first time and last time heard.

I noticed that in some cases, mheard would read data base and list a 
number of empty lines with zero packet received.
Empty lines displayed roll up the list and sometime makes uncomfortable 
the reading of captured callsigns.

With this patch mheard client will display only usefull information and 
skip empty records.

Patch and updated source can be downloaded from ve7fet Lee's "unofficial 
repository":

https://code.google.com/p/linuxax25/source/list

73 de Bernard, f6bvp


