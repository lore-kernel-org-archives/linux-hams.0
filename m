From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: tncs and kiss mode
Date: Sun, 29 Jan 2006 22:29:34 -0500
Message-ID: <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 1/29/06, Ted Gervais <ve1drg@av.eastlink.ca> wrote:
> What is the command to take my kpc-9612 out of kiss mode and also to put it
> back in kiss.
> I want to do this from a linux console rather than through an
> application.  Just a simple way of bringing up an empty terminal  on my
> linux machine and typing in something that will talk to the tnc.

I don't know about the 9612, but on both the KAM and KPC3 to drop out
of KISS mode into normal mode, you sent a series of 3 ASCII characters
- ASC 192, ASC 255, ASC192.  In the old days I did this via the
Alt+numeric keypad method.  I suspect the 9612 is the same, as
Kantronics has usually stayed pretty stable with their command set.

To shift back into KISS mode, you must have the "command" prompt, not
be in convers mode - then just sending the commands "interface kiss"
followed by "reset" will place the KAM into KISS mode.

Hope this helps!

Jeremy
