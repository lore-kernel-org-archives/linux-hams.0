From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Serial extenion cable...
Date: Thu, 9 Mar 2006 06:58:09 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0603090657250.12513@eskimo.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net>
 <Pine.SUN.4.58.0602210817400.27517@eskimo.com> <440FBEBF.9020908@nwp.ampr2.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <440FBEBF.9020908@nwp.ampr2.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill <vodall@nwp.ampr2.net>
Cc: linux-hams@vger.kernel.org

On Wed, 8 Mar 2006, Bill wrote:

> Sorry to bug folks again if I brought this up last summer, but the need
> for an "serial tunnel" has again come up.
>
> I have AX25 and TNC's running on one computer.  I have applications and
> want to do testing on another computer.   They're a couple miles apart.
>   I'd like to attach the output of net2kiss (a pseudo tty) on one side
> and present another pseudo tty on the other system for the applications.
>   Probably wouldn't be too hard even with PERL but before I get
> distracted, does anybody have any leads.  I found some ser2net tools but
> they seem to be a scheme for presenting a tcp interface to a serial port
> -- just half of what I'm looking for.

Answered in Xastir FAQ, question 4.20.  "netcat" is probably your
best bet.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
