From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: thanx all....
Date: Mon, 23 Aug 2004 09:36:13 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.SUN.4.58.0408230933031.25217@eskimo.com>
References: <1C166E48-F521-11D8-816F-000A95DB9E94@pocketdvm.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1C166E48-F521-11D8-816F-000A95DB9E94@pocketdvm.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Acierno <acierno@pocketdvm.com>
Cc: Linux HAMs <linux-hams@vger.kernel.org>

On Mon, 23 Aug 2004, Mark Acierno wrote:

> thanks to everyone who replied to my last post. - the suggestion were
> quite help full! I hope someone might have a suggestion for this
> current problem:
>
> I have a Sun Ultra 2 creator running debian and I am attempting to
> install xastir on it. I followed the instructions found at
> http://www.eskimo.com/~archer/README.Getting-Started and everything
> goes according to plan -I think -  until I attempt to actually run
> xastar then I get a LONG list of error most of which start with "found
> out of range or nonexistent value (0) for....." this goes on for a long
> while and the list ends with:

Those are not errors.  You get that the first time you run, it's
basically telling you that it's loading default values into your
config file.

Later when you update Xastir and new features have been added, you
may get an addition few lines like that for any new entries in your
config file that need new default values.


>   Xlib : connection to :0.0" refused by server
> Xlib: client is not authorized to connect to Server
> Error ca't open display : :0.0

That means that the display has been started up by a different user.
Who are you trying to run Xastir as?  The same user that started up
the X11 server?  Don't run Xastir as root whatever you do.

If you absolutely must run Xastir as a different user (I do it all
the time so I can test with multiple Xastir sessions at once, each
run by a different user) then you can type "xhost localhost" in
order to bypass the Xwindows security.  Be aware that this will
allow anyone logging into that machine to manipulate windows on the
Xserver.  If you're the only one using the machine, there's really
no problem.

--
Curt, WE7U			         http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
