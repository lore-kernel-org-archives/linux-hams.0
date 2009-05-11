From: "Andrew Errington" <a.errington@lancaster.ac.uk>
Subject: Re: USB Interface II & Linux
Date: Mon, 11 May 2009 13:40:44 +0900 (KST)
Message-ID: <60069.125.248.153.122.1242016844.squirrel@webmail01.lancs.ac.uk>
References: <4A07A613.1060600@n6ws.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A07A613.1060600@n6ws.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

On Mon, May 11, 2009 13:14, Bill Shell wrote:
> All,
>
>
> I've had some success in using the USB Interface II with my Acer Aspire
> One netbook with Ubuntu 9.04 using fldigi.  I'm still having a problem
> with initialization of the interface.  If I initialize it with the microHAM
> router from an instance of XP in a virtualbox, I'm able to then close down
> XP, start the fldigi app, and have successful communications
> to and through the interface.  If I try it without starting the microHAM
> router under XP it fails to pass data.  Without initialization, I can see
> the data going to the interface, but the interface doesn't respond and
> doesn't pass any data.  It looks as though some initialization needs to
> flow to the interface before it starts allowing communications with the
> radio.  Does anyone have any information on the initialization data for
> the USB Interface II?

Interesting...

Maybe you could use the 'tee' command to split off the data stream to the
serial device so you could observe it (or send it to a log file for
analysis).  I'm not sure that 'tee' is ideal, but it's perhaps a good
starting point.

Here's something to pick the bones out of:
<http://www.usenet-forums.com/linux-general/89089-two-applications-listening-one-serial-port.html>

This one's a bit more specific:
<http://www.linuxquestions.org/questions/linux-software-2/serial-port-spy-452667/>

This one's specially for this purpose:
http://linux.die.net/man/1/slsnif

This might also help, but I haven't bothered trawling through it:
<http://kerneltrap.org/mailarchive/openbsd-misc/2008/10/30/3862384>

After you have captured the startup sequence it is trivial to replay it
before you start fldigi.  Even if the startup sequence is a little more
complex, it would be quite easy write a very simple program or script to
interact with the device before handing control over to fldigi.

Actually, once you've got it working you could pass on your findings to
the fldigi developers.

Of course, I could be wrong.

Of course, you could ask the manufacturer.

73,

Andrew
ZL3AME

