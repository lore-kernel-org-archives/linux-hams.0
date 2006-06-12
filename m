From: Kevin Dawson <kevind@esi.com.au>
Subject: Re: Which tone comes first?
Date: Mon, 12 Jun 2006 15:08:04 +1000
Message-ID: <20060612050804.GC17169@glottis.kd>
References: <448C6D95.2080007@sharon.esrac.ele.tue.nl> <courier.448C6F3D.0000325B@radagast.org> <448C71EA.60007@sharon.esrac.ele.tue.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <448C71EA.60007@sharon.esrac.ele.tue.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sun, Jun 11, 2006 at 09:41:30PM +0200, Arno Verhoeven wrote:
> On 2006-06-11 21:30, Dave Platt wrote:
> >>I'm wondering which tone comes first when we start a sequence. Should it 
> >>start with 1200 Hz or start with 2200 Hz? Or doesn't it make any 
> >>difference?
> >
> >It really doesn't matter.  Use whichever you wish, or switch
> >deterministically or randomly on each individual packet transmssion.
> >  
> Thanks. That's what I thought. But I'm having some problems with a 
> particular setup using a PIC to genrate the tones. I will have to play 
> with it some more...

Some years ago, I had a project using a CML modem and found that it
needed a few transitions for bit sync.  It didn't matter what was
sent - just the timing was needed.  That may or may not be the problem
in your case, of course, but if you can arrange for it, it might help.

Kevin
