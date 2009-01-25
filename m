From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Sat, 24 Jan 2009 22:02:15 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0901242044100.4122@wapiti.we7u.net>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net> <alpine.LNX.1.10.0901191336440.22828@wapiti2.we7u.net> <alpine.LNX.1.10.0901231008510.23524@wapiti2.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0901231008510.23524@wapiti2.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, 23 Jan 2009, Curt, WE7U wrote:

> As things stand now:
>
> *) Unproto packets to/from Xastir over the port are working fine.
>
> *) Ax25d and/or axspawn have problems with respect to the automatic
>   account creation.
>
> *) Connected mode using axspawn loses LOTS of data.  It might be
>   useful to test another connected-mode AX.25 app to see where the
>   problem lies, in the AX.25 modules or in axspawn.

Today at the ham brunch n7ipb and kd7nm were present among others.
N7ipb and myself connected our laptops with a null-modem cable and
had KISS ports configured on each.  I ran ax25d and had axspawn
configured to launch from it.

Ken had no problems running SSH over that connection after he
created his initial account via connected-mode and I manually
changed his password as root.

Ax25d and axspawn demonstrated the same bugs I reported before.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
