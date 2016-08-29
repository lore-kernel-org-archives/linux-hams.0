From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [PATCH v05 69/72] uapi rose.h: glibc netrose/rose.h header file
 compatibility fixes
Date: Mon, 29 Aug 2016 12:34:25 -0700
Message-ID: <65db8f70-0533-3edb-11da-5795b986a460@trinnet.net>
References: <1471890809-4383-1-git-send-email-mikko.rapeli@iki.fi>
 <1471890809-4383-70-git-send-email-mikko.rapeli@iki.fi>
 <57C06258.8000807@bfs.de> <20160828055918.GZ5399@lakka.kapsi.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160828055918.GZ5399@lakka.kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mikko Rapeli <mikko.rapeli@iki.fi>, walter harms <wharms@bfs.de>
Cc: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org


Hello Mikko,

Somewhat related, the ax25.h file from libax25-devel also has conflicts 
with the Glibc's ax.25.h.  This creates trouble so if we could get a fix 
for that, that would be appreciated as well though it might be a Glibc 
issue and not a kernel issue.

--David



On 08/27/2016 10:59 PM, Mikko Rapeli wrote:
> On Fri, Aug 26, 2016 at 05:38:00PM +0200, walter harms wrote:
>> perhaps this not tested snipped would make sure that
>> you have included linux/rose.h ?
>>
>> #ifndef ROSE_KERNEL_H
>> #include <linux/rose.h>
>> #endif
>>
>> #include <netrose/rose.h>
> Sorry, I did not quite get this.
>
> <linux/rose.h> has conflicting definitions with glibc <netrose/rose.h>.
> The patches fixes the uapi headers <linux/rose.h> so that it hides
> definitions if <netrose/rose.h> from glibc was already included.
>
> -Mikko
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

