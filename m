From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: RE: making apps
Date: Fri, 28 Mar 2003 12:22:15 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0303281220370.31136-100000@wapiti.tc.fluke.com>
References: <BKEGKPICNAKILKJKMHCACEBJCEAA.Riley@Williams.Name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BKEGKPICNAKILKJKMHCACEBJCEAA.Riley@Williams.Name>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Riley Williams <Riley@Williams.Name>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Fri, 28 Mar 2003, Riley Williams wrote:

>  3. Where `make` is an alias, the alias is expanded BEFORE applying
>     the redirection. This is the case where differences occur.

That's the case I most often use it.  Also:  Where I type something
from the command line like:

    (make clean;make;make install-strip) | tee make.log

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

