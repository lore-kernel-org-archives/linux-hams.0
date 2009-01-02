From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: ax25d not hearing incoming connection requests
Date: Fri, 2 Jan 2009 10:34:27 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0901021027040.416@wapiti2.we7u.net>
References: <21253389.post@talk.nabble.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <21253389.post@talk.nabble.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: GeForce <jon.sowman@gmail.com>
Cc: linux-hams@vger.kernel.org

On Fri, 2 Jan 2009, GeForce wrote:

> Anyone got any ideas as to why ax25d is not responding to the connection
> request?

It's been a while since I've played with that stuff, but I seem to
recall that you need to send a line first so that the protocol is
known to the AX.25 kernel-mode layer.  Once the protocol is known
then the packets start getting fed to whatever applications have
registered to receive that protocol.

"Listen" is a special case in that it has registered to receive
everything.

For instance a ROSE packet might get routed to one application,
connected mode info packet to another (aprsd in this case).  Extend
this to APRS, NET/ROM, TCP, UDP, etc.

The connection packet itself doesn't specify the upper-level
protocol being used, therefore there's nothing to send to the
application at that point.

Send a blank packet immediately after the connect packet which
should pass a LF or a CRLF off to aprsd.  Aprsd should then respond.

That was one thing I had to get used to compared to similar
non-Linux systems way back when:  Sending an extra packet before the
stuff would respond to me in connected mode.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
