From: Chuck Gelm <nc8q@gelm.net>
Subject: Re: FBB... any more help?
Date: Thu, 26 Dec 2002 21:50:59 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E0BC013.988C639A@gelm.net>
References: <Pine.LNX.4.44.0212261846390.27818-100000@jeeves.mvw.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

Hi, Mike:

 I know much more about you now.  I can understand better
why you ask the questions that you do.  

 I ran KA9Q's NET from 1988-1989,
(DOS)WA7MBL from 1989-1990,
(DOS) AA4RE from 1990-2001,
 DOS    FBB from 1999-2000,
 WIN    FBB from 2000-2001,
   XFBB for awhile in 2001.
I used G8BPQ node code from 1990-2001.

 I agree that the FBB docs do not seem to assume that this is
one's first installation.  I first tried FBB in last half of 1999.
My favorite pBBS was not being supported at that time and the
'y2k' bug was fast approaching.  FBB was being supported at that
time so I was trying to switch to FBB.  The 'docs' seemed to 
assume that one was upgrading from the old v5.15 (IIRC) and the
installer was familiar with the style and configuration.  
Alas, I was not.
:-(
 I had been using G8BPQ node code for a decade and, thankfully,
I could configure FBB to use G8BQP node too. :-)

 At first I used the DOS version. 
I was startled to find that there were no provisions to
'monitor' what was happening on the ports. ! :-(
Gosh, it was so nice to watch a forward session to see
what was errant in a script file.  FBB was like flying blind!
:-(
 Later when there were no RF paths in or out of the LAN, I 
added the Windows version on another PC and picked up an
internet telnet feed.

 I did successfully install v7.04h within the last year.
However, I found no human activity and the only nodes
I can hear are all single port nodes and they are all
on the same frequency (145.01 MHz).  I could find no
packet on 222-225 MHz nor 440-450 MHz.  :-(

 What are the Canadian Amateur Radio Rules in regard to
the 802.11b devices?  Here in the USA, channels 1 through
6 fall entirely within our 2390 - 2450 MHz band.

 Imagine 11 Megabits per second!  Quite an upgrade from
300 baud, eh?  These 100mw transceivers are selling from
40 USD and up.  With the addition of dish antennas (75 USD)
they have proven reliable for LOS distances of up to
20 miles.  Of course, LOS is the difficult part. :-|

 Since you are fluent in TCP/IP and it is 'easy' to
encapsulate AX.25 in IP datagrams, imagine how easy
it could be to link network nodes for 1200 baud users.
;-)

HTH,  Chuck
 

mvw@mvw.net wrote:
> 
> OK Chuck, here we go:
> 
> >> 1. Can I get bulletins via the Internet instead of via radio?
> >  Yes.
> 
> OK. Sorry to ask, but how? I assume you mean wait for the offers by
> telnet as you mention elsewhere: OK, that suits me fine, I'll wait.
> 
> >> Not sure any remaining bbs's in my area to give me a feed.
> 
> >  I am baffled by this statement.
> 
> Well, I used to run a bbs on our local VHF LAN frequency with a feed from
> another local station on UHF: but he has stopped doing packet. I am not
> sure anyone else still does. Background: I have been asked to run a BBS
> for local emergency purposes. But while I am at it, bulletins may be a
> nice addition. Since there is less and less packet I am pretty sure no
> local sysops will object. The reactions are either positive or "don't
> care about packet anymore".
> 
> I think packet radio is vastly underrated. The reason I am asking all
> these questions here about BBS's is that local message storage is a nice
> addition, but IMHO, tcp/ip is the real power. I mean:
> 
> - To get bits across my cell phone I pay $0.10 per kB or something.
> Amateur bits are free.
> 
> - When my home cable connection goes down, I get to wait 2-3 weeks for a
> repair van. The amateur infrastructure is under my own control. And
> reliable.
> 
> - In emergencies, cell and Internet access will go down. My ham packet
> station will not.
> 
> And keep in mind, I am trying to make a contribution! I have many PCs
> available, and I have static IP's (I can be a gateway), and I have many
> TNCs and radios available. And stable power, battery backups, good
> antennas, and as an ex telecomms engineer I understand reliability. (My
> packet station has now been up for 3 years with zero errors; last reboot
> 370 days ago at my instigation).
> 
> Yet when I ask here, no-one appears interested.
> 
> And begging everyone's forgiveness, I am not all that up on packet: my
> professional life is Internet and tcp/ip, so that I understand.  This
> means I will sometimes ask silly questions and show my ignorance about
> ax25 and BBS's. Bear with me! ;)
> 
> >  Umm, if you set up no forwarding, it is a
> > "no forwarding to ax25 bbs network" pbbs.  :-|
> 
> I see - so by default fbbs does not forward? I am handicapped by the fact
> that all the docs assume you know all this stuff. I used to, 25 years ago:
> I knew all bout 300 baud modems, Fidonet etc - but I have forgotten all
> that stuff and fbb docs are very unforgiving of people who have forgotten
> stuff they knew a quarter century ago!  :-)
> 
> > If you are not going to forward, why have a 'full featured' pbbs?
> 
> Aha, good question. I asked here for simple BBS's: TNC functionality would
> indeed have done: that is what I was looking for. But as I read it,
> everyone here said "use FBB, as everyone else does", and indeed there are
> no other alternatives, it appears. I am a pretty good reader, so point me
> to the docs and I am happy to read 'em.
> 
> (That explains my occasional frustration too. Point me to the docs, and
> then there are no docs, o0r as in FBB's case, they are hopelessly
> contradictory and outdated. Leaves guys like me in a bind)
> 
> > A 'built into the TNC PMS' does what you have mentioned.
> 
> But for TCP/IP I need to set the TNC to KISS, so that built-in
> functionality is not available...
> 
> Cheers, and thx for the help so far,
> 
> Michael VA3MVW
