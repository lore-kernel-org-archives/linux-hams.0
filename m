From: Curt Mills <archer@eskimo.com>
Subject: Re: Run app on login
Date: Sat, 13 Nov 2004 19:53:57 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0411131952180.1435-100000@wapiti>
References: <200411132106.58898.budr@netride.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200411132106.58898.budr@netride.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bud Rogers <budr@netride.net>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 13 Nov 2004, Bud Rogers wrote:

> On Saturday 13 November 2004 20:47, Chuck Hast wrote:
> > Folks,
> > I am trying to figure out how to have a particular application start
> > up when a user logs in with a specified login.
> > Example,
> > User logs in with "radio"  password "hamradio"
> > Instead of bringing up a prompt, I want a login of radio to start up
> > a special application. I am sure that Linux can do it, just not quite
> > sure how to do so.
>
> Anything you put in a user's .bashrc or .bash_profile will be run
> whenever that user logs in.  You can have it set up things in your
> environment, or run certain commands.  Man bash will give you the
> details.

Another method is to create a special user "radio" and make the
shell for that user be the application you want to run.  When the
application is exited the person is logged out.  The shell is the
last entry on the line in the /etc/passwd file.  Change from
"/bin/bash" to the path/filename of the executable.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

