From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH] ax25tools mheard : don't display empty records
Date: Wed, 7 Aug 2013 10:17:54 +0200
Message-ID: <20130807081754.GE18314@x-berg.in-berlin.de>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org>
 <5201391F.40607@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5201391F.40607@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "f6bvp@free" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

Hello Bernard,

please send us a diff for the official tree.

vy 73,
	- Thomas  dl9sau

On 2013-08-06 19:57:51 +0200, f6bvp@free <f6bvp@free.fr>
wrote in <5201391F.40607@free.fr>:
> Hi,
> 
> mheardd daemon application, as part of ax25tools, collects all heard
> callsigns on AX.25 devices into a data base
> together with times and dates of first time and last time heard.
> 
> I noticed that in some cases, mheard would read data base and list a
> number of empty lines with zero packet received.
> Empty lines displayed roll up the list and sometime makes
> uncomfortable the reading of captured callsigns.
> 
> With this patch mheard client will display only usefull information
> and skip empty records.
> 
> Patch and updated source can be downloaded from ve7fet Lee's
> "unofficial repository":
> 
> https://code.google.com/p/linuxax25/source/list
> 
> 73 de Bernard, f6bvp
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
