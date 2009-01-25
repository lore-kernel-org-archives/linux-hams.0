From: Ken Koster <n7ipb@wetnet.net>
Subject: Re: Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit
Date: Sun, 25 Jan 2009 14:33:24 -0800
Message-ID: <200901251433.26055.n7ipb@wetnet.net>
References: <alpine.LNX.1.10.0901172222000.22616@wapiti2.we7u.net> <alpine.LNX.1.10.0901231008510.23524@wapiti2.we7u.net> <alpine.LNX.1.10.0901242044100.4122@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0901242044100.4122@wapiti.we7u.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Saturday 24 January 2009, Curt, WE7U wrote:
> On Fri, 23 Jan 2009, Curt, WE7U wrote:
> 
> > As things stand now:
> >
> > *) Unproto packets to/from Xastir over the port are working fine.
> >
> > *) Ax25d and/or axspawn have problems with respect to the automatic
> >   account creation.

The account creation issues should be relatively easy to troubleshoot but I
was more intrigued by the data loss issues so I'm not looking at account
creation.

> > *) Connected mode using axspawn loses LOTS of data.  It might be
> >   useful to test another connected-mode AX.25 app to see where the
> >   problem lies, in the AX.25 modules or in axspawn.

To follow up on Curt's comment,  it's probably not really axspawn or ax25d
since ultimately they just use execve to execute 'login'.   

...

I spent several hours last night with a bench test setup verifying what we saw, 
and verifying that the old releases worked.

I'm going to try again with the latest CVS now that I know where it is.

Ken,  N7IPB
