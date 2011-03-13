From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Why screw with the AX.25 configs?
Date: Sun, 13 Mar 2011 13:02:59 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103131241240.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:user-agent
         :mime-version:content-type;
        bh=+PrfwtbWSczypbfkcKZIkSsWh+oTnCz879r3IIIhPAY=;
        b=UkGWI/Msw57ph0MG2TkaJgT1atbsHiy7D71UTl3SE1jw+cc06Uj4gNPZcJH2EP79Oz
         rBffJxrafiAWGNqZYFdzp2kbT/iVdldAe06jfkxUPvkkg7SMncAv45r87u1upKvvmSYD
         r1+i3FiJ1G8EEAnoBjchbxqt8YYG/7hSpp72w=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


So why, after sweating over a working config, does it become non-working after some time with Linux?

I've had a config that I've tweaked from time to time, but now it appears to work differently in OpenSuSE-11.3.

Specifically:

*) I used to be able to name an AX.25 port nearly anything I wanted.  For instance I have one called "aprs" and used to use one called "opentrac" also.  It appears now that the "aprs" port is forced to be called "ax0" in "ifconfig", plus something calls "ifup" which sends nasty-grams to /var/log/messages complaining about no config file.  This used to work fine near as I can recall, but perhaps there was always some cross-connect between "ax0" and "aprs"?  Where does the "ax0" come from?  Is it hard-coded into the driver now?  I'm not even using the stuff in /etc/sysconfig/ so "ifup" shouldn't be complaining about anything.

*) I used to set my route specifically with something like:

     sbin/route add -net 44.0.0.0 netmask 255.0.0.0 dev ax0

But now a route is automatically set for me when I bring up the port.  If I want to have multiple AX.25 ports (and I do), I must remove the auto-created route then create the more specific routes I need.  Seems like a waste of effort.

I just tried to create a new port called "tcp220", which resulted in a new port listed in "ifconfig" called "ax1", and a new route auto-set to use it.  I didn't have "ax1" anywhere in my configs at the time.

Xastir's AX.25 HOWTO wiki page, which I wrote and tested a while back, has "aprs" in the axports file but uses "ax0" in the route.  Confusing!  My current script to bring up the port has the route command commented out 'cuz a default one was being created for me and the manual one just errored-out.

What it looks like from my perspective:  A cross between at least two methods of configuring ports.  If we've migrated to a new method, that one should be documented and the old one should be disallowed.  If either method should still work, then _all_ of either method should still work.

I'd really like to know where the hard-coded ax0/ax1 stuff is getting brought in.  That's a big step backwards.  It's much nicer and easier to read to have names like "opentrac", "aprs", or "tcp220" while configuring or using the ports.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
The world DOES revolve around me:  I picked the coordinate system!"
