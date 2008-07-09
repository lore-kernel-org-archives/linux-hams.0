From: Dave Platt <dplatt@radagast.org>
Subject: Re: gMFSK ?
Date: Tue, 08 Jul 2008 23:07:06 -0700
Message-ID: <courier.4874558A.00001E9A@radagast.org>
References: <4873C64E.2000105@mail.tele.dk>
 <20080708213400.GN8136@n0nb.us> <48744F4A.60705@mail.tele.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <48744F4A.60705@mail.tele.dk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: erik_ja@mail.tele.dk
Cc: linux-hams@vger.kernel.org

> Trying to use Hamlib, the Rig opens the RigControl, but I cannot control 
> the tranceivers frequencies.
>
> As mentioned, I can get connected with rigctrl's commands.
>
> What am I missing ?

I found that I was having problems a few years ago with a Kenwood
TS-2000 under similar circumstances.  rigctl seemed to work OK, but
hamlib-equipped applications couldn't read out or control the
frequencies or modes.

The problem turned out to be one of command turnaround time.  The
TS-2000 requires some amount of "quiet time" after the port has been
opened, and after it has sent the response to a command, before it's
ready to receive / recognize / act on the next command.

When you run rigctl, human reaction time and typing speed limitations
provide far more than the required time.  When you run hamlib-equipped
software, it will often issue commands with little or no delay
between, and this tends to overwhelm the rig's microprocessor.  The
net result is that commands are not recognized properly by the rig,
and either elicit no response at all or a "Hunh?  Say what?" error of
some sort.

My recollection is that there is a usable workaround.  The rig
definition tables in the hamlib drivers have a "post_write_delay"
value which can be set to a suitable number of milliseconds, to slow
down the software's issuing of back-to-back commands.

I set the TS-2000 post-write delay to 50 milliseconds, and it made a
world of difference.

You may need to download the Hamlib source code, tweak the driver for
the rig to include a suitable amount of delay, and rebuild the
libraries.  If this fixes your problem, please submit a patch to the
Hamlib maintainers so that it can be incorporated into the next release.

