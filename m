From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: making apps
Date: Fri, 28 Mar 2003 02:53:57 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030328025357.B17832@pull.privacy.nb.ca>
References: <000001c2f4d3$4d4e0230$8c01a8c0@HP713A>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c2f4d3$4d4e0230$8c01a8c0@HP713A>; from dexy@ihug.co.nz on Fri, Mar 28, 2003 at 02:39:42PM +1200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dexter N Muir <dexy@ihug.co.nz>
Cc: linux-hams@vger.kernel.org

On Fri, Mar 28, 2003 at 02:39:42PM +1200, Dexter N Muir wrote:
> Hi all
> 
>   Starting out with Mandrake 9.0, and trying to get ax25 up.  Looked at
> pa3gcu's page, and followed instructions.  Everything worked except make
> on ax25-apps-0.0.6, which bombed while making call.  Of course, it all
> scrolls up and off the screen - can someone point me to how to look at
> this (working at command prompt Ctrl-Alt-F1, so no xterm scrollbar :-),
> so I can see better where exactly the bomb-out is?  It's repeatable.

Shift-PageUp will allow you scroll up, provided you have not
switched virtual consoles since the error message was printed.

Look for the first compiler error and/or warning message, this is 
the best place to start.

I'll make a wild guess that you do not have the ncurses header (include)
files installed, which you can find in a RPM package called ncurses-devel
or similiar. You should be able to find it on your Mandrake CDs or
from a FTP mirror.

73,
 ve1mct

