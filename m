From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: RE: making apps
Date: Fri, 28 Mar 2003 09:39:10 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0303280936240.31136-100000@wapiti.tc.fluke.com>
References: <BKEGKPICNAKILKJKMHCAMEAGCEAA.Riley@Williams.Name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BKEGKPICNAKILKJKMHCAMEAGCEAA.Riley@Williams.Name>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Riley Williams <Riley@Williams.Name>
Cc: "Jose A. Amador" <co2ja01@fastmail.fm>, Shane <vk3bvp@qsl.net>, Linux Hams <linux-hams@vger.kernel.org>

On Fri, 28 Mar 2003, Riley Williams wrote:

> When it comes to making logs of what's going on, I generally do...
>
>            make 2>&1 | tee make.log

I do this instead:

    (make 2>&1) | tee make.log

The reason for the extra parenthesis:  It makes it run in a
subshell, and you can pipe all of STDERR from the subshell to
STDOUT, which then gets piped to "tee".

If you don't use those parenthesis and you're running something that
invokes several different scripts/programs, or an alias that has
more than two commands in it, you don't get everything piped into
the "tee" command.  With the parenthesis, you do.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

