From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Run app on login
Date: Mon, 15 Nov 2004 07:44:56 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0411150742470.171@eskimo.com>
References: <620c9057041113184754867a6d@mail.gmail.com> <200411132106.58898.budr@netride.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
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

Or .profile.

Run when logging in:  .profile or .bash_profile

Run when any new shell/subshell is started:  .bashrc

If you're dealing with an environment where one process or one user
might start multiple shells or subshells, then you want to stick
with the .profile or .bash_profile files, as then your application
will only get run once per login.

--
Curt, WE7U			         http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
