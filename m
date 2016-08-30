From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: Re: [PATCH v05 69/72] uapi rose.h: glibc netrose/rose.h header file
 compatibility fixes
Date: Tue, 30 Aug 2016 10:34:43 +0300
Message-ID: <20160830073443.GC2831@lakka.kapsi.fi>
References: <1471890809-4383-1-git-send-email-mikko.rapeli@iki.fi>
 <1471890809-4383-70-git-send-email-mikko.rapeli@iki.fi>
 <57C06258.8000807@bfs.de>
 <20160828055918.GZ5399@lakka.kapsi.fi>
 <65db8f70-0533-3edb-11da-5795b986a460@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65db8f70-0533-3edb-11da-5795b986a460@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: walter harms <wharms@bfs.de>, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org

On Mon, Aug 29, 2016 at 12:34:25PM -0700, David Ranch wrote:
> Hello Mikko,
> 
> Somewhat related, the ax25.h file from libax25-devel also has conflicts with
> the Glibc's ax.25.h.  This creates trouble so if we could get a fix for
> that, that would be appreciated as well though it might be a Glibc issue and
> not a kernel issue.

I'll put this to the back of my todo list. The approach could be similar to
include/uapi/linux/libc-compat.h from linux uapi headers.

-Mikko
