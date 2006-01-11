From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: another gmfsk compile prob
Date: Wed, 11 Jan 2006 21:28:32 +0200
Message-ID: <1137007712.2683.3.camel@oh2bns.ampr.org>
References: <43C4E708.3050005@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43C4E708.3050005@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard <richard.bown@blueyonder.co.uk>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Wed, 2006-01-11 at 13:07, richard wrote:

> ...
> In file included from /usr/include/gtk-2.0/gdk/gdk.h:50,
>                   from /usr/include/gtk-2.0/gtk/gtk.h:31,
>                   from /usr/include/libgnomeui-2.0/gnome.h:4,
>                   from ../../src/main.h:32,
>                   from mfsktx.c:42:
> /usr/include/gtk-2.0/gdk/gdkscreen.h:51: error: syntax error before
> 'cairo_font_options_t'
> ...

This is really strange. To me it looks like the (gdk?) libraries/
headers are broken in this machine. All gmfsk does here is
#include <gnome.h> and it results in this...

Does any other gnome app compile cleanly on this machine?

-- 
Tomi Manninen / OH2BNS / KP20JF74

