From: "Dexter N Muir" <dexy@ihug.co.nz>
Subject: RE: making apps
Date: Fri, 28 Mar 2003 15:59:19 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000001c2f4de$6bab2310$8c01a8c0@HP713A>
References: <20030328025357.B17832@pull.privacy.nb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030328025357.B17832@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'M Taylor' <mctylr@privacy.nb.ca>
Cc: linux-hams@vger.kernel.org

Thanks! Now can someone point me to the right version for Mandrake 9.0?
Like I said, 'starting out'... :-)
   Seems all the latest distros have dropped this package out - maybe
HOWTOs should reflect this?

Cheers all and thanks
Dex ZL2DEX

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of M Taylor
Sent: Friday, 28 March 2003 2:54 p.m.
To: Dexter N Muir
Cc: linux-hams@vger.kernel.org
Subject: Re: making apps

On Fri, Mar 28, 2003 at 02:39:42PM +1200, Dexter N Muir wrote:
> Hi all
> 
>   Starting out with Mandrake 9.0, and trying to get ax25 up.  Looked
at
> pa3gcu's page, and followed instructions.  Everything worked except
make
> on ax25-apps-0.0.6, which bombed while making call.  Of course, it all
> scrolls up and off the screen - can someone point me to how to look at
> this (working at command prompt Ctrl-Alt-F1, so no xterm scrollbar
:-),
> so I can see better where exactly the bomb-out is?  It's repeatable.

Shift-PageUp will allow you scroll up, provided you have not
switched virtual consoles since the error message was printed.

Look for the first compiler error and/or warning message, this is 
the best place to start.

I'll make a wild guess that you do not have the ncurses header (include)
files installed, which you can find in a RPM package called
ncurses-devel
or similiar. You should be able to find it on your Mandrake CDs or
from a FTP mirror.

73,
 ve1mct

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



