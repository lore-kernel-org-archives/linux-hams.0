From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 11 Dec 2002 16:32:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021211163225.C277@jeroen.pe1rxq.ampr.org>
References: <20021211133016.A14287@linux-mips.org> <Pine.LNX.4.44.0212110828110.1073-100000@jeeves.mvw.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212110828110.1073-100000@jeeves.mvw.net>; from mvw@mvw.net on Wed, Dec 11, 2002 at 14:36:25 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 2002.12.11 14:36:25 +0100 mvw@mvw.net wrote:
> Gents,
> 
> > [snip] AX.25 is about the worst protocol design
> > I've ran over in my life
> 
> That's not encouraging. Is it really that bad?
> 
> Asking becuase TCP/IP over ax.25 is the one thing that can rescue packet,

I think he was refering to ax.25 connections, tcp/ip is generally done in
UI frames, for those ax25 is not much different from e.g. ethernet.

On a side note:
What is the state of netrom? I have had only ax25 races with 2.4, netrom
seems to be stable (or atleast stable enough to let ax25 crash first :)
I am curious to what will need to change to netrom because I would have to
update my inp3 patch to it...

Jeroen

