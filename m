From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Linux Soundmodem help required
Date: Fri, 2 May 2003 16:09:40 -0700 (PDT)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.33.0305021608070.605-100000@wapiti.tc.fluke.com>
References: <MKEMIADGOFJHLPNBFLBAKEPNCEAA.malc.davies@tesco.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <MKEMIADGOFJHLPNBFLBAKEPNCEAA.malc.davies@tesco.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: malcolm davies <malc.davies@tesco.net>
Cc: linux-hams@vger.kernel.org

On Fri, 2 May 2003, malcolm davies wrote:

> dev '/dev/ttyS0' neither a parport or serport
> cannot start PTT output

Check permissions to see if a normal user can write to that port.
You can either change permissions on the port or add your user to
the group that owns that port.

Try the /dev/cua0 port instead.  That's another way to access the
same port.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

