From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH v2] ax25-tools: mheard
Date: Mon, 18 Jul 2016 17:58:18 +0200
Message-ID: <578CFC9A.7010801@bfs.de>
References: <1468767193.20047.2.camel@trentalancia.net> <20160717182948.GK24846@x-berg.in-berlin.de> <1468786480.20047.4.camel@trentalancia.net> <578CE6C6.1070902@bfs.de> <20160718155057.GL24846@x-berg.in-berlin.de>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160718155057.GL24846@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org



Am 18.07.2016 17:50, schrieb Thomas Osterried:
> Thank you for your comment.
> 
>> my i asc why you use strcpy/ctime in the first place ?
> 
> It's old code, written abt 20-25 years ago.
> 
>> 	strftime(lh, sizeof(lh),"%Y-%m-%d %H:%M:%S",tm);
> 
> Yes, it's nicer than "Thu Jul 14 19:08:49 2016", and more economic to read.
> I hope such a change would not break any script users may have written
> during the last decades.
> 


Of cause you can also use the pattern for ctime() but so its more easy to get
rid of unwanted artifacts. (i have actually seem code where people parsed the
output of ctime()). One #ifdef can get you the old pattern back.

note:
 instead of using mktime() you can use gmtime() and avoid funny effects with time zones.

re,
 wh


