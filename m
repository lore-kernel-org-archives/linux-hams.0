From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Pc/rig interface for packet
Date: Thu, 1 May 2003 11:05:09 -0700 (PDT)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.33.0305011103190.605-100000@wapiti.tc.fluke.com>
References: <20030501180055.GK10769@mahler.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030501180055.GK10769@mahler.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Markowski <mm@UDel.Edu>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Thu, 1 May 2003, Mike Markowski wrote:

> now want to get back to getting a packet radio set-up up &
> running.  The user mode soundmodem & kernel (2.4.20) w/mkiss
> support is now compiled, though I haven't finished going through
> the HOWTO to get everything else set up - that AX.25 HOWTO seems
> to go on and on...  :-o

If you're interested in APRS on Linux, the Xastir package supports
serial port KISS and the soundmodem program supports a KISS mode
where it looks like a serial KISS device.  Connect the two together
and you're up and running without having to set up AX.25 kernel
networking.  Just another option.

If you're interested in other kinds of packet, Xastir won't help you
there.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

