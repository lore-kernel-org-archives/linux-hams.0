From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: node 0.3.1 connect_to: connect: No buffer space available
Date: Sun, 4 May 2003 10:48:09 +0100
Sender: linux-hams-owner@localhost
Message-ID: <C5ljraBZHOt+Ewq9@skywaves.demon.co.uk>
References: <r8056KAd6Lt+Ewfs@skywaves.demon.co.uk>
 <BKEGKPICNAKILKJKMHCACEFDCKAA.Riley@Williams.Name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BKEGKPICNAKILKJKMHCACEFDCKAA.Riley@Williams.Name>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Riley Williams <Riley@Williams.Name>
Cc: linux-hams@vger.kernel.org

Hi Riley



In message <BKEGKPICNAKILKJKMHCACEFDCKAA.Riley@Williams.Name>, Riley 
Williams <Riley@Williams.Name> writes
>Hi Paul.
>
> >> Anyone got pointers to this error.
> >>
> >> Internet search has not come up with an answer.
> >> Do I have control over the buffer referred to?
> >>
> >> Occurred since I added encap routes to my server's gateway
> >>
> >> Q> T 44.131.10.55
> >> Q> GB7CR:CRNODE CRCHAT:GB7CIP-5 connect_to: connect:
> >> Q> No buffer space available
>
> > Still tracking this down, not a node error after searching around
> > the Internet for clues.  Seems to be a general error message.
> >
> > Eventually located the following in the kernel log in the early
> > hours.....Lots of these messages
> >
> > Now to find out how many 'neighbour' are allowed. may be related to
> > the number of active interfaces I have operational on my system
> >
> > May  3 20:29:52 gb7cip kernel: neighbour table overflow
> > May  3 20:29:57 gb7cip kernel: neighbour table overflow
> > May  3 20:30:02 gb7cip kernel: neighbour table overflow
> > May  3 20:30:07 gb7cip kernel: neighbour table overflow
> > May  3 20:30:12 gb7cip kernel: neighbour table overflow
> > May  3 20:30:17 gb7cip kernel: neighbour table overflow
> > May  3 20:30:22 gb7cip kernel: neighbour table overflow
>
>This sounds like a fairly well known problem connected with ARP. The
>Linux kernel has a smallish limit on the number of ARP entries it can
>handle, and one needs to run arpd (the ARP daemon) if one expects to
>need more than that.
>
>ARP as referred to above has to do with TCP/IP - specifically with the
>IP part thereof - and is primarily connected with Ethernet interfaces.
>However, the problem it solves is equally applicable to AX.25 in its
>NETROM and TCP/IP-over-AX.25 modes, so could be related.
>
>Also, a message every five seconds? Looks like it's been rate-limited.
>That tends to be done for messages where an error tends to reoccur once
>it first occurs, so it's obviously something that's been foreseen...
>
>Best wishes from Riley G7GOD / KB8PPG

Thanks for the tip on the arpd demon, saw reference to that on an Inet 
search. Though it was a message a few years old.

I agree it's pointing to the Arp table (now known as neighbour - took me 
awhile to track (remember that)

I will try that, sounds like the answer I am looking for.

Found this document that gave me some more upto date background

http://www.fokus.gmd.de/linux/HOWTO/pdf/Adv-Routing-HOWTO.pdf
Paul g4apl

-- 
paul@skywaves.demon.co.uk
