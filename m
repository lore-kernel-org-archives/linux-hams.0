From: mvw@mvw.net
Subject: Re: ax25 pakcet problem: any ideas?
Date: Fri, 27 Dec 2002 15:00:51 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212271459340.4022-100000@jeeves.mvw.net>
References: <Pine.LNX.4.44.0212272110040.1392-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212272110040.1392-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

Tomi,

OK, I shoudl check this. Worth nothing that other transmissions (ax25) do 
work, and also, va3am was able to connect fine. So perhaps the problem is 
more likely to be on the va3mvw side. Not sure what to look for but 
that's where my efforts will now concentrate.
Thanks as always.

Michael

On Fri, 27 Dec 
2002, Tomi Manninen wrote:

> On Fri, 27 Dec 2002 mvw@mvw.net wrote:
> 
> > But when I open by bbs, the first
> > packet is 255 characters long, and is never heard, The next packets are 
> > shorter and are always heard.
> 
> This is just a guess, but the lenght of the packet might not be the issue.  
> It could be that the txdelay at VA3OAK is too short, thereby distroying
> the start of the packet. That would cause behaviour like this. (I'm 
> assuming both packets are sent in one go.)
> 
> 

