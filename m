From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: On line Callbook service
Date: Wed, 11 Aug 2004 19:06:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040811190656.A25836@pull.privacy.nb.ca>
References: <51501.192.168.1.15.1091855706.squirrel@192.168.1.15> <002101c47f5d$f4b7f880$6a7ea8c0@geo> <20040811094056.GB23764@office.n7xy.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040811094056.GB23764@office.n7xy.net>; from nielsen@oz.net on Wed, Aug 11, 2004 at 02:40:56AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Aug 11, 2004 at 02:40:56AM -0700, Bob Nielsen wrote:
> > 
> > Any  "telnet xxx <call>"  sites?
> > 
> 
> Hi Bill,
> 
> I don't know of any which are quite that simple.  'telnet
> callsign.ualr.edu 2000' or 'telnet wm7d.net 5000' will connect you to
> interactive servers for the FCC database.  Either of these would be easy

Using HTTP servers may also be of interest with command line tools
such as wget, curl, lynx, elinks, Perl's LWP.

e.g. wget http://www.rac.ca/cgi-bin/cgiwrap/rac/callbook?QueryText=ve3tix&QueryType=call&perpage=25
or whatever to retrive data from QRZ.com (or rac.ca/callbook).

