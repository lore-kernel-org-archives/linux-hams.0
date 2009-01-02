From: GeForce <jon.sowman@gmail.com>
Subject: ax25d not hearing incoming connection requests
Date: Fri, 2 Jan 2009 08:22:49 -0800 (PST)
Message-ID: <21253389.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hi all, need a hand here if you would be so kind. I have ax25d running, with
ax25d.conf looking like this:

[M3XYZ-1 VIA tncx]
default 1 * * * * * *  root /usr/sbin/axspawn axspawn %u

Using the "listen" command I can see the incoming connection request
packets, which look like:

tncx: fm M3XYZ-3 to M3XYZ-1 ctl SABM+

But ax25d seems to be doing nothing with them! ax25d is set to log, but
there are no entries in the syslog  related to the incoming connection. The
only ax25d entries are "starting" and "loaded config successfully" ones.

I can transmit a packet using
beacon -s tncx "hello"
without any problems, so I know both stations can tx and rx correctly.

Anyone got any ideas as to why ax25d is not responding to the connection
request?

Thanks,
Jon
-- 
View this message in context: http://www.nabble.com/ax25d-not-hearing-incoming-connection-requests-tp21253389p21253389.html
Sent from the linux-hams mailing list archive at Nabble.com.

