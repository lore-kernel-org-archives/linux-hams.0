From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Linux AX.25 Socket programming
Date: Thu, 2 Jan 2003 16:44:35 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0301021642200.19643-100000@wapiti.tc.fluke.com>
References: <1041473560.10921.9.camel@edith>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1041473560.10921.9.camel@edith>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kelly Black <kelly.black@penguinpackets.com>
Cc: Linux Hams mailing list <linux-hams@vger.kernel.org>

On 1 Jan 2003, Kelly Black wrote:

> O.K. Thanks for the tip.  Can you get the callsign or other environment
> info from the environment ( $ENV ?) as well like a CGI script does.

Yes.  Very easily:

    $display=$ENV{"DISPLAY"};


> I will probably still write the program in C though as I was impressed
> at how well I was able to view a curses based application via TCP/IP
> over AX.25, and was floored by its responsiveness.

Remember though that Perl is a compiled language as well.  It just
happens to compile it each time you invoke it.  It's very fast.

Perls strongpoint is in ripping apart text and reconstructing it in
various ways.  It does most everything else as well.


> One of my reasons for re-writing the existing application is to make
> user training simple by providing a simple interface option instead of
> just the terse command line option that exists now.

There's also PerlTk.  Not a bad way to get a program with a GUI up
and running in a hurry.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

