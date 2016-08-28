From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: Re: [PATCH v05 69/72] uapi rose.h: glibc netrose/rose.h header file
 compatibility fixes
Date: Sun, 28 Aug 2016 08:59:18 +0300
Message-ID: <20160828055918.GZ5399@lakka.kapsi.fi>
References: <1471890809-4383-1-git-send-email-mikko.rapeli@iki.fi>
 <1471890809-4383-70-git-send-email-mikko.rapeli@iki.fi>
 <57C06258.8000807@bfs.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57C06258.8000807@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org

On Fri, Aug 26, 2016 at 05:38:00PM +0200, walter harms wrote:
> perhaps this not tested snipped would make sure that
> you have included linux/rose.h ?
> 
> #ifndef ROSE_KERNEL_H
> #include <linux/rose.h>
> #endif
> 
> #include <netrose/rose.h>

Sorry, I did not quite get this.

<linux/rose.h> has conflicting definitions with glibc <netrose/rose.h>.
The patches fixes the uapi headers <linux/rose.h> so that it hides
definitions if <netrose/rose.h> from glibc was already included.

-Mikko
