From: Bob Nielsen <nielsen@oz.net>
Subject: Re: On line Callbook service
Date: Wed, 11 Aug 2004 02:40:56 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040811094056.GB23764@office.n7xy.net>
References: <51501.192.168.1.15.1091855706.squirrel@192.168.1.15> <002101c47f5d$f4b7f880$6a7ea8c0@geo>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002101c47f5d$f4b7f880$6a7ea8c0@geo>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 10, 2004 at 09:44:56PM -0700, Bill Vodall wrote:
> 
> So...   what's available these days for setting up an
> online callbook system to be access from RF (uronode, etc)?
> 
> Any  "telnet xxx <call>"  sites?
> 

Hi Bill,

I don't know of any which are quite that simple.  'telnet
callsign.ualr.edu 2000' or 'telnet wm7d.net 5000' will connect you to
interactive servers for the FCC database.  Either of these would be easy
to use as a custom mailbox command.  

In the DX Spider code, there are perl routines for retrieving callsign
information from WM7D, QRZ and DB0SDX (a DX callsign database) which
could probably be adapted to a single retrieval (QRZ requires
registration, I believe).

> What about systems for downloading the raw data and running the
> server locally?   I know JNOS has a couple options but I'm
> looking for something at the Linux system level.
> 

Xastir has an example of this, which could probably be adapted (the FCC
database is a BIG file!)

73,
Bob, N7XY
