From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Usermode Soundmodem & TTY problems
Date: Fri, 24 Oct 2003 08:47:01 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0310240845080.12192-100000@wapiti.tc.fluke.com>
References: <OFBAAAADE1.9F6E9FCC-ONE9256DC9.0021434C-E9256DC9.0021F3F8@LocalDomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <OFBAAAADE1.9F6E9FCC-ONE9256DC9.0021434C-E9256DC9.0021F3F8@LocalDomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matthew.cook@tekelek.com.au
Cc: linux-hams@vger.kernel.org

On Fri, 24 Oct 2003 matthew.cook@tekelek.com.au wrote:

> Ok I hadn't thought to grep for standard out (*slaps fingers*) nor
> redirecting the output, I'
> ll try that tonight.   Otherwise those lines get pulled, thanks for the
> pointers :-)

You can also just start it up like this:

    (program 2>&1) > /dev/null

That redirects STDERR to STDOUT inside a subshell (the
parenthesis), then redirections STDOUT to NULL.  Works for most
things.  You can use a similar method to make sure you get all
messages to a log file, both STDOUT and STDERR.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

