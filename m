From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH v05 69/72] uapi rose.h: glibc netrose/rose.h header file
 compatibility fixes
Date: Sun, 28 Aug 2016 14:37:41 +0200
Message-ID: <57C2DB15.3050103@bfs.de>
References: <1471890809-4383-1-git-send-email-mikko.rapeli@iki.fi> <1471890809-4383-70-git-send-email-mikko.rapeli@iki.fi> <57C06258.8000807@bfs.de> <20160828055918.GZ5399@lakka.kapsi.fi>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160828055918.GZ5399@lakka.kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mikko Rapeli <mikko.rapeli@iki.fi>
Cc: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org



Am 28.08.2016 07:59, schrieb Mikko Rapeli:
> On Fri, Aug 26, 2016 at 05:38:00PM +0200, walter harms wrote:
>> perhaps this not tested snipped would make sure that
>> you have included linux/rose.h ?
>>
>> #ifndef ROSE_KERNEL_H
>> #include <linux/rose.h>
>> #endif
>>
>> #include <netrose/rose.h>
> 
> Sorry, I did not quite get this.
> 
> <linux/rose.h> has conflicting definitions with glibc <netrose/rose.h>.
> The patches fixes the uapi headers <linux/rose.h> so that it hides
> definitions if <netrose/rose.h> from glibc was already included.
> 
> -Mikko

no problem,
so far i understand the conflict arise because you need to include
linux/rose.h before netrose/rose.h

My suggestion was to add a check for linux/rose.h (ROSE_KERNEL_H)
and include it if not already done. (basicly this should work out
of the box but it seems a problem here).

I have no idea if you need to cover other cases but in my
understanding userspace programms should not include kernel headers.

re,
 wh
