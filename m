From: Robert L Cochran <cochranb@speakeasy.net>
Subject: [Fwd: Re: How Do I Get Packets To Show On My Terminal Window?]
Date: 18 Mar 2003 23:44:00 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1048049041.1650.48.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

-----Forwarded Message-----

From: Robert L Cochran <cochranb@speakeasy.net>
To: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: How Do I Get Packets To Show On My Terminal Window?
Date: 18 Mar 2003 23:24:20 -0500

Hi Everyone,

Yes I am in TERMINAL mode.

Another person on this forum suggested I tune into 144.390 MHz instead
of 145.010 and I'm definitely able to get packets and see them on
Minicom. Fascinating! And really exciting too. For some reason, there
seems not to be any traffic on 145.010 that my TNC can understand and my
friend thinks that is very strange. However he has not done packet in
some years (8 at least). 

I'm using a Kenwood TR-7950 and an MFJ 2 meter antenna, the cheap kind
that is a mag mount. 

One other thing, I haven't actually completed all the work specified in
the AX25 How-To. I just have the Kantronics connected to the radio, the
computer and the antenna and I'm relying on that to see the packet
streams. There was a delay getting even this far for a few weeks because
we needed to custom order 6-pin microphone connectors to connect the
radio to the Kantronics. Then there were mistakes soldering the
connectors. I think the connectors are now finally done right.

I'm at the point where I've recompiled my kernel for AX.25 support, and
have modules.conf changed, and have installed the suggested AX.25
utilities such as libax25. I have not worked with the config files yet.
I will continue with this soon.

How come I can see the APRS traffic on 144.390 just fine but nothing on
145.010? I live in Greenbelt, Maryland which is between Washington, DC
and Baltimore, Maryland.

And yes, I do need to take baby steps. I'm very much a baby at this! I'm
also deaf, meaning I can't hear the radio.

If anyone wants to attempt to connect to me on 145.010 for the next 30
minutes or so, give it a try. No guarantees we can connect, but I'm
here. 

73,

Bob Cochran
KB3JCM


On Tue, 2003-03-18 at 23:01, M Taylor wrote:
> 
> The 'listen' command will work wonderfully if your TNC is in KISS mode,
> like yours and mine is, but Robert's TNC appears to be in TERMINAL or NEWUSER
> (a limited subset of the commands in TERMINAL) mode.
> 
> Of course, I think Robert should take baby steps and make sure things
> are working with his computer and TNC setup in TERMINAL mode before
> trying to setup a AX25 station using KISS mode, IMHO.
> 
> I'm out of ideas as to why things aren't working, assuming that Robert
> checked that his HBAUD setting is 1200 (not 300), and that the Carrier
> Detect ('CD') is INTERNAL (or SOFTWARE, but INTERNAL is default afaik).
> Does 'MHeard' suggest that the TNC is decoding any packets? Does listening
> to the audio from the transceiver sound loud and "squaky" rather than
> quiet hissing like? 
> 
> 
> Cheers,
>  -ve1mct
> 
> On Tue, Mar 18, 2003 at 09:10:31PM -0500, Jim Johnson - KC4HW wrote:
> > I am using red hat 7.2 and kernel 2.4.18 with DXSpider.  I use the listen 
> > command to see what is going on with the TNC...  Within a new terminal 
> > window and to see both received and transmitted packet: listen -ap 
> > <portname> 
> > 
> > Hopefully this will help...  
> > 
> > On 18 Mar 03, at 2:58, M Taylor wrote:
> > 
> > > On Mon, Mar 17, 2003 at 09:05:04PM -0500, Robert L Cochran wrote:
> > > > Hello,
> > > > 
> > > > I'm a new ham and I'm trying to set up packet radio on Linux. I have a
> > > > Kenwood TR-7950 connected to a new KPC-3 Plus. After 2 attempts at
> > > > resoldering the radio port cable to the connectors, I now beleive the
> > > > KPC-3 is recieving packets because I can see the 'Rcv' light turn on now
> > > > and then, sometimes for long periods. It goes on and off and seems very
> > > > active.
> > > > 
> > > > I am using Red Hat 8. Connected to the KPC-3 Plus using minicom. I have a
> > > > 'cmd:' prompt on my minicom window, and the KPC-3 responds to my
> > > > commands. MONITOR is on. ABAUD is set to 9600. The KPC-3 has my call sign
> > > > in it (KB3JCM).
> ...
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



