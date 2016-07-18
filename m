From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH v2] ax25-tools: mheard
Date: Mon, 18 Jul 2016 17:50:57 +0200
Message-ID: <20160718155057.GL24846@x-berg.in-berlin.de>
References: <1468767193.20047.2.camel@trentalancia.net>
 <20160717182948.GK24846@x-berg.in-berlin.de>
 <1468786480.20047.4.camel@trentalancia.net>
 <578CE6C6.1070902@bfs.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <578CE6C6.1070902@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: linux-hams@vger.kernel.org

Thank you for your comment.

> my i asc why you use strcpy/ctime in the first place ?

It's old code, written abt 20-25 years ago.

> 	strftime(lh, sizeof(lh),"%Y-%m-%d %H:%M:%S",tm);

Yes, it's nicer than "Thu Jul 14 19:08:49 2016", and more economic to read.
I hope such a change would not break any script users may have written
during the last decades.

vy 73,
	- Thomas  dl9sau
