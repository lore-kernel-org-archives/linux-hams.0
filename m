From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: ax25ipd.c routing
Date: Mon, 07 Dec 2009 21:11:36 -0800
Message-ID: <4B1DE008.1080306@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de> <4B1D5F4A.7050002@junglevision.com> <20091207202650.GM19524@x-berg.in-berlin.de> <4B1D84C4.8000206@exemail.com.au> <20091207235111.GS19524@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091207235111.GS19524@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

http://www.mataga.net/mataga/ax25ipdke6i.diff

Here's a link to the change I made to ax25ipd.  This is a diff
versus the rc2 version.   It hasn't been tested that much,
but it does work for me.

It's pretty basic.  It reads ip addresses and callsigns
using code taken from the test version.  But then it stores the
matching route/Callsign in a btree, and uses this btree to
retrieve the correct ip during sending.  It does fix the issue
shown in the logs I created earlier.

It doesn't deal with the route IP's changing.  Currently, I just
print a message when this happens.  It only addresses the issue
of user callsigns.
