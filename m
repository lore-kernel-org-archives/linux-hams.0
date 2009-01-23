From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Fri, 23 Jan 2009 10:19:18 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0901231008510.23524@wapiti2.we7u.net>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net> <alpine.LNX.1.10.0901191336440.22828@wapiti2.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0901191336440.22828@wapiti2.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 19 Jan 2009, Curt, WE7U wrote:

> So... I need to repeat my on-air tests with Bob using the newer
> AX.25 modules and tools to see if any or all of the bugs reported
> are still evident.  Stay tuned.

The RF tests were repeated with ALL of the SuSE-11.0 updates
applied, no differences were seen.  Each of the bugs described in my
first post on this thread were experienced again.

I've upgraded all machines but this one to OpenSuSE 11.1.  After I
upgrade it too I'll probably ask Bob to help me repeat the tests.

As things stand now:

*) Unproto packets to/from Xastir over the port are working fine.

*) Ax25d and/or axspawn have problems with respect to the automatic
    account creation.

*) Connected mode using axspawn loses LOTS of data.  It might be
    useful to test another connected-mode AX.25 app to see where the
    problem lies, in the AX.25 modules or in axspawn.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
