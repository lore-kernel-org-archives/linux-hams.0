From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: ax25d not hearing incoming connection requests (fwd)
Date: Sun, 13 Mar 2011 08:51:46 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130851230.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:user-agent
         :mime-version:content-type;
        bh=bj1qfPDNXe6Ego8HjCwqp3wNKzWAIw+IXVl/3gVQJ68=;
        b=uSDnm1YmAUVvz+wotDWgJHlH5+l9zCHbk0nosKeqC9Muf6dgNl50dKUzjdKR1xeVUx
         Rj7rUp+9Prl7PkmBmTyYBuUJn6LEJYzOgym75qoKaR347kSPkZD6wlt5QygQDIzAA+fL
         gQPWRrtsjhtsug4bdmxLWMjfpsMM8z0rOycbE=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Found another that might be relevant.  Hope it helps!

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Usage Pages:  http://wetnet.net/~we7u/usage.html

---------- Forwarded message ----------
Date: Fri, 23 Jan 2009 10:23:53 -0800 (PST)
From: "Curt, WE7U" <archer@eskimo.com>
To: Jon Sowman <jon.sowman@gmail.com>
Cc: Bob <kd7nm@arrl.net>, Ken Koster <n7ipb@wetnet.net>, archer@eskimo.com
Subject: Re: ax25d not hearing incoming connection requests

On Mon, 19 Jan 2009, Curt, WE7U wrote:

> On Mon, 19 Jan 2009, Jon Sowman wrote:
> 
>> Continuing in this vein, I don't believe the conn REQ is even getting as far
>> as ax25d. Here's how I've come to this conclusion:
> 
> Stupid question (mostly because I see that later in your message you
> show ax25d as listening via netstat):  Did you start ax25d as root?
> You need root access in order to access the ax.25 ports.  That keeps
> biting Xastir users who have to set the executable as SUID Root
> before it's able to open those ports.  Running Xastir as the root
> user is a bad idea so we drop privileges in the C-code when we're
> not directly opening/closing ports.
> 
> 
>> And that line disappears if I close ax25d. So it is definitely listening,
>> but for some reason cannot hear!
> 
> Good info, sounds pretty conclusive to me that it's not listening.

In the latest on-the-air tests I started ax25d as a normal user and
of course it didn't respond.  I restarted it as root and everything
was normal, as normal as the buggy ax25d/axspawn setup I have will
allow that is.  See my latest message to the linux-hams list:  Bob
and I repeated the tests with all of the OpenSuSE-11.0 packages
updated to the latest available and came up with the same list of
bugs.  Next is to upgrade the machine to OpenSuSE-11.1 (I have it
running on three machines already, just not that one).

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
