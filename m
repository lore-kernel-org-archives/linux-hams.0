From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: How Do I Get Packets To Show On My Terminal Window?
Date: Wed, 19 Mar 2003 04:01:57 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030319040157.A26641@pull.privacy.nb.ca>
References: <1047953104.1472.10.camel@bobcp4.lingpgmr.com>; <20030318025824.B20480@pull.privacy.nb.ca> <200303190209.h2J29p14011976@ms-smtp-01.tampabay.rr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200303190209.h2J29p14011976@ms-smtp-01.tampabay.rr.com>; from jim@kc4hw.net on Tue, Mar 18, 2003 at 09:10:31PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>


The 'listen' command will work wonderfully if your TNC is in KISS mode,
like yours and mine is, but Robert's TNC appears to be in TERMINAL or NEWUSER
(a limited subset of the commands in TERMINAL) mode.

Of course, I think Robert should take baby steps and make sure things
are working with his computer and TNC setup in TERMINAL mode before
trying to setup a AX25 station using KISS mode, IMHO.

I'm out of ideas as to why things aren't working, assuming that Robert
checked that his HBAUD setting is 1200 (not 300), and that the Carrier
Detect ('CD') is INTERNAL (or SOFTWARE, but INTERNAL is default afaik).
Does 'MHeard' suggest that the TNC is decoding any packets? Does listening
to the audio from the transceiver sound loud and "squaky" rather than
quiet hissing like? 


Cheers,
 -ve1mct

On Tue, Mar 18, 2003 at 09:10:31PM -0500, Jim Johnson - KC4HW wrote:
> I am using red hat 7.2 and kernel 2.4.18 with DXSpider.  I use the listen 
> command to see what is going on with the TNC...  Within a new terminal 
> window and to see both received and transmitted packet: listen -ap 
> <portname> 
> 
> Hopefully this will help...  
> 
> On 18 Mar 03, at 2:58, M Taylor wrote:
> 
> > On Mon, Mar 17, 2003 at 09:05:04PM -0500, Robert L Cochran wrote:
> > > Hello,
> > > 
> > > I'm a new ham and I'm trying to set up packet radio on Linux. I have a
> > > Kenwood TR-7950 connected to a new KPC-3 Plus. After 2 attempts at
> > > resoldering the radio port cable to the connectors, I now beleive the
> > > KPC-3 is recieving packets because I can see the 'Rcv' light turn on now
> > > and then, sometimes for long periods. It goes on and off and seems very
> > > active.
> > > 
> > > I am using Red Hat 8. Connected to the KPC-3 Plus using minicom. I have a
> > > 'cmd:' prompt on my minicom window, and the KPC-3 responds to my
> > > commands. MONITOR is on. ABAUD is set to 9600. The KPC-3 has my call sign
> > > in it (KB3JCM).
...
