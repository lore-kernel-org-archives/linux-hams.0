From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: packet/soundmodem questions
Date: Sun, 25 Jan 2004 19:43:35 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401251943.35916.n7bfs@qwest.net>
References: <200401251159.28252.n7bfs@qwest.net> <200401251750.47408.n7bfs@qwest.net> <20040125190823.0f0eaaaf.washer@trlp.com>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040125190823.0f0eaaaf.washer@trlp.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

On Sunday 25 January 2004 19:08, James Washer wrote:
> The soundmodem setup was relatively simple. All worked fine on my desktop
> box. I'm got an issue with the laptop transmitting, but I'm sure I'll get
> around that.
>
> Compile a kernel with AX.25, AX.25 Level2, and MKISS, then run soundmodem
> in userland.

Umm I was under the assumption that I could load AX25 as a module under 
SuSE...

Is it required to compile AX25 into the kernel as you mention? or is it ok to 
load as a module?

Also will soundmodem run while I am running ALSA/ARTS on my X session ?

tnx for the input :)

Doug

>
> If you follow the directions EXACTLY for building and installing the AX.25
> tools, apps, and library ( make sure to do the 'make installconf' step )
> everything pretty well falls into place.
>
> Write if you hit a snag.
>
>  - jim
>
> On Sun, 25 Jan 2004 17:50:47 -0800
>
> "Douglas Cole" <n7bfs@qwest.net> wrote:
> > On Sunday 25 January 2004 15:08, James Washer wrote:
> > > I've been working on this very issue for a couple of days on my IBM
> > > X600 thinkpad, and will give it a shot soon on my T21.
> > >
> > > So far, the receive is fine, but I'm not transmitting yet. The
> > > soundcard is only producing what sounds like framing bits.. No data
> > > yet.
> > >
> > > If you installed the AX.25 tools package, just do 'man -k AX.25' to see
> > > a list of tools that were installed.
> > >
> > > Keep in touch with how things are going on your T23.
> > >
> > >  - jim
> >
> > Thanks James for the input, I was hoping to get some input ala userland
> > style as I am not experienced in the Linux packet realm, so it appears
> > that I have lots of reading to do, since when I did the man command you
> > provided above it listed a mass of entries that I am totally unfamiliar
> > with...
> >
> > It may be easier for me to just go buy a used tnc, but then again where
> > is the fun in that ?  ;^}
> >
> > I will try to share my experiences with my T23 once I get an idea of
> > where "square one" is...
> >
> > 73
> >
> > Doug
> >
> > > On Sun, 25 Jan 2004 11:59:28 -0800
> > >
> > > "Douglas Cole" <n7bfs@qwest.net> wrote:
> > > > Have been following the list for a while now and got interested in
> > > > the soundmodem thread...
> > > >
> > > > I too would like to get soundmodem up and running so as to be able to
> > > > run 1200 baud packet from my laptop (IBM thinkpad T23) and have done
> > > > a small amount of searching but have not found any documentation on
> > > > soundmodem, or at least so little that it leaves me wondering how to
> > > > make things work...
> >
> > 
