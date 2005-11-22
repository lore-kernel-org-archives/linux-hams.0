From: Chuck Hast <wchast@gmail.com>
Subject: Re: YAM/Tekk help
Date: Tue, 22 Nov 2005 10:01:48 -0500
Message-ID: <620c90570511220701x7cfadb78t9ffb81dd8ae10d97@mail.gmail.com>
References: <20051116151748.GN3241@goldengate.vpizza.org>
	 <4382C162.7090202@onr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4382C162.7090202@onr.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ad5oo@arrl.net
Cc: linux-hams@vger.kernel.org, Jim Meehan <jmeehan@vpizza.org>

On 11/22/05, David Rivenburg <driven@onr.com> wrote:
> Jim Meehan wrote:
> > Problem 1:
> >
> > If I ping from either side, that machine sends out ARP requests endlessly.
>
> Just a quick sanity check: did you set the ping interval to something
> higher than 3 seconds?  The round trip time for radio pings is about 3
> seconds, and if you use something less (like the default of 1 second)
> the pingee will have a hard time getting an out an arp reply between the
> pingers requests.
>
> > Problem 2:
> >
> > The link is not reliable.  Right now, I've got the txdelay set to 300 ms on
> > both sides, and I'm still getting 3 or 4 percent packet loss with 64 byte
> > pings.
>
> Only 3-4%?  That's actually pretty good.  Reliable 9600 baud packet is
> practically nonexistant without using hardware specifically designed for
> 9600 baud baseband fsk.  I am not aware of any commercial radio or tnc
> that is.  They may *try* to do 9600, and even have modest success with
> it, but they are flawed from the start and cannot be counted on for
> reliable operation.

The 8100 series Tait radios are designed as "data radios" with voice as a
add on. The IF is all DSP and there are 6 tap points for audio in both the
RX and TX paths. I have used two of them on a link and seen what were
almost no retries over a several day period. You can find out more about
them by going to:
www.taitworld.com,
Also PacComm Packet radio systems can sell you the radios, you can
give Linda a call a 813.874.2980

These radios a VERY good, I used then in a moble 9k6 data application
for a gov. project, and those are the only radios that group will use now.

--
Chuck Hast
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
