From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Running Listen
Date: Thu, 9 Dec 2004 08:26:44 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0412090825060.29098@eskimo.com>
References: <620c905704120905527c439dc@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905704120905527c439dc@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Thu, 9 Dec 2004, Chuck Hast wrote:

> I am trying to run listen as a non-root user. I have checked the permissions
> and group stuff, all appears Ok, it I run it as root, it takes off just fine,
> but if I run it as a non-root user I get this error:
> socket: Operation not permitted

Have you tried setting the SUID bit?

That allows it to run as root no matter who started it.  Just set
the owner to root and then set that bit using chmod.

Note that there are security implications to this.  If someone else
can gain control of that program while it's running (through buffer
overflows usually), then they can gain root access of your system.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
