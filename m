From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Canot get serial card working: It worked ONCE.
Date: Tue, 10 Dec 2002 09:27:26 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212100922580.1291-100000@wapiti.tc.fluke.com>
References: <Pine.LNX.4.44.0212101039080.29662-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212101039080.29662-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: Linux-Hams@vger.kernel.org

On Tue, 10 Dec 2002 mvw@mvw.net wrote:

> I did this and it worked once (I used minicom and was able to talk
> successfully to the TNC). I then did kissattach (which should be
> irrelevant, this should not survive a reboot and believe me, I;ve rebooted
> plenty). IN any case, it never worked again: now, when I try, I see
> nothing (no errors either). A breakout box shows no activity on pin 2 and
> RTS (pin 4) inactive (should be active). So the port may think it is not
> on.

I can think of a few possibilities right off:

1) A lock file may have been created for that port, and your
kissattach statement may not be able to delete it and take over the
port.  Check areas like /var/lock, /var/spool/lock, etc for
lockfiles.

2) Some other program (gpm?) is using that port.

3) Permissions on the /dev/cua0 or /dev/ttyS0 device may not be set
properly for that user, or perhaps you haven't added that user to
the "uucp" group (another way of handling permissions for that
port).

Is this an unusual card that might require special techniques to set
up?

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

