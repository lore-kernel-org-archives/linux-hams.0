From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 05:58:54 -0800
Message-ID: <1138629532.7628.2.camel@CO>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
	<d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
	<Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ted Gervais <ve1drg@av.eastlink.ca>
Cc: Jeremy Utley <jerutley@gmail.com>, linux-hams@vger.kernel.org

Easiest way is to use minicom (terminal program) to make the changes in
the tnc. There maybe ways to do this using echo to send data to the
serial line (/dev/ttyS0), I find it just as easy to use minicom.

Good luck!

Willie, WJ3G

On Mon, 2006-01-30 at 01:47, Ted Gervais wrote:
> On Sun, 29 Jan 2006, Jeremy Utley wrote:
> 
> > On 1/29/06, Ted Gervais <ve1drg@av.eastlink.ca> wrote:
> >> What is the command to take my kpc-9612 out of kiss mode and also to put it
> >> back in kiss.
> >> I want to do this from a linux console rather than through an
> >> application.  Just a simple way of bringing up an empty terminal  on my
> >> linux machine and typing in something that will talk to the tnc.
> >
> > I don't know about the 9612, but on both the KAM and KPC3 to drop out
> > of KISS mode into normal mode, you sent a series of 3 ASCII characters
> > - ASC 192, ASC 255, ASC192.  In the old days I did this via the
> > Alt+numeric keypad method.  I suspect the 9612 is the same, as
> > Kantronics has usually stayed pretty stable with their command set.
> 
> Alright.  I remember that.
> 
> >
> > To shift back into KISS mode, you must have the "command" prompt, not
> > be in convers mode - then just sending the commands "interface kiss"
> > followed by "reset" will place the KAM into KISS mode.
> 
> 
> Yes.  But can you get into the "command" prompt from a linux console??
> Or is that only possible using Dos.??
> 
> >
> > Hope this helps!
> >
> > Jeremy
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> ---
> Ted Gervais
> Coldbrook, Nova Scotia
> Canada. (ve1drg)
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

